unit UNIT_GRAVA_PACIENTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls, Mask, pngimage, jpeg;

type
  TFORM_GRAVA_PACIENTE = class(TForm)
    lbl_data: TLabel;
    Timer1: TTimer;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    MaskEdit3: TMaskEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Memo1: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    DBLOOKUPCOMBOBOX_RESPONSAVEL: TDBLookupComboBox;
    ADOConnection1: TADOConnection;
    ADOQUERY_UF: TADOQuery;
    ADOQUERY_UFCD_ESTADO: TIntegerField;
    ADOQUERY_UFSG_ESTADO: TStringField;
    DATASOURCE_UF: TDataSource;
    ADOQUERY_CIDADE: TADOQuery;
    ADOQUERY_CIDADENM_CIDADE: TStringField;
    ADOQUERY_CIDADECD_CIDADE: TIntegerField;
    ADOQUERY_CIDADEES_CIDADE: TIntegerField;
    ADOQUERY_CIDADECP_CIDADE: TBooleanField;
    DATASOURCE_CIDADE: TDataSource;
    ADOQUERY_RESPONSAVEL: TADOQuery;
    DATASOURCE_RESPONSAVEL: TDataSource;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Panel1: TPanel;
    Button3: TButton;
    GRAVA_PACIENTE: TADOStoredProc;
    MaskEdit2: TMaskEdit;
    GRAVA_LOG: TADOStoredProc;
    Image9: TImage;
    Image10: TImage;
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   function isCPF(CPF: string): boolean;
  end;

var
  FORM_GRAVA_PACIENTE: TFORM_GRAVA_PACIENTE;

implementation

uses UNIT_SELECIONA_RESPONSAVEL, UNIT_GRAVA_AGENDAMENTO, UNIT_GRAVA_CONSULTA,
  Unit_TELA_PRINCIPAL,
  UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA, UNIT_GRAVA_PAGAMENTO_FUNCIONARIO,
  Unit_PACIENTES;

{$R *.dfm}

procedure TFORM_GRAVA_PACIENTE.Button3Click(Sender: TObject);
begin
  DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue := -1 ;
  Edit2.Clear;
  UNIT_SELECIONA_RESPONSAVEL.FORM_SELECIONA_RESPONSAVEL.ShowModal;
end;

procedure TFORM_GRAVA_PACIENTE.DBLookupComboBox2Click(Sender: TObject);
begin
  with ADOQUERY_CIDADE do
  begin
    close;
    SQL.Clear;
    SQL.Add(
      'SELECT CD_CIDADE, NM_CIDADE, ES_CIDADE, CP_CIDADE FROM TB_CIDADE, TB_ESTADO WHERE CD_ESTADO=ES_CIDADE AND ES_CIDADE=' + ADOQUERY_UFCD_ESTADO.AsString);
    open;
  end;

  DBLookupComboBox1.Enabled := True;
end;

procedure TFORM_GRAVA_PACIENTE.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
end;

procedure TFORM_GRAVA_PACIENTE.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
end;

procedure TFORM_GRAVA_PACIENTE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_PACIENTES.Form_PACIENTE do
  begin
    ADOQuery1.Active := false ;
    ADOQuery1.Active := true ;
  end;

end;

procedure TFORM_GRAVA_PACIENTE.FormCreate(Sender: TObject);
begin
  lbl_data.Caption := FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
  ADOQUERY_UF.Active := True;
  ADOQUERY_CIDADE.Active := True;
end;

procedure TFORM_GRAVA_PACIENTE.FormShow(Sender: TObject);
begin
  with ADOQUERY_RESPONSAVEL do
  begin
    Close;Open;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.Image10MouseEnter(Sender: TObject);
begin
 Image9.Visible:=True;
end;

procedure TFORM_GRAVA_PACIENTE.Image4MouseEnter(Sender: TObject);
begin
Image5.Visible:=True;
end;

procedure TFORM_GRAVA_PACIENTE.Image5Click(Sender: TObject);
begin
FORM_GRAVA_PACIENTE.Close;
end;

procedure TFORM_GRAVA_PACIENTE.Image5MouseLeave(Sender: TObject);
begin
Image5.Visible:=False;
end;

procedure TFORM_GRAVA_PACIENTE.Image7Click(Sender: TObject);
var
  dia, mes, ano: string;
  dia_c, mes_c, ano_c, hora_c: string;
  ultimo_pac : integer ;
begin
  dia := Copy(MaskEdit1.Text, 1, 2);
  mes := Copy(MaskEdit1.Text, 4, 2);
  ano := Copy(MaskEdit1.Text, 7, 4);



  if Edit1.Text = '' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Aten��o!',
      MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text = '') or (MaskEdit1.Text = '  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de nascimento!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
 {
  if (MaskEdit2.Text ='')or(MaskEdit2.Text = '  .   .   - ') then
  begin
     Application.MessageBox('Preencha o campo de RG!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if (MaskEdit3.Text ='')or(MaskEdit2.Text = '   .   .   -  ') then
  begin
     Application.MessageBox('Preencha o campo de CPF!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit3.SetFocus;
    Exit;
  end;
 }
  if Edit2.Text = '' then
  begin
    Application.MessageBox('Preencha o campo de endere�o!', 'Aten��o!',
      MB_ICONWARNING);
    Edit2.SetFocus;
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

  if (MaskEdit4.Text = '') or (MaskEdit4.Text = '(  )     -    ') then
  begin
    Application.MessageBox('Preencha o campo de telefone!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit4.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Escolha o sexo!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;


  GRAVA_PACIENTE.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_PACIENTE.Parameters.ParamByName('@RG').Value := MaskEdit2.Text;
  GRAVA_PACIENTE.Parameters.ParamByName('@CPF').Value := MaskEdit3.Text;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_PACIENTE.Parameters.ParamByName('@SEXO').Value := 'F';
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_PACIENTE.Parameters.ParamByName('@SEXO').Value := 'M';
  end;

  GRAVA_PACIENTE.Parameters.ParamByName('@NASCIMENTO').Value := ano + mes + dia;
  GRAVA_PACIENTE.Parameters.ParamByName('@ENDERECO').Value := Edit2.Text;
  GRAVA_PACIENTE.Parameters.ParamByName('@EMAIL').Value := Edit3.Text;
  GRAVA_PACIENTE.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue;
  GRAVA_PACIENTE.Parameters.ParamByName('@TELEFONE').Value := MaskEdit4.Text;
  GRAVA_PACIENTE.Parameters.ParamByName('@TELEFONE2').Value := MaskEdit5.Text;

  if RadioGroup3.ItemIndex = 0 then
  begin
    GRAVA_PACIENTE.Parameters.ParamByName('@MENOR_DE_18').Value := 1;
  end;

  if RadioGroup3.ItemIndex = 1 then
  begin
    GRAVA_PACIENTE.Parameters.ParamByName('@MENOR_DE_18').Value := 0;
  end;

  if True then

    if (DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue=0) or (DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue=-1) then
    begin
      GRAVA_PACIENTE.Parameters.ParamByName('@RESPONSAVEL').Value := null;
    end

    else
    begin
      GRAVA_PACIENTE.Parameters.ParamByName('@RESPONSAVEL').Value := DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue;
    end;

  GRAVA_PACIENTE.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

  GRAVA_PACIENTE.Parameters.ParamByName('@STATUS').Value := 1;

  dia_c := Copy(lbl_data.Caption, 1, 2);
  mes_c := Copy(lbl_data.Caption, 4, 2);
  ano_c := Copy(lbl_data.Caption, 7, 4);
  hora_c := Copy(lbl_data.Caption, 14, 8);

  GRAVA_PACIENTE.Parameters.ParamByName('@DTHORA_CADASTRO')
    .Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;

  if Image2.Visible = True then
  begin
    Application.MessageBox('O CPF est� incorreto!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;


  if Application.MessageBox('Tem certeza que deseja cadastrar o paciente?',
    'CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_PACIENTE.ExecProc;

    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Paciente ' + Edit1.Text + ', N� ' + INTtOSTR(GRAVA_PACIENTE.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

        with UNIT_GRAVA_CONSULTA.FORM_GRAVA_CONSULTA.ADOQUERY_PACIENTE do
        begin
          Close;
          Open;
        end;
        with UNIT_GRAVA_AGENDAMENTO.FORM_GRAVA_AGENDAMENTO.ADOQUERY_PACIENTE do
        begin
          Close;
          Open;
        end;
        {
        with UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO.FORM_GRAVA_PAGAMENTO_APRAZO do
        begin
          with ADOQUERY_PACIENTE_MENOR do
          begin
            Close;
            Open;
          end;
          with ADOQUERY_PACIENTE_MAIOR do
          begin
            Close;
            Open;
          end;
        end;
        }
        {with UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA.FORM_GRAVA_PAGAMENTO_AVISTA do
        begin
          with ADOQUERY_PACIENTE_MENOR do
          begin
            Close;
            Open;
          end;
          with ADOQUERY_PACIENTE_MAIOR do
          begin
            Close;
            Open;
          end;
        end;   }
    Application.MessageBox('Paciente cadastrado!', 'AVISO', MB_OK);
    Image8Click(self);
  end
//////////////////////////////////////////////////////////////////////////////////////////////////////////

  else
  begin
    Exit;
  end;


end;

procedure TFORM_GRAVA_PACIENTE.Image8Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue := -1 ;
  DBLOOKUPCOMBOBOX_RESPONSAVEL.Enabled := FALSE ;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit4.Clear;
  MaskEdit5.Clear;
  Memo1.Clear;
  RadioGroup1.ItemIndex := -1;
  RadioGroup3.ItemIndex := -1;
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
  Image1.Visible := false ;
  Image2.Visible := false ;
  Button3.Enabled := false ;
  Edit1.SetFocus;
end;

procedure TFORM_GRAVA_PACIENTE.Image9Click(Sender: TObject);
begin
   FORM_GRAVA_PACIENTE.Close;
end;

procedure TFORM_GRAVA_PACIENTE.Image9MouseLeave(Sender: TObject);
begin
 Image9.Visible:=False;
end;

function TFORM_GRAVA_PACIENTE.isCPF(CPF: string): boolean;
var
  dig10, dig11: string;
  s, i, r, peso: integer;
begin
  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222')
      or (CPF = '33333333333') or (CPF = '44444444444') or
      (CPF = '55555555555') or (CPF = '66666666666') or (CPF = '77777777777')
      or (CPF = '88888888888') or (CPF = '99999999999') or (length(CPF) <> 11))
    then
  begin
    isCPF := false;
    Exit;
  end;

  try
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      s := s + (STRTOINT(CPF[i]) * peso);
      peso := peso - 1;
    end;

    r := 11 - (s mod 11);

    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10);

    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (STRTOINT(CPF[i]) * peso);
      peso := peso - 1;
    end;

    r := 11 - (s mod 11);

    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      isCPF := True
    else
      isCPF := false;
  except
    isCPF := false
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit1Change(Sender: TObject);
begin
  if (MaskEdit1.Text = '') or (MaskEdit1.Text = '  /  /    ') then
  begin
    RadioGroup3.ItemIndex := -1;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit1Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
  ano, ano_c, mes: string;
  dif: integer;
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

  ano := Copy(MaskEdit1.Text, 7, 4);
  ano_c := Copy(lbl_data.Caption, 7, 4);
  dif := STRTOINT(ano_c) - STRTOINT(ano);

  mes := Copy(MaskEdit1.Text, 4, 2);

  if (STRTOINT(mes) > 12) then
  begin
    Application.MessageBox('M�s inv�lido!', 'Aten��o', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end

  else if (STRTOINT(mes) <= 0) then
  begin
    Application.MessageBox('M�s inv�lido!', 'Aten��o', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if ano > ano_c then
  begin
    Application.MessageBox('A data de nascimento � inv�lida!', 'Aten��o!',
      MB_ICONWARNING);
    Exit;
  end;

  if dif >= 18 then
  begin
    RadioGroup3.ItemIndex := 1;
  end
  else
  begin
    RadioGroup3.ItemIndex := 0;
    Button3.Enabled := True;
    DBLOOKUPCOMBOBOX_RESPONSAVEL.Enabled := true ;
    UNIT_SELECIONA_RESPONSAVEL.FORM_SELECIONA_RESPONSAVEL.ShowModal;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #8 then
  begin
    with DBLOOKUPCOMBOBOX_RESPONSAVEL do
    begin
      Enabled := false;
      KeyValue := -1;
      Button3.Enabled := false ;
    end;

    Edit2.Clear;

  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit2Exit(Sender: TObject);
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
      'Caso o paciente tenha RG, o campo deve estar completo!', 'Aten��o!',
      MB_ICONWARNING);
      MaskEdit2.Clear;
      //
      cont:=8;
      //
    Exit;
    MaskEdit3.SetFocus;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit3Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
begin
 cont := 0;
  digitos := LowerCase(Trim(MaskEdit3.Text));

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
    Application.MessageBox('Caso o paciente tenha CPF, o campo deve estar completo!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit3.Clear;
    cont := 10;
    Edit2.SetFocus;
    Exit;
  end;

  if (isCPF(MaskEdit3.Text) = True) then
  begin
    Image2.Visible := false;
    Image1.Visible := True;
  end
  else
  begin
    Image1.Visible := false;
    Image2.Visible := True;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit4Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit4.Text));
  if digitos <> '' then
  begin
    for i := 0 to length(digitos) do
    begin
      if Pos(digitos[i], caracteres) <> 0 then
        inc(cont);
    end;
  end;

  if cont < 9 then
  begin
     Application.MessageBox('Preencha todos os d�gitos do telefone!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit4.SetFocus;
     exit;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.MaskEdit5Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit5.Text));
  if digitos <> '' then
  begin
    for i := 0 to length(digitos) do
    begin
      if Pos(digitos[i], caracteres) <> 0 then
        inc(cont);
    end;
  end;

  if cont < 9 then
  begin
     MaskEdit5.Clear;
     SelectNext(Sender as TWinControl, true, true);
     EXIT;
  end;
end;

procedure TFORM_GRAVA_PACIENTE.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
end;

procedure TFORM_GRAVA_PACIENTE.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date) + ' | ' + timetostr(time);
end;

end.
