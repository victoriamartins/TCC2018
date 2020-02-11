unit Unit_BACKUP_TESTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls,FileCtrl, pngimage, jpeg, ExtCtrls,TLHelp32,ShellAPI,Clipbrd,
  DB;

type
  TBackup_TESTE = class(TForm)
    ADOConnection1: TADOConnection;
    ADOCommand1: TADOCommand;
    Image4: TImage;
    GRAVA_LOG: TADOStoredProc;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image9: TImage;
    Image10: TImage;
    DirectoryListBox1: TDirectoryListBox;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image7: TImage;
    Image5: TImage;
    Image6: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Backup_TESTE: TBackup_TESTE;

implementation

uses Unit_TELA_PRINCIPAL;

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

procedure TBackup_TESTE.Button1Click(Sender: TObject);
var
   s: String;
begin
   SelectDirectory('Selecione o diretório:', '', s);
   Edit1.Text:= s;
end;

procedure TBackup_TESTE.Image10MouseEnter(Sender: TObject);
begin

  Image9.Visible := true  ;
  Image10.Visible:=false ;

end;

procedure TBackup_TESTE.Image1Click(Sender: TObject);
var
{TAM_CAMINHO : INTEGER;
EXT_ARQUIVO : STRING;}
S_CAMINHO : STRING;
begin
  S_CAMINHO := ExtractFilePath(Application.ExeName);
  S_CAMINHO := S_CAMINHO + 'Project2.exe';


      if Application.MessageBox('Realmente deseja restaurar? O sistema será encerrado!','Confirmação',mb_iconquestion + mb_yesno) = idYes  then
     begin
        ShellExecute(Handle,'open',pchar(S_CAMINHO),nil,nil,sw_show);
        //KillTask('Project1.exe'); //NÃO TIRAR
        Application.Terminate;
     end;
end;

procedure TBackup_TESTE.Image2Click(Sender: TObject);
begin
    Panel1.Left := 18;
    Panel1.top := 10;
    Edit2.SetFocus;
    Panel1.Visible:= TRUE;
end;

procedure TBackup_TESTE.Image5Click(Sender: TObject);
begin
    Edit1.Clear;
    Edit2.Clear;
    Edit2.SetFocus;
end;

procedure TBackup_TESTE.Image6Click(Sender: TObject);
begin
    Panel1.Top:= 185;
    Panel1.Left:= 17;

    Edit1.Clear;
    Edit2.Clear;
end;

procedure TBackup_TESTE.Image7Click(Sender: TObject);
var
   ADOCommand : TADOCommand;
   data_atual, dia, mes, ano, caminho, nome : string;
   dia_c , mes_c , ano_c , hora_c : STRING;
begin
    data_atual := DateToStr(Date);
    ano := Copy(data_atual, 7,4);
    mes := Copy(data_atual, 4,2);
    dia := Copy(data_atual, 1,2);
    caminho:= Edit1.Text;
    nome:= Edit2.Text;

    if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o nome do arquivo!', 'ATENÇÃO!', MB_ICONINFORMATION);
        Edit2.SetFocus;
        Exit;
    end

    else if Edit1.Text = '' then
    begin
        Application.MessageBox('Escolha o lugar onde vai ser salvo o arquivo!', 'ATENÇÃO!', MB_ICONINFORMATION);
        Edit1.SetFocus;
        Exit;
    end;

    ADOCommand1 := TADOCommand.Create(nil);
    with ADOCommand1 do
    begin
        ADOCommand1.Name := 'ADOGeraBackup';
        ADOCommand1.ConnectionString := ADOConnection1.ConnectionString;
        ADOCommand1.CommandType := cmdText;
        ADOCommand1.CommandText := 'BACKUP DATABASE TCC TO DISK =''' + caminho + '\' + nome + '.bak''';
        ADOCommand1.Execute;
        Application.MessageBox('Backup realizado com sucesso!', 'ATENÇÃO!', MB_ICONINFORMATION);
        Panel1.Visible:= FALSE;
    end;

        dia_c := Copy(lbl_data.Caption,1,2);
        mes_c := Copy(lbl_data.Caption,4,2);
        ano_c := Copy(lbl_data.Caption,7,4);
        hora_c := Copy(lbl_data.Caption,14,8);

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Backup efetuado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;
end;

procedure TBackup_TESTE.Image9Click(Sender: TObject);
begin
Unit_BACKUP_TESTE.Backup_TESTE.Close;

end;

procedure TBackup_TESTE.Image9MouseLeave(Sender: TObject);
begin
image9.Visible := false ;
Image10.Visible := TRUE ;
end;

procedure TBackup_TESTE.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
