unit UNIT_GRAVA_PAGAMENTO_DENTISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, Mask, DBCtrls, pngimage;

type
  TFORM_GRAVA_PAGAMENTO_DENTISTA = class(TForm)
    ADOConnection1: TADOConnection;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    GRAVA_PAG_DENTISTA: TADOStoredProc;
    DB_DENTISTA: TDBLookupComboBox;
    Label1: TLabel;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    Image2: TImage;
    Image7: TImage;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    CAIXA_AUTOMATICO: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    GRAVA_DESPESA: TADOStoredProc;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_PAGAMENTO_DENTISTA: TFORM_GRAVA_PAGAMENTO_DENTISTA;

implementation

uses Unit_TELA_PRINCIPAL, UNIT_PAGAMENTO_DENTISTA, UNIT_CAIXA;

{$R *.dfm}

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Edit1Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin
    //1� Passo : se o edit estiver vazio, nada pode ser feito.
    If (edit1.Text = emptystr) then
      Begin
        Edit1.Text := '0,00';
        Exit;
      End;
    //2� Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
    s := '';
    for I := 1 to length(edit1.Text) do
        if (edit1.text[I] in ['0'..'9']) then
            s := s + edit1.text[I];

            //3� Passo : fazer com que o conte�do do edit apresente 2 casas decimais:
            v := strtofloat(s);
            v := (v /100); // para criar 2 casa decimais

            //4� Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
            edit1.text := FormatFloat('#####0.00',v);
            Edit1.SelStart := Length(Edit1.text) ;

end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Edit1Click(Sender: TObject);
begin
  Edit1.SelStart := Length(Edit1.text) ;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;

    //Fun��o para posicionar o cursor sempre na direita
    Edit1.SelStart := Length(Edit1.text);

end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.FormShow(Sender: TObject);
begin

  ADOQUERY_DENTISTA.Active := FALSE ;
  ADOQUERY_DENTISTA.Active := TRUE ;
  Image2Click(SELF);

end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Image2Click(Sender: TObject);
begin
  DB_DENTISTA.KeyValue := -1 ;
  RadioGroup1.ItemIndex := -1 ;
  MaskEdit1.Clear;
  Edit1.Clear;
  DB_DENTISTA.SetFocus;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Image4Click(Sender: TObject);
begin
UNIT_GRAVA_PAGAMENTO_DENTISTA.FORM_GRAVA_PAGAMENTO_DENTISTA.Close;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Image4MouseLeave(Sender: TObject);
begin
image4.Visible := false ;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Image5MouseEnter(Sender: TObject);
begin
Image4.Visible := true ;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Image7Click(Sender: TObject);
var
  dia, mes, ano : string;
  dia_c, mes_c, ano_c, hora_c : string;
  Valor_caixa, Valor_pagamento : real;
begin

  if VarIsNull(DB_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Escolha o dentista!', 'Aten��o!', MB_ICONWARNING);
    DB_DENTISTA.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de data!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o status!', 'Aten��o!', MB_ICONERROR);
    RadioGroup1.SetFocus;
    Exit;
  end;

  if (Edit1.Text='')or(Edit1.Text='0,00') then
  begin
    Application.MessageBox('Preencha o campo de valor!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);
  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  with GRAVA_PAG_DENTISTA.Parameters do
  begin
    ParamByName('@CODIGO_DENTISTA').Value := DB_DENTISTA.KeyValue;
    ParamByName('@VALOR').Value := Edit1.Text;
    ParamByName('@DATA_PAGAMENTO').Value := ano + '-' + mes + '-' + dia;
    ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
  end;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_PAG_DENTISTA.Parameters.ParamByName('@STATUS').Value := '1' ;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    GRAVA_PAG_DENTISTA.Parameters.ParamByName('@STATUS').Value := '0' ;
  end;

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
     Valor_pagamento := StrToFloat(Edit1.Text);

      if Valor_pagamento > Valor_caixa then
      begin
        Application.MessageBox('N�o h� dinheiro suficiente no caixa para realizar esta opera��o','ATEN��O',MB_ICONEXCLAMATION);
        exit;
      end;
    GRAVA_PAG_DENTISTA.ExecProc;

                with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
                begin
                  CLOSE;
                  Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
                  OPEN;
                end;
                with GRAVA_LOG do
                begin
                  Parameters.ParamByName('@DESCRICAO').Value := 'Pag. dentista n� ' + INTTOSTR(GRAVA_PAG_DENTISTA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
                  Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                  Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                  ExecProc;
                end;

        if RadioGroup1.ItemIndex = 0 then
        begin
          with GRAVA_DESPESA do
          begin
            Parameters.ParamByName('@TIPO').Value := 'PAG. DE DENTISTA';
            Parameters.ParamByName('@PRODUTO').Value := NULL ;
            Parameters.ParamByName('@PAG_FUNC').Value := NULL ;
            Parameters.ParamByName('@PAG_DENT').Value := GRAVA_PAG_DENTISTA.Parameters.ParamByName('@RETURN_VALUE').Value ;
            Parameters.ParamByName('@VALOR').Value := Edit1.Text ;
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
                  Parameters.ParamByName('@DESCRICAO').Value := 'Despesa n� ' + INTTOSTR(GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrada.' ;
                  Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                  Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                  ExecProc;
                end;
          with CAIXA_AUTOMATICO do
          begin
            Parameters.ParamByName('@DATA').Value :=  ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@ENTRADA').Value := '0.00';
            Parameters.ParamByName('@SAIDA').Value := Edit1.Text ;
            Parameters.ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@AVISTA').Value := null;
            Parameters.ParamByName('@APRAZO').Value := null;
            Parameters.ParamByName('@PARCELA').Value := null;
            Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value ;
            ExecProc;
          end;
        end;

        Image2Click(SELF);

        UNIT_PAGAMENTO_DENTISTA.FORM_PAGAMENTO_DENTISTA.ADOQuery1.Active := false ;
        UNIT_PAGAMENTO_DENTISTA.FORM_PAGAMENTO_DENTISTA.ADOQuery1.Active := true ;

  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.MaskEdit1Exit(Sender: TObject);
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

procedure TFORM_GRAVA_PAGAMENTO_DENTISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
