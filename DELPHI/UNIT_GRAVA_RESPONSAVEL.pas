unit UNIT_GRAVA_RESPONSAVEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, DBCtrls, Mask, pngimage, jpeg;

type
  TFORM_GRAVA_RESPONSAVEL = class(TForm)
    Timer1: TTimer;
    DATASOURCE_CIDADE: TDataSource;
    ADOQUERY_CIDADE: TADOQuery;
    ADOQUERY_CIDADENM_CIDADE: TStringField;
    ADOQUERY_CIDADECD_CIDADE: TIntegerField;
    ADOQUERY_CIDADEES_CIDADE: TIntegerField;
    ADOQUERY_CIDADECP_CIDADE: TBooleanField;
    ADOQUERY_UF: TADOQuery;
    ADOQUERY_UFCD_ESTADO: TIntegerField;
    ADOQUERY_UFSG_ESTADO: TStringField;
    DATASOURCE_UF: TDataSource;
    ADOConnection1: TADOConnection;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    lbl_data: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label10: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    Edit3: TEdit;
    GRAVA_RESPONSAVEL: TADOStoredProc;
    Image2: TImage;
    Image1: TImage;
    GRAVA_LOG: TADOStoredProc;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
       function isCPF(CPF: string): boolean;
    { Public declarations }
  end;

var
  FORM_GRAVA_RESPONSAVEL: TFORM_GRAVA_RESPONSAVEL;

implementation

uses Unit_TELA_PRINCIPAL, UNIT_SELECIONA_RESPONSAVEL, Unit_RESPONSAVEL;

{$R *.dfm}

procedure TFORM_GRAVA_RESPONSAVEL.Button1Click(Sender: TObject);
var
  dia, mes, ano : string ;
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de nascimento!', 'Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if (MaskEdit2.Text='')or(MaskEdit2.Text='  .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de RG!', 'Atenção!', MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if (MaskEdit3.Text='')or(MaskEdit3.Text='   .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de CPF!', 'Atenção!', MB_ICONWARNING);
    MaskEdit3.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o campo de endereço!', 'Atenção!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if Edit3.Text='' then
  begin
    Application.MessageBox('Preencha o campo de email!', 'Atenção!', MB_ICONWARNING);
    Edit3.SetFocus;
    Exit;
  end;

  if (MaskEdit4.Text='')or(MaskEdit4.Text='(  )     -    ') then
  begin
    Application.MessageBox('Preencha o campo de telefone!', 'Atenção!', MB_ICONWARNING);
    MaskEdit4.SetFocus;
    Exit;
  end;

  GRAVA_RESPONSAVEL.Parameters.ParamByName('@NOME').Value := Edit1.Text;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);

  GRAVA_RESPONSAVEL.Parameters.ParamByName('@NASCIMENTO').Value := ano + mes + dia ;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@RG').Value := MaskEdit2.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@CPF').Value := MaskEdit3.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@ENDERECO').Value := Edit2.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@TELEFONE').Value := MaskEdit4.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@EMAIL').Value := Edit3.Text;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'F';
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'M';
  end;

{  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@STATUS').Value := 1 ;
  end

  else if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 0;
  end;
}
  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

 GRAVA_RESPONSAVEL.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

  if Image2.Visible = true then
  begin
    Application.MessageBox('O CPF está incorreto!', 'Atenção!', MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja cadastrar o responsável?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_RESPONSAVEL.ExecProc;
    Application.MessageBox('Responsável cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.Button2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit4.Clear;
  MaskEdit1.Clear;
  RadioGroup1.ItemIndex := -1;
  //RadioGroup2.ItemIndex := -1;
  Image1.Visible := false;
  Image2.Visible := false;
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
end;

procedure TFORM_GRAVA_RESPONSAVEL.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.DBLookupComboBox2Click(Sender: TObject);
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

procedure TFORM_GRAVA_RESPONSAVEL.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key in ['0'..'9'] then
  begin
     key := #0;
  end;

  key := UpCase(key);

end;

procedure TFORM_GRAVA_RESPONSAVEL.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  Key := UpCase(key);

end;

procedure TFORM_GRAVA_RESPONSAVEL.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with Unit_RESPONSAVEL.Form_RESPONSAVEL.ADOQuery1 do
  begin
   Active := false ;
   Active := true  ;
  end;
end;

procedure TFORM_GRAVA_RESPONSAVEL.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_RESPONSAVEL.FormShow(Sender: TObject);
begin

  Image8Click(SELF);

end;

procedure TFORM_GRAVA_RESPONSAVEL.Image4MouseEnter(Sender: TObject);
begin
Image5.Visible:=True;
end;

procedure TFORM_GRAVA_RESPONSAVEL.Image5Click(Sender: TObject);
begin
UNIT_GRAVA_RESPONSAVEL.FORM_GRAVA_RESPONSAVEL.Close;
end;

procedure TFORM_GRAVA_RESPONSAVEL.Image5MouseLeave(Sender: TObject);
begin
Image5.Visible:=False;
end;

procedure TFORM_GRAVA_RESPONSAVEL.Image7Click(Sender: TObject);
var
  dia, mes, ano : string ;
  dia_c , mes_c, ano_c, hora_c: string;
begin
  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de nascimento!', 'Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if (MaskEdit4.Text='')or(MaskEdit4.Text='(  )     -    ') then
  begin
    Application.MessageBox('Preencha o campo de telefone!', 'Atenção!', MB_ICONWARNING);
    MaskEdit4.SetFocus;
    Exit;
  end;

  if (MaskEdit2.Text='')or(MaskEdit2.Text='  .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de RG!', 'Atenção!', MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if (MaskEdit3.Text='')or(MaskEdit3.Text='   .   .   -  ') then
  begin
    Application.MessageBox('Preencha o campo de CPF!', 'Atenção!', MB_ICONWARNING);
    MaskEdit3.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o campo de endereço!', 'Atenção!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if VarIsNull(DBLookupComboBox2.KeyValue) then
  begin
    Application.MessageBox('Escolha o estado!', 'Atenção!', MB_ICONWARNING);
    DBLookupComboBox2.SetFocus;
    Exit;
  end;

  if VarIsNull(DBLookupComboBox1.KeyValue) then
  begin
    Application.MessageBox('Escolha a cidade!', 'Atenção!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Escolha o sexo!', 'Atenção!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);
  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_RESPONSAVEL.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@NASCIMENTO').Value := ano + mes + dia ;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@RG').Value := MaskEdit2.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@CPF').Value := MaskEdit3.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@ENDERECO').Value := Edit2.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@TELEFONE').Value := MaskEdit4.Text;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@EMAIL').Value := Edit3.Text;
  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'F';
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'M';
  end;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@STATUS').Value := 1 ;
  GRAVA_RESPONSAVEL.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

  if Image2.Visible = true then
  begin
    Application.MessageBox('O CPF está incorreto!', 'Atenção!', MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja cadastrar o responsável?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_RESPONSAVEL.ExecProc;

    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      close;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      open;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Responsável nº ' + INTtOSTR(GRAVA_RESPONSAVEL.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

    with UNIT_SELECIONA_RESPONSAVEL.FORM_SELECIONA_RESPONSAVEL.ADOQUERY_RESPONSAVEL do
    begin
      Active := false;
      Active := true ;
    end;

    Application.MessageBox('Responsável cadastrado!', 'AVISO', MB_OK);
    Image8Click(self);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.Image8Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit4.Clear;
  MaskEdit1.Clear;
  RadioGroup1.ItemIndex := -1;
  //RadioGroup2.ItemIndex := -1;
  Image1.Visible := false;
  Image2.Visible := false;
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
  Edit1.SetFocus;
end;

function TFORM_GRAVA_RESPONSAVEL.isCPF(CPF: string): boolean;
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
         exit; /// "aborta" a procedure
  end;
///////////////////////////////////////////////////////////////////////////////////////////////////
//// cálculo do 1º dígito verificador
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
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    ///// cálculo do 2o. Digito Verificador
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

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit1Exit(Sender: TObject);
const
   caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
  ano, ano_c, mes : string;
  dif : integer;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit1.Text));
  if digitos <> '' then
  begin
    for i := 0 to Length(digitos) do
    begin
      if Pos(digitos[i], caracteres)<>0 then
      inc(cont);
    end;
  end;


  if cont<10 then
  begin
    Application.MessageBox('É necessário preencher todos os digitos do campo de nascimento!', 'Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    exit;
  end;

  mes := Copy(MaskEdit1.Text,4,2);

  if (StrToInt(mes)>12) then
  begin
    Application.MessageBox('Mês inválido!', 'Atenção', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end

  else if (StrToInt(mes)<=0) then
  begin
    Application.MessageBox('Mês inválido!', 'Atenção', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;


  ano := Copy(MaskEdit1.Text,7,4);
  ano_c := Copy(lbl_data.Caption,7,4);
  dif := StrToInt(ano_c) - StrToInt(ano);

  if dif<18 then
  begin
    Application.MessageBox('O responsável não pode ser cadastrado se for menor de idade!','Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit2Exit(Sender: TObject);
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
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 8 then
  begin
     Application.MessageBox('Preencha todos os dígitos do RG!', 'Atenção!', MB_ICONWARNING);
     MaskEdit2.SetFocus;
     exit;
  end;
end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit3Change(Sender: TObject);
begin

  if MaskEdit3.Text='' then
  begin
    Image1.Visible:=false;
    Image2.Visible:=false;
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit3Exit(Sender: TObject);
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
      MaskEdit3.SetFocus;
   end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit4Exit(Sender: TObject);
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
     Application.MessageBox('Preencha todos os dígitos do telefone!', 'Atenção!', MB_ICONWARNING);
     MaskEdit4.SetFocus;
  end;
end;

procedure TFORM_GRAVA_RESPONSAVEL.MaskEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_RESPONSAVEL.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
