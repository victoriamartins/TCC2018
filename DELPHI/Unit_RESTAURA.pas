unit Unit_RESTAURA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls,TLHelp32,ShellAPI;

type
  TForm_RESTAURA = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ADOCommand1: TADOCommand;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RESTAURA: TForm_RESTAURA;

implementation

{$R *.dfm}

function KillTask(ExeFileName: string): Integer;
    const
      PROCESS_TERMINATE = $0001;
    var
      ContinueLoop: BOOL;
      FSnapshotHandle: THandle;
      FProcessEntry32: TProcessEntry32;
    begin
      Result := 0;
      FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
      ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
      while Integer(ContinueLoop) <> 0 do
      begin
        if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
          UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
          UpperCase(ExeFileName))) then
          Result := Integer(TerminateProcess(
                            OpenProcess(PROCESS_TERMINATE,
                                        BOOL(0),
                                        FProcessEntry32.th32ProcessID),
                                        0));
         ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
      end;
      CloseHandle(FSnapshotHandle);
    end;

procedure TForm_RESTAURA.Button1Click(Sender: TObject);
var
S_CAMINHO : STRING;
TAM_CAMINHO : INTEGER;
EXT_ARQUIVO : STRING;
CAMINHO : STRING;
begin
  { S_CAMINHO := ExtractFilePath(Application.ExeName);
  S_CAMINHO := S_CAMINHO + 'Project1.exe';
  //PostMessage(FindWindow(S_CAMINHO,nil),WM_CLOSE,0,0);
  KillTask(S_CAMINHO); }

  CAMINHO := '';
  ShowMessage('Por favor escolha o arquivo de backup!');
  OpenDialog1.Execute();
  CAMINHO :=  OpenDialog1.FileName;

  TAM_CAMINHO := Length(CAMINHO);
  EXT_ARQUIVO := Copy(CAMINHO,(TAM_CAMINHO-3),TAM_CAMINHO);

    if CAMINHO = '' then
    BEGIN
      ShowMessage('O arquivo não foi escolhido!');
      EXIT;
    END

    ELSE if (EXT_ARQUIVO = '.bak') then
      begin
        //CONTINUA
      end

    ELSE
      BEGIN
        ShowMessage('Por favor escolha um arquivo com extensão ".bak"');
        Exit;
      END;

  ADOCommand1.CommandText := 'use MASTER; drop database TCC; RESTORE DATABASE TCC FROM DISK = ''' + CAMINHO + ''' with replace';

   if Application.MessageBox('Confirme a ação!','Confirmação',mb_iconquestion + mb_yesno) = idYes  then
     begin
        //KillTask('PROJECT1.EXE');

        //Screen.Cursor := crSQLWait;
        ADOCommand1.Execute;
        ADOCommand1.CommandText := '';
        //ShowMessage('Restauração feita com sucesso!');
        MessageDlg('Sistema restaurado!',mtInformation,[mbOk],0);
        //Screen.Cursor := crDefault;
     end

   else
    begin
      ShowMessage('Ação não realizada!');
    end;

        S_CAMINHO := ExtractFilePath(Application.ExeName);
        S_CAMINHO := S_CAMINHO + 'Project1.exe';
        ShellExecute(Handle,'open',pchar(S_CAMINHO),nil,nil,sw_show);
        Application.Terminate;


end;

procedure TForm_RESTAURA.FormShow(Sender: TObject);
begin
    Button1Click(SELF);
end;

end.
