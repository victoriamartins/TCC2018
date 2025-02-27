unit UNIT_GRAVA_FUNCIONARIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, dblookup, DB, ADODB, DBCtrls, pngimage,
  Menus, jpeg;

type
  TFORM_GRAVA_FUNCIONARIO = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ADOConnection1: TADOConnection;
    GRAVA_FUNCIONARIO: TADOStoredProc;
    DBLookupComboBox1: TDBLookupComboBox;
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    OQUEISSO1: TMenuItem;
    DATASOURCE_CIDADE: TDataSource;
    ADOQUERY_CIDADE: TADOQuery;
    ADOQUERY_CIDADENM_CIDADE: TStringField;
    ADOQUERY_CIDADECD_CIDADE: TIntegerField;
    ADOQUERY_CIDADEES_CIDADE: TIntegerField;
    ADOQUERY_CIDADECP_CIDADE: TBooleanField;
    Label9: TLabel;
    Label10: TLabel;
    ADOQUERY_UF: TADOQuery;
    DATASOURCE_UF: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    ADOQUERY_UFCD_ESTADO: TIntegerField;
    ADOQUERY_UFSG_ESTADO: TStringField;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    lbl_data: TLabel;
    GRAVA_LOG: TADOStoredProc;
    procedure MaskEdit3Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure OQUEISSO1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image6MouseLeave(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     function isCPF(CPF: string): boolean;
  end;

var
  FORM_GRAVA_FUNCIONARIO: TFORM_GRAVA_FUNCIONARIO;

implementation

uses UNIT_GRAVA_USUARIO, Unit_TELA_PRINCIPAL, UNIT_GRAVA_PAGAMENTO_FUNCIONARIO,
  Unit_FUNCIONARIOS;

{$R *.dfm}

procedure TFORM_GRAVA_FUNCIONARIO.DBLookupComboBox2Click(Sender: TObject);
begin

  with ADOQUERY_CIDADE do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT CD_CIDADE, NM_CIDADE, ES_CIDADE, CP_CIDADE FROM TB_CIDADE, TB_ESTADO WHERE CD_ESTADO=ES_CIDADE AND ES_CIDADE=' + ADOQUERY_UFCD_ESTADO.AsString);
    open;
  end;

  DBLookupComboBox1.Enabled := TRUE;

end;

procedure TFORM_GRAVA_FUNCIONARIO.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

  KEY := UPCASE(KEY);

  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key in ['0'..'9'] then
  begin
     key := #0;
  end;

end;

procedure TFORM_GRAVA_FUNCIONARIO.Edit2KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
  KEY := UPCASE(KEY);
end;

procedure TFORM_GRAVA_FUNCIONARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Unit_FUNCIONARIOS.Form_FUNCIONARIOS.ADOQuery1.Active := false ;
  Unit_FUNCIONARIOS.Form_FUNCIONARIOS.ADOQuery1.Active := true ;

end;

procedure TFORM_GRAVA_FUNCIONARIO.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_FUNCIONARIO.FormShow(Sender: TObject);
begin
Image8Click(SELF);
end;

procedure TFORM_GRAVA_FUNCIONARIO.Image5MouseEnter(Sender: TObject);
begin
 Image6.Visible:=True;
end;

procedure TFORM_GRAVA_FUNCIONARIO.Image6Click(Sender: TObject);
begin
UNIT_GRAVA_FUNCIONARIO.FORM_GRAVA_FUNCIONARIO.Close;
end;

procedure TFORM_GRAVA_FUNCIONARIO.Image6MouseLeave(Sender: TObject);
begin
 Image6.Visible:=False;
end;

procedure TFORM_GRAVA_FUNCIONARIO.Image7Click(Sender: TObject);
var
  dia, mes, ano : string ;
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de nascimento!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if (MaskEdit2.Text='')or(MaskEdit2.Text='  .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de RG!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if (MaskEdit3.Text='')or(MaskEdit3.Text='   .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de CPF!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit3.SetFocus;
    Exit;
  end;

  if (MaskEdit6.Text='')or(MaskEdit6.Text='(  )     -    ') then
  begin
    Application.MessageBox('Preencha o campo de telefone!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit6.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Escolha o sexo!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

    if VarIsNull(DBLookupComboBox2.KeyValue) then
  begin
    Application.MessageBox('Escolha o estado!', 'Aten��o!', MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Exit;
  end;

  if VarIsNull(DBLookupComboBox1.KeyValue) then
  begin
    Application.MessageBox('Escolha a cidade!', 'Aten��o!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;


  GRAVA_FUNCIONARIO.Parameters.ParamByName('@NOME').Value := Edit1.Text;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);

  GRAVA_FUNCIONARIO.Parameters.ParamByName('@NASCIMENTO').Value := ano + mes + dia ;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@RG').Value := MaskEdit2.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@CPF').Value := MaskEdit3.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@TELEFONE').Value := MaskEdit6.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@TELEFONE2').Value := MaskEdit7.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@ENDERECO').Value := Edit2.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@EMAIL').Value := Edit3.Text;
  GRAVA_FUNCIONARIO.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_FUNCIONARIO.Parameters.ParamByName('@SEXO').Value := 'F';
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_FUNCIONARIO.Parameters.ParamByName('@SEXO').Value := 'M';
  end;

    GRAVA_FUNCIONARIO.Parameters.ParamByName('@STATUS').Value := 1 ;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_FUNCIONARIO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

  if Image2.Visible = true then
  begin
    Application.MessageBox('O CPF est� incorreto!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja cadastrar o funcion�rio?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_FUNCIONARIO.ExecProc;

    UNIT_GRAVA_PAGAMENTO_FUNCIONARIO.FORM_GRAVA_PAGAMENTO_FUNCIONARIO.ADOQUERY_FUNCIONARIO.CloSE;
    UNIT_GRAVA_PAGAMENTO_FUNCIONARIO.FORM_GRAVA_PAGAMENTO_FUNCIONARIO.ADOQUERY_FUNCIONARIO.OPEN;

    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Funcion�rio ' + Edit1.Text + ', n� ' + INTtOSTR(GRAVA_FUNCIONARIO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;


    with UNIT_GRAVA_USUARIO.FORM_GRAVA_USUARIO.ADOQUERY_FUNCIONARIO do
    begin
      close;
      open;
    end;

    Application.MessageBox('Funcionario cadastrado!', 'AVISO', MB_OK);
    Image8Click(SELF);
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.Image8Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit6.Clear;
  MaskEdit7.Clear;
  MaskEdit1.Clear;
  RadioGroup1.ItemIndex := -1;
  Image1.Visible := false;
  Image2.Visible := false;
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
  Edit1.SetFocus;
end;

function TFORM_GRAVA_FUNCIONARIO.isCPF(CPF: string): boolean;
var
    dig10, dig11: string;
    s, i, r, peso : integer;
begin
   if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
      (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
      (CPF = '99999999999') or (length(CPF) <> 11))          then
  begin
         isCPF := false;
         exit;
  end;

      try
        s := 0;
        peso := 10;
        for i := 1 to 9 do
        begin
          s := s + (StrToInt(CPF[i]) * peso);
          peso := peso - 1;
        end;

        r := 11 - (s mod 11);

        if ((r = 10) or (r = 11)) then
           dig10 := '0'
        else
          str(r:1, dig10);

      s := 0;
      peso := 11;
      for i := 1 to 10 do
      begin
        s := s + (StrToInt(CPF[i]) * peso);
        peso := peso - 1;
      end;

      r := 11 - (s mod 11);

      if ((r = 10) or (r = 11)) then
        dig11 := '0'
      else
        str(r:1, dig11);

      if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
          isCPF := true
      else
        isCPF := false;
    except
      isCPF := false
    end;

end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit1Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit1.Text));

  if digitos <> '' then
  begin
    for i := 0 to length(digitos) do
    begin
      if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
    end;
  end;

  if cont < 10 then
  begin
    Application.MessageBox('Preencha todos os d�gitos da data!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit2Exit(Sender: TObject);
const
  caracteres = 'ABCDEFGHIJKLMNOPQRSTUVabcdefghijklmnopqrstuvwxyz0123456789';
var
  i, cont: byte;
  digitos: string;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit2.Text));
  if digitos <> '' then
  begin
    for i := 0 to length(digitos) do
    begin
      if Pos(digitos[i], caracteres) <> 0 then
        inc(cont);
    end;
  end;

  if cont < 8 then
  begin
    Application.MessageBox(
      'O campo de Rg deve estar completo!', 'Aten��o!',
      MB_ICONWARNING);
      MaskEdit2.Clear;
      MaskEdit2.SetFocus;
    Exit;
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit3Exit(Sender: TObject);
begin

  if ( isCPF(MaskEdit3.Text) = True) then
   begin
      Image2.Visible := FALSE;
      Image1.Visible := TRUE;
   end
   else
   begin
      Image1.Visible := FALSE;
      Image2.Visible := TRUE;
   end;

end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FUNCIONARIO.OQUEISSO1Click(Sender: TObject);
begin
  Application.MessageBox('Aqui voc� poder� efetuar o cadastro de um(uma) funcion�rio(a)!', 'Aten��o!', MB_ICONEXCLAMATION);
end;

procedure TFORM_GRAVA_FUNCIONARIO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
