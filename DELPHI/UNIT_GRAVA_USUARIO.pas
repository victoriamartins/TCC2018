unit UNIT_GRAVA_USUARIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, pngimage, jpeg, DBCtrls;

type
  TFORM_GRAVA_USUARIO = class(TForm)
    ADOConnection1: TADOConnection;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    RadioGroup2: TRadioGroup;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    RadioGroup1: TRadioGroup;
    Label7: TLabel;
    Edit5: TEdit;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    ADOQUERY_FUNCIONARIO: TADOQuery;
    ADOQUERY_FUNCIONARIOCOD_FUNCIONARIO: TAutoIncField;
    ADOQUERY_FUNCIONARIONOME_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOSEXO_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIONASCIMENTO_FUNCIONARIO: TWideStringField;
    ADOQUERY_FUNCIONARIORG_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOCPF_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOENDERECO_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOEMAIL_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOCIDADE_FUNCION�RIO: TIntegerField;
    ADOQUERY_FUNCIONARIOTEL1_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOTEL2_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOSTATUS_FUNCIONARIO: TBooleanField;
    ADOQUERY_FUNCIONARIODTHORACADASTRO_FUNCIONARIO: TDateTimeField;
    DATASOURCE_FUNCIONARIO: TDataSource;
    GRAVA_USUARIO: TADOStoredProc;
    CONFERE_LOGIN: TADOQuery;
    Image4: TImage;
    GRAVA_LOG: TADOStoredProc;
    lbl_data: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_USUARIO: TFORM_GRAVA_USUARIO;

implementation

uses Unit_TELA_PRINCIPAL, Unit_USUARIOS;

{$R *.dfm}

procedure TFORM_GRAVA_USUARIO.Button1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o campo de login!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if Edit3.Text='' then
  begin
    Application.MessageBox('Preencha o campo de senha!', 'Aten��o!', MB_ICONWARNING);
    Edit3.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo de usu�rio!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  if RadioGroup2.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o status do usu�rio!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  GRAVA_USUARIO.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_USUARIO.Parameters.ParamByName('@LOGIN').Value := Edit2.Text;
  GRAVA_USUARIO.Parameters.ParamByName('@SENHA').Value := Edit3.Text;
  //GRAVA_USUARIO.Parameters.ParamByName('@EMAIL').Value := Edit4.Text;

    if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@TIPO').Value := '1' ;
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@TIPO').Value := '0' ;
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@STATUS').Value := '1' ;
  end

  else if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@STATUS').Value := '0' ;
  end;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

 GRAVA_USUARIO.Parameters.ParamByName('@DTHR_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o usu�rio?','CADASTRAR',
                              mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_USUARIO.ExecProc;
    Application.MessageBox('Usu�rio cadastrado!', 'AVISO', MB_OK);
    Image6Click(SELF);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_USUARIO.DBLookupComboBox1Click(Sender: TObject);
begin

    Label1.Enabled := TRUE ;
    Label2.Enabled :=TRUE;
    Label3.Enabled :=TRUE;
    Label7.Enabled :=TRUE;
    Edit1.Enabled := TRUE ;
    Edit2.Enabled := TRUE ;
    Edit3.Enabled := TRUE ;


  Edit1.Clear;
  Edit1.Text := DBLookupComboBox1.Text;
end;

procedure TFORM_GRAVA_USUARIO.DBLookupComboBox2Click(Sender: TObject);
begin
    Label1.Enabled := TRUE ;
    Label2.Enabled :=TRUE;
    Label3.Enabled :=TRUE;
    Label7.Enabled :=TRUE;
    Edit1.Enabled := TRUE ;
    Edit2.Enabled := TRUE ;
    Edit3.Enabled := TRUE ;

      Edit1.Clear;
  Edit1.Text := DBLookupComboBox2.Text;
end;

procedure TFORM_GRAVA_USUARIO.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key in ['0'..'9',#32] then
  begin
     key := #0;
  end;

end;

procedure TFORM_GRAVA_USUARIO.Edit2Exit(Sender: TObject);
begin
  CONFERE_LOGIN.Close;
  CONFERE_LOGIN.Parameters.ParamByName('USU').Value := Edit2.Text;
  CONFERE_LOGIN.Open;
  if CONFERE_LOGIN.RecordCount > 0 then
  BEGIN
    Application.MessageBox('Esse login j� est� em uso!', 'Erro!', MB_ICONERROR);
    Edit2.Clear;
    exit ;
  END;

end;

procedure TFORM_GRAVA_USUARIO.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_USUARIO.Edit3Change(Sender: TObject);
begin
  Edit5.Enabled := true;
  Label7.Enabled := true;
end;

procedure TFORM_GRAVA_USUARIO.Edit3Exit(Sender: TObject);
begin

  Edit5.Enabled := TRUE ;

end;

procedure TFORM_GRAVA_USUARIO.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_USUARIO.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_USUARIO.Edit5Exit(Sender: TObject);
begin

  if Edit3.Text<>Edit5.Text then
  begin
    Application.MessageBox('As senhas n�o coincidem!', 'Aten��o!', MB_ICONWARNING);
    Edit5.clear;
    Edit3.SetFocus;
    Exit;
  end;

end;

procedure TFORM_GRAVA_USUARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_USUARIOS.Form_USUARIO do
  begin
    ADOQuery1.Active := false ;
    ADOQuery1.Active := true ;
    ADOQuery2.Active := false ;
    ADOQuery2.Active := true ;
    ADOQuery3.Active := false ;
    ADOQuery3.Active := true ;
  end;

end;

procedure TFORM_GRAVA_USUARIO.FormCreate(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_USUARIO.FormShow(Sender: TObject);
begin

  ADOQUERY_DENTISTA.Active := FALSE;
  ADOQUERY_DENTISTA.Active := TRUE;
  ADOQUERY_DENTISTA.Active := FALSE;
  ADOQUERY_FUNCIONARIO.Active := FALSE;
  ADOQUERY_FUNCIONARIO.Active := FALSE;
  ADOQUERY_FUNCIONARIO.Active := FALSE;
  Image6Click(SELF);

end;

procedure TFORM_GRAVA_USUARIO.Image2MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TFORM_GRAVA_USUARIO.Image3Click(Sender: TObject);
begin
 FORM_GRAVA_USUARIO.Close;
end;

procedure TFORM_GRAVA_USUARIO.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TFORM_GRAVA_USUARIO.Image5Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if (RadioGroup2.ItemIndex=0)and(VarIsNull(DBLookupComboBox1.KeyValue)) then
  begin
    Application.MessageBox('Selecione o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  if (RadioGroup2.ItemIndex=1)and(VarIsNull(DBLookupComboBox1.KeyValue)) then
  begin
    Application.MessageBox('Selecione o funcion�rio!', 'Aten��o!', MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Exit;
  end;

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o campo de login!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if Edit3.Text='' then
  begin
    Application.MessageBox('Preencha o campo de senha!', 'Aten��o!', MB_ICONWARNING);
    Edit3.SetFocus;
    Exit;
  end;

  if Edit5.Text='' then
  begin
    Application.MessageBox('Preencha o campo de confirma��o de senha!', 'Aten��o!', MB_ICONWARNING);
    Edit5.SetFocus;
    Exit;
  end;

  if RadioGroup2.ItemIndex=-1 then
  begin
    Application.MessageBox('Escolha se o usu�rio � um dentista ou um funcion�rio!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo de usu�rio!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  GRAVA_USUARIO.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_USUARIO.Parameters.ParamByName('@LOGIN').Value := Edit2.Text;
  GRAVA_USUARIO.Parameters.ParamByName('@SENHA').Value := Edit3.Text;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@TIPO').Value := '1' ;
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@TIPO').Value := '0' ;
  end;

  //j� grava como ativo
  GRAVA_USUARIO.Parameters.ParamByName('@STATUS').Value := '1' ;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  if (RadioGroup2.ItemIndex=0)and(DBLookupComboBox1.KeyValue <> 0) then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := DBLookupComboBox1.KeyValue ;
    GRAVA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := null ;
  end

  else if (RadioGroup2.ItemIndex = 1)and(DBLookupComboBox2.KeyValue <> 0) then
  begin
    GRAVA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := null ;
    GRAVA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := DBLookupComboBox2.KeyValue ;
  end;

  GRAVA_USUARIO.Parameters.ParamByName('@DTHR_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;


  if Edit3.Text<>Edit5.Text then
  begin
    Application.MessageBox('As senhas n�o coincidem!', 'Aten��o!', MB_ICONWARNING);
    Edit5.SetFocus;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja cadastrar o usu�rio?','CADASTRAR',
                              mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_USUARIO.ExecProc;

    WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Usu�rio ' + Edit2.Text + ', c�digo n� ' + INTtOSTR(GRAVA_USUARIO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

    Application.MessageBox('Usu�rio cadastrado!', 'AVISO', MB_OK);
    Image6Click(self);
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_USUARIO.Image6Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit5.Clear;
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
  DBLookupComboBox1.Enabled := false ;
  DBLookupComboBox2.Enabled := false ;
  RadioGroup1.ItemIndex := -1;
  RadioGroup2.ItemIndex := -1 ;
  RadioGroup2.SetFocus;
  Label4.Enabled := FALSE ;
  Label8.Enabled := FALSE ;
end;

procedure TFORM_GRAVA_USUARIO.RadioGroup2Click(Sender: TObject);
begin

LABEL7.Enabled := FALSE ;

  if RadioGroup2.ItemIndex = 0 then
  begin
    Label4.Enabled := true;
    DBLookupComboBox1.Enabled := true;
    LabeL8.Enabled := false ;
    DBLookupComboBox2.Enabled := false ;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit5.Clear;
    DBLookupComboBox2.KeyValue := -1;
    Label1.Enabled := FALSE ;
    Label2.Enabled := FALSE;
    Label3.Enabled := FALSE;
    Label7.Enabled := FALSE;
    Edit1.Enabled := FALSE ;
    Edit2.Enabled := FALSE ;
    Edit3.Enabled := FALSE ;
    Edit5.Enabled := FALSE ;
    ADOQUERY_FUNCIONARIO.Active := false ;
    ADOQUERY_DENTISTA.Active:= false;
    ADOQUERY_DENTISTA.Active := true;
  end

  else if RadioGroup2.ItemIndex = 1 then
  begin
    Label4.Enabled := false ;
    DBLookupComboBox1.Enabled := false ;
    Label8.Enabled := true ;
    DBLookupComboBox2.Enabled := true ;
    DBLookupComboBox1.KeyValue := -1;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit5.Clear;
    Label1.Enabled := FALSE ;
    Label2.Enabled := FALSE;
    Label3.Enabled := FALSE;
    Label7.Enabled := FALSE;
    Edit1.Enabled := FALSE ;
    Edit2.Enabled := FALSE ;
    Edit3.Enabled := FALSE ;
    Edit5.Enabled := FALSE ;
    ADOQUERY_DENTISTA.Active := false ;
    ADOQUERY_FUNCIONARIO.Active := false ;
    ADOQUERY_FUNCIONARIO.Active := true ;
  end;



end;

procedure TFORM_GRAVA_USUARIO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
