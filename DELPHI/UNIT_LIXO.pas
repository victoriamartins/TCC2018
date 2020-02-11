unit UNIT_LIXO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, jpeg, DB, ADODB, CLIPBRD, FileCtrl;

type
  TRECUPERA_SENHA = class(TForm)
    Image6: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    QUERY_USUARIO: TADOQuery;
    ADOConnection1: TADOConnection;
    QUERY_USUARIOLOGIN_USUARIO: TStringField;
    QUERY_USUARIOSENHA_USUARIO: TStringField;
    QUERY_USUARIOTIPO_USUARIO: TBooleanField;
    Image2: TImage;
    QUERY_USUARIO_TODOS: TADOQuery;
    QUERY_USUARIO_TODOSCOD_USUARIO: TAutoIncField;
    QUERY_USUARIO_TODOSNOME_USUARIO: TStringField;
    QUERY_USUARIO_TODOSLOGIN_USUARIO: TStringField;
    QUERY_USUARIO_TODOSSENHA_USUARIO: TStringField;
    QUERY_USUARIO_TODOSFUNCIONARIO_USUARIO: TIntegerField;
    QUERY_USUARIO_TODOSDENTISTA_USUARIO: TIntegerField;
    QUERY_USUARIO_TODOSTIPO_USUARIO: TBooleanField;
    QUERY_USUARIO_TODOSSTATUS_USUARIO: TBooleanField;
    QUERY_USUARIO_TODOSDTHORACADASTRO_USUARIO: TDateTimeField;
    Image9: TImage;
    Image10: TImage;
    Label3: TLabel;
    DirectoryListBox1: TDirectoryListBox;
    procedure Image2Click(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RECUPERA_SENHA: TRECUPERA_SENHA;

implementation

uses Unit_LOGIN;

{$R *.dfm}

procedure TRECUPERA_SENHA.FormShow(Sender: TObject);
begin

  Edit1.Clear;
  Edit2.Clear;
  Edit1.SetFocus;

end;

procedure TRECUPERA_SENHA.Image10MouseEnter(Sender: TObject);
begin
Image9.Visible := true ;
end;

procedure TRECUPERA_SENHA.Image2Click(Sender: TObject);
var
  Texto : TStringList;
  Linha, Caminho, s : String;
begin

   Texto := TStringList.Create;

  with QUERY_USUARIO do
  begin
    close;
    Parameters.ParamByName('LOGIN').Value := Edit1.Text ;
    Parameters.ParamByName('SENHA').Value := Edit2.Text ;
    open;
  end;
    Clipboard.AsText := QUERY_USUARIO.SQL.Text;
   if Edit1.Text=EmptyStr then
    begin
      Application.MessageBox('Informe seu login!', 'Aten��o!', MB_ICONWARNING);
      Edit1.SetFocus;
      Exit;
    end
   else if Edit2.Text=EmptyStr then
    begin
      Application.MessageBox('Informe sua senha!', 'Aten��o!', MB_ICONWARNING);
      Edit2.SetFocus;
      Exit;
    end;

  if QUERY_USUARIO.RecordCount=0 then
  begin
    Application.MessageBox('Login e/ou senha incorreto(s)! Aten��o: voc� deve ser usu�rio administrador!', ' ', MB_ICONWARNING);
    Edit1.Clear;
    Edit2.Clear;
    Edit1.SetFocus;
  end

  else if QUERY_USUARIO.RecordCount>0 then
  begin
    if QUERY_USUARIOTIPO_USUARIO.AsBoolean = false then
    begin
      Application.MessageBox('Usu�rio inv�lido. Voc� deve ser administrador!', 'Aten��o!', MB_ICONWARNING);
      Edit1.Clear;
      Edit2.Clear;
    end;
    if QUERY_USUARIOTIPO_USUARIO.AsBoolean = true then
    begin
              QUERY_USUARIO_TODOS.Close;
              QUERY_USUARIO_TODOS.Open;
              QUERY_USUARIO_TODOS.First;

              while not QUERY_USUARIO_TODOS.Eof do
              begin
                  Linha := Linha + QUERY_USUARIO_TODOSLOGIN_USUARIO.AsString + ' ' + QUERY_USUARIO_TODOSSENHA_USUARIO.AsString + (#13#10);
                  QUERY_USUARIO_TODOS.Next;

              end;
              SelectDirectory('Selecione o diret�rio:', '', s);
              Caminho:= s;

              if s = EmptyStr then
              begin
                  Exit;
              end

              else
              begin
                  Application.MessageBox('Recupera��o conclu�da! As informa��es de usu�rios se encontram no local escolhido com o nome "RECUPERA��O_DE_SENHA".', 'Aten��o!', MB_ICONEXCLAMATION);
                  Texto.Add(Linha);
                  Texto.SaveToFile(s + '\RECUPERA��O_DE_SENHA.txt');
                  Edit1.Clear;
                  Edit2.Clear;
              end;
    end;

  end;

end;

procedure TRECUPERA_SENHA.Image9Click(Sender: TObject);
begin
UNIT_LIXO.RECUPERA_SENHA.Close;
end;

procedure TRECUPERA_SENHA.Image9MouseLeave(Sender: TObject);
begin
Image9.Visible := False;
end;

end.
