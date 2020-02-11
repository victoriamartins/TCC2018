unit UNIT_GRAVA_PAGAMENTO_FUNCIONARIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Mask, StdCtrls, DBCtrls, pngimage, jpeg;

type
  TFORM_GRAVA_PAGAMENTO_FUNCIONARIO = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Timer1: TTimer;
    ADOConnection1: TADOConnection;
    MaskEdit1: TMaskEdit;
    ADOQUERY_FUNCIONARIO: TADOQuery;
    DATASOURCE_FUNCIONARIO: TDataSource;
    GRAVA_PAGAMENTO_FUNCIONARIO: TADOStoredProc;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    lbl_data: TLabel;
    Image5: TImage;
    Image7: TImage;
    ADOQUERY_FUNCIONARIOCOD_FUNCIONARIO: TAutoIncField;
    ADOQUERY_FUNCIONARIONOME_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOSEXO_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIONASCIMENTO_FUNCIONARIO: TWideStringField;
    ADOQUERY_FUNCIONARIORG_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOCPF_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOENDERECO_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOEMAIL_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOCIDADE_FUNCIONÁRIO: TIntegerField;
    ADOQUERY_FUNCIONARIOTEL1_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOTEL2_FUNCIONARIO: TStringField;
    ADOQUERY_FUNCIONARIOSTATUS_FUNCIONARIO: TBooleanField;
    ADOQUERY_FUNCIONARIODTHORACADASTRO_FUNCIONARIO: TDateTimeField;
    GRAVA_LOG: TADOStoredProc;
    GRAVA_DESPESA: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    RadioGroup1: TRadioGroup;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_PAGAMENTO_FUNCIONARIO: TFORM_GRAVA_PAGAMENTO_FUNCIONARIO;

implementation

uses Unit_TELA_PRINCIPAL, Unit_PAGAR_FUNCIONARIO, UNIT_CAIXA;

{$R *.dfm}

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Button1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
  dia, mes, ano : string ;
begin

  if (Edit1.Text='')or(Edit1.Text='0,00') then
  begin
    Application.MessageBox('Preencha o campo de valor fixo!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de data do pagamento!', 'Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@COD_FUNCIONARIO').Value := DBLookupComboBox1.KeyValue;
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_FIXO').Value := Edit1.Text;
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_EXTRA').Value := Edit2.Text;
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@TOTAL').Value := Edit3.Text;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);

  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@DATA').Value := ano + mes + dia ;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_PAGAMENTO_FUNCIONARIO.ExecProc;
    Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Button2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := -1;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  MaskEdit1.Clear;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Edit1Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin

    If (edit1.Text = emptystr) then
      Begin
        Edit1.Text := '0,00';
        Exit;
      End;

    s := '';
    for I := 1 to length(edit1.Text) do
        if (edit1.text[I] in ['0'..'9']) then
            s := s + edit1.text[I];


            v := strtofloat(s);
            v := (v /100);

            Edit1.text := FormatFloat('#####0.00',v);
            Edit1.SelStart := Length(Edit1.text) ;

  if Edit1.Text='0,00' then
  begin
    Edit3.Text:= Edit1.Text;
  end

  else
  begin
    Edit3.Text := Edit1.Text;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Edit2Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;

  valor_fixo, valor_adicional, total : real ;
begin

   If (edit2.Text = emptystr) then
      Begin
        Edit2.Text := '0,00';
        Exit;
      End;

    s := '';
    for I := 1 to length(edit2.Text) do
        if (edit2.text[I] in ['0'..'9']) then
            s := s + edit2.text[I];


            v := strtofloat(s);
            v := (v /100);


            Edit2.text := FormatFloat('#####0.00',v);
            Edit2.SelStart := Length(Edit2.text) ;

    valor_fixo := StrToFloat(Edit1.Text);
    valor_adicional := StrToFloat(Edit2.Text);
    total := valor_fixo + valor_adicional;
    Edit3.Text := FloatToStr(total);

  if Edit2.Text='0,00' then
  begin
    Edit3.Text := Edit1.Text;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Edit3Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin

   { If (edit3.Text = emptystr) then
      Begin
        Edit3.Text := '0,00';
        Exit;
      End;

    s := '';
    for I := 1 to length(edit3.Text) do
        if (Edit3.text[I] in ['0'..'9']) then
            s := s + edit3.text[I];


            v := strtofloat(s);
            v := (v /100);

            Edit3.text := FormatFloat('#####0.00',v);
            Edit3.SelStart := Length(Edit3.text) ;}

end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_PAGAR_FUNCIONARIO.Form_PAG_FUNCIONARIO.ADOQuery1 do
  begin
    Active := false;
    Active := true ;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
  ADOQUERY_FUNCIONARIO.Active := FALSE ;
  ADOQUERY_FUNCIONARIO.Active := TRUE ;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Image3Click(Sender: TObject);
begin
   UNIT_GRAVA_PAGAMENTO_FUNCIONARIO.FORM_GRAVA_PAGAMENTO_FUNCIONARIO.Close;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Image5Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := -1;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  MaskEdit1.Clear;
  RadioGroup1.ItemIndex := -1;
  DBLookupComboBox1.SetFocus;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Image7Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
  dia, mes, ano : string ;
  data_mask, data_label : string ; // para gravar o caixa
  Valor_caixa, Valor_pagamento : Real;
begin

  if VarIsNull(DBLookupComboBox1.KeyValue) then
  begin
    Application.MessageBox('Escolha o funcionário!', 'Atenção!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  if (Edit1.Text='')or(Edit1.Text='0,00') then
  begin
    Application.MessageBox('Preencha o campo de valor fixo!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de data do pagamento!', 'Atenção!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Escolha o status do pagamento!', 'Atenção!', MB_ICONWARNING);
    RadioGroup1.SetFocus;
    Exit;
  end;

  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@COD_FUNCIONARIO').Value := DBLookupComboBox1.KeyValue;
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_FIXO').Value := Edit1.Text;

  if Edit2.Text <> EmptyStr then
  begin
    GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_EXTRA').Value := Edit2.Text;
  end
  else if Edit2.Text = EmptyStr then
  begin
    GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_EXTRA').Value := '0,00';
  end;
  //GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_EXTRA').Value := Edit2.Text;
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@TOTAL').Value := Edit3.Text;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);

  data_mask := dia + mes + ano ;

  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@DATA').Value := ano + '-' + mes + '-' + dia ;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  data_label := dia_c + mes_c + ano_c;

  if RadioGroup1.ItemIndex = 0 then
  begin
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@STATUS').Value := 1;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@STATUS').Value := 0;
  end;


  GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
     with UNIT_CAIXA.FORM_CAIXA do
     begin
        RadioGroup1.ItemIndex := 0;
        RadioGroup1Click(self);
     end;
     if UNIT_CAIXA.FORM_CAIXA.LBL_TOTAL.Caption = '' then
     BEGIN
        Valor_caixa := 0.00;
     END
     ELSE
     BEGIN
        Valor_caixa := StrToFloat(UNIT_CAIXA.FORM_CAIXA.LBL_TOTAL.Caption);
     END;
      Valor_pagamento := StrToFloat(Edit3.Text);

      if Valor_pagamento > Valor_caixa then
      begin
        Application.MessageBox('Não há dinheiro suficiente no caixa para realizar esta operação','ATENÇÃO',MB_ICONEXCLAMATION);
        exit;
      end;



    GRAVA_PAGAMENTO_FUNCIONARIO.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento de funcionário nº ' + INTTOSTR(GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

        if RadioGroup1.ItemIndex = 0 then
        begin
          with GRAVA_DESPESA do
          begin
            Parameters.ParamByName('@TIPO').Value := 'PAG. DE FUNCIONÁRIO';
            Parameters.ParamByName('@PRODUTO').Value := NULL;
            Parameters.ParamByName('@PAG_FUNC').Value := GRAVA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@RETURN_VALUE').Value ;
            Parameters.ParamByName('@PAG_DENT').Value := NULL;
            Parameters.ParamByName('@VALOR').Value := Edit3.Text ;
            Parameters.ParamByName('@DATAPAGAMENTO').Value := ano + '-' + mes + '-' + dia ;
            Parameters.ParamByName('@OBS').Value := '';
            Parameters.ParamByName('@DTHORACADASTRO_DESPESA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;

          with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
          begin
            CLOSE;
            Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
            OPEN;
          end;

          with GRAVA_LOG do
          begin
            Parameters.ParamByName('@DESCRICAO').Value := 'Despesa nº ' + INTTOSTR(GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrada.' ;
            Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
            Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;

          with CAIXA_AUTOMATICO do
          begin
            Parameters.ParamByName('@DATA').Value :=  ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@ENTRADA').Value := '0.00';
            Parameters.ParamByName('@SAIDA').Value := Edit3.Text ;
            Parameters.ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@AVISTA').Value := null;
            Parameters.ParamByName('@APRAZO').Value := null;
            Parameters.ParamByName('@PARCELA').Value := null;
            Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value ;
            ExecProc;
          end; // do with
        end; // do if


    Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
    RadioGroup1.ItemIndex := -1 ;
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.MaskEdit1Exit(Sender: TObject);
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
    Application.MessageBox('Preencha todos os dígitos da data!', 'Atenção!',
      MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_FUNCIONARIO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
