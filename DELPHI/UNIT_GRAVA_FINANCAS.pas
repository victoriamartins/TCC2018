unit UNIT_GRAVA_FINANCAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DB, ADODB, Menus, pngimage, jpeg, DBCtrls;

type
  TFORM_GRAVA_FINANCAS = class(TForm)
    ADOConnection1: TADOConnection;
    Timer1: TTimer;
    Image2: TImage;
    MENU_ESTOQUE: TPopupMenu;
    Oqueisso1: TMenuItem;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image3: TImage;
    Image1: TImage;
    lbl_data: TLabel;
    PN_PRODUTOS: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    MaskEdit3: TMaskEdit;
    Edit5: TEdit;
    PN_DESPESAS: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    MaskEdit2: TMaskEdit;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    Edit7: TEdit;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    CAIXA_AUTOMATICO: TADOStoredProc;
    GRAVA_DESPESA: TADOStoredProc;
    GRAVA_PRODUTO: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Oqueisso1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7MouseEnter(Sender: TObject);
    procedure Image8MouseLeave(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PN_PRODUTOSMouseEnter(Sender: TObject);
    procedure PN_DESPESASMouseEnter(Sender: TObject);
    procedure Edit1MouseEnter(Sender: TObject);
    procedure Memo1MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FORM_GRAVA_FINANCAS: TFORM_GRAVA_FINANCAS;

implementation

uses  Unit_TELA_PRINCIPAL, Unit_DESPESAS, Unit_PRODUTOS, UNIT_CAIXA;

{$R *.dfm}

procedure TFORM_GRAVA_FINANCAS.ComboBox1Click(Sender: TObject);
begin

  if ComboBox1.ItemIndex = 9 then
   begin
      Edit5.Visible := true ;
      Label13.Visible:= true;
      GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := Edit5.Text;
   end

   else
   begin
     Edit5.Visible := false;
     Edit5.Clear;
     Label13.Visible:= false;
   end;

end;

procedure TFORM_GRAVA_FINANCAS.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key<>#13 then
  begin
     Key := #0;
  end;
end;

procedure TFORM_GRAVA_FINANCAS.ComboBox2Click(Sender: TObject);
begin
  if ComboBox2.ItemIndex<>4 then
  begin
    Edit7.Visible := false;
    Label15.Visible := false;

  end
  else  if ComboBox2.ItemIndex=4 then
  begin
    Edit7.Visible := true;
    Label15.Visible := true;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := Edit7.Text ;
  end;
end;

procedure TFORM_GRAVA_FINANCAS.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key<>#13 then
  begin
     Key := #0;
  end;
end;

procedure TFORM_GRAVA_FINANCAS.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.Edit1MouseEnter(Sender: TObject);
begin
  PN_PRODUTOS.ShowHint := true;
end;

procedure TFORM_GRAVA_FINANCAS.Edit2Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
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


end;

procedure TFORM_GRAVA_FINANCAS.Edit2Click(Sender: TObject);
begin
    Edit2.SelStart := Length(Edit2.text) ;
end;

procedure TFORM_GRAVA_FINANCAS.Edit2KeyPress(Sender: TObject; var Key: Char);
begin

  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;

  Edit2.SelStart := Length(Edit2.text);

  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_FINANCAS.Edit3Change(Sender: TObject);
 VAR
  total : real ;
  preco_unitario : real ;
  quantia : integer ;
begin

  if Edit3.Text='' then
  begin
    Edit6.Text:='';
    exit;
  end;

  preco_unitario := StrToFloat(Edit2.Text);
  quantia := StrToInt(Edit3.Text);
  total := preco_unitario * quantia ;
  Edit6.Text := FloatToStr(total);


end;

procedure TFORM_GRAVA_FINANCAS.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.Edit4Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin

     If (edit4.Text = emptystr) then
      Begin
        Edit4.Text := '0,00';
        Exit;
      End;

   s := '';
    for I := 1 to length(Edit4.Text) do
        if (Edit4.text[I] in ['0'..'9']) then
            s := s + edit4.text[I];
            v := strtofloat(s);
            v := (v /100);

    Edit4.text := FormatFloat('#####0.00',v);
    Edit4.SelStart := Length(Edit4.text) ;

end;

procedure TFORM_GRAVA_FINANCAS.Edit4Click(Sender: TObject);
begin

  Edit4.SelStart := Length(Edit2.text) ;

end;

procedure TFORM_GRAVA_FINANCAS.Edit4KeyPress(Sender: TObject; var Key: Char);
begin

  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;
    Edit4.SelStart := Length(Edit4.text);

  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFORM_GRAVA_FINANCAS.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_DESPESAS.Form_DESPESAS do
  begin
    ADOQuery1.Active := false;
    ADOQuery1.Active := true;
    ADOQuery2.Active := false;
    ADOQuery2.Active := true;
  end;
  WITH Unit_PRODUTOS.Form_PRODUTOS DO
  BEGIN
    ADOQuery1.Active := false;
    ADOQuery1.Active := true;
  END;

end;

procedure TFORM_GRAVA_FINANCAS.FormCreate(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_FINANCAS.FormShow(Sender: TObject);
begin

  ADOQUERY_DENTISTA.Close;
  ADOQUERY_DENTISTA.Open;
  Image4Click(SELF);
  Image6Click(SELF);

end;

procedure TFORM_GRAVA_FINANCAS.Image3Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
  dia, mes, ano : string ;
  dia_pag, mes_pag, ano_pag : string ;
  data_mask, data_lbl : string ;
  Valor_caixa, Valor_pagamento : real;
begin

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if (Edit2.Text='') or (Edit2.Text='0,00') then
  begin
    Application.MessageBox('Preencha o campo de pre�o unit�rio!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if (MaskEdit3.Text='') or (MaskEdit3.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha o campo de Pago em:!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if (ComboBox1.Text='')or(ComboBox1.Text='TIPO DO PRODUTO')then
  begin
    Application.MessageBox('Escolha o tipo do produto!', 'Aten��o!', MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;

  if (ComboBox1.Text='OUTROS')and(Edit5.Text='') then
  begin
    Application.MessageBox('Se o tipo for "OUTROS", preencha o campo de "OUTROS"!', 'Aten��o!', MB_ICONWARNING);
    Edit5.SetFocus;
    Exit;
  end;


   GRAVA_PRODUTO.Parameters.ParamByName('@NOME').Value := Edit1.Text;
   GRAVA_PRODUTO.Parameters.ParamByName('@DENTISTA').Value := DBLookupComboBox1.KeyValue;
   GRAVA_PRODUTO.Parameters.ParamByName('@PRECO_UNITARIO').Value := StrToFloat(Edit2.Text) ;

   if ComboBox1.ItemIndex = 0 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'ALIMENTO';
       GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ALIMENTO';
   end

   else if ComboBox1.ItemIndex = 1 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'ANEST�SICO';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ANEST�SICO';
   end

   else if ComboBox1.ItemIndex = 2 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'CLAREADOR';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'CLAREADOR';
   end

   else if ComboBox1.ItemIndex = 3 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'DESCART�VEIS';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'DESCART�VEIS';
   end

   else if ComboBox1.ItemIndex = 4 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'HIGIENE';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'HIGIENE';
   end

   else if ComboBox1.ItemIndex = 5 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'INSTRUMENTO';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'INSTRUMENTO';
   end

   else if ComboBox1.ItemIndex = 6 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'LIMPEZA';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'LIMPEZA';
   end

   else if ComboBox1.ItemIndex = 7 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'MEDICAMENTO';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'MEDICAMENTO';
   end

   else if ComboBox1.ItemIndex = 8 then
   begin
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'RESINA';
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'RESINA';
   end

   else if ComboBox1.ItemIndex = 9 then
   begin
     Edit5.Visible := true ;
     Label13.Visible := true;
     GRAVA_PRODUTO.Parameters.ParamByName('@TIPO').Value := Edit5.Text ;
     GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := Edit5.Text ;
   end;

   dia := Copy(MaskEdit1.Text,1,2);
   mes := Copy(MaskEdit1.Text,4,2);
   ano := Copy(MaskEdit1.Text,7,4);

   dia_pag := Copy(MaskEdit3.Text,1,2);
   mes_pag := Copy(MaskEdit3.Text,4,2);
   ano_pag := Copy(MaskEdit3.Text,7,4);
   //data_mask := ano + mes + dia ;

   dia_c := Copy(lbl_data.Caption,1,2);
   mes_c := Copy(lbl_data.Caption,4,2);
   ano_c := Copy(lbl_data.Caption,7,4);
   hora_c := Copy(lbl_data.Caption,14,8);
   //data_lbl := ano_c + mes_c + dia_c ;


   if(MaskEdit1.Text = '') or (MaskEdit1.Text = '  /  /    ') then
   begin
        GRAVA_PRODUTO.Parameters.ParamByName('@VALIDADE').Value :=  Null;
   end
   else
   begin
      GRAVA_PRODUTO.Parameters.ParamByName('@VALIDADE').Value :=  ano + '-' + mes + '-' + dia ;
   end;


   GRAVA_PRODUTO.Parameters.ParamByName('@DATA_PAGAMENTO').Value := ano_pag + '-' + mes_pag + '-' + dia_pag ;
   GRAVA_PRODUTO.Parameters.ParamByName('@QUANTIA').Value := StrToInt(Edit3.Text) ;
   GRAVA_PRODUTO.Parameters.ParamByName('@TOTAL').Value := StrToFloat(Edit6.Text) ;

   GRAVA_PRODUTO.Parameters.ParamByName('@DTHORACADASTRO_PRODUTO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

   GRAVA_DESPESA.Parameters.ParamByName('@VALOR').Value := Edit6.Text;
   GRAVA_DESPESA.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano_pag + '-' + mes_pag + '-' + dia_pag ;
   GRAVA_DESPESA.Parameters.ParamByName('@OBS').Value := '';
   GRAVA_DESPESA.Parameters.ParamByName('@DTHORACADASTRO_DESPESA').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

   //???????????????????????ULTIMO_PROD := GRAVA_PRODUTO.Parameters.ParamByName('@RETURN_VALUE').Value;



   if Application.MessageBox('Tem certeza que deseja cadastrar o produto?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
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

     Valor_pagamento := StrToFloat(Edit6.Text);

      if Valor_pagamento > Valor_caixa then
      begin
        Application.MessageBox('N�o h� dinheiro suficiente no caixa para realizar esta opera��o','ATEN��O',MB_ICONEXCLAMATION);
        exit;
      end;
     GRAVA_PRODUTO.ExecProc;
     Application.MessageBox('Produto cadastrado!', 'AVISO', MB_OK);

    ////// LOG DE PRODUTO
    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;
    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Produto N� ' + INTtOSTR(GRAVA_PRODUTO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;
    //////
    GRAVA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := GRAVA_PRODUTO.Parameters.ParamByName('@RETURN_VALUE').Value;
    GRAVA_DESPESA.Parameters.ParamByName('@PAG_FUNC').Value := NULL;
    GRAVA_DESPESA.Parameters.ParamByName('@PAG_DENT').Value := NULL;
    GRAVA_DESPESA.ExecProc;

    //log de despesa
    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;
    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Despesa N� ' + INTtOSTR(GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;
    //

      with CAIXA_AUTOMATICO do
       begin
         Parameters.ParamByName('@DATA').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
         Parameters.ParamByName('@ENTRADA').Value := '0.00';
         Parameters.ParamByName('@SAIDA').Value := Edit6.Text;
         Parameters.ParamByName('@DTCADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c  ;
         Parameters.ParamByName('@AVISTA').Value := NULL;
         Parameters.ParamByName('@APRAZO').Value := NULL;
         Parameters.ParamByName('@PARCELA').Value := NULL;
         Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value;
         ExecProc;
       end;


    Image4Click(SELF);
   end

   else
   begin
     exit;
   end;

end;

procedure TFORM_GRAVA_FINANCAS.Image4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit5.Clear;
  ComboBox1.Text := 'TIPO DO PRODUTO' ;
  MaskEdit1.Clear;
  MaskEdit3.Clear;
  Label13.Visible := false;
  DBLookupComboBox1.KeyValue := -1;
  Edit5.Visible := false ;
end;

procedure TFORM_GRAVA_FINANCAS.Image5Click(Sender: TObject);
VAR
  dia, mes, ano : string ;
  dia_c , mes_c, ano_c, hora_c: string;
  data_mask, data_lbl : string ;
  Valor_caixa, Valor_pagamento : real;
begin
  if (ComboBox2.Text='')or(ComboBox2.Text='TIPO DE DESPESA') then
  begin
    Application.MessageBox('Escolha o tipo de despesa!', 'Aten��o!', MB_ICONWARNING);
    ComboBox2.SetFocus;
    Exit;
  end;

  if (ComboBox2.ItemIndex=4) and (Edit7.Text='') then
  begin
    Application.MessageBox('Escolha o tipo de despesa!', 'Aten��o!', MB_ICONWARNING);
    Edit7.Visible := true;
    label15.Visible := true;
    Edit7.SetFocus;
    Exit;
  end;

  if Edit4.Text='' then
  begin
    Application.MessageBox('Preencha o valor da despesa!', 'Aten��o!', MB_ICONWARNING);
    Edit4.SetFocus;
    Exit;
  end;

  if (MaskEdit2.Text = '  /  /    ')or(MaskEdit2.Text='') then
  begin
    Application.MessageBox('Preencha a data de pagamento da despesa!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if ComboBox2.ItemIndex = 0 then
  begin
    Edit7.Visible := false;
    Label15.Visible := false;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := '�GUA' ;
  end

  else if ComboBox2.ItemIndex = 1 then
  begin
    Edit7.Visible := false;
    Label15.Visible := false;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ALUGUEL' ;
  end

  else if ComboBox2.ItemIndex = 2 then
  begin
    Edit7.Visible := false;
    Label15.Visible := false;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ENERGIA' ;
  end

  else if ComboBox2.ItemIndex = 3 then
  begin
    Edit7.Visible := false;
    Label15.Visible := false;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'INTERNET' ;
  end

  else if ComboBox2.ItemIndex = 4 then
  begin
    Edit7.Visible := true;
    Label15.Visible := true;
    GRAVA_DESPESA.Parameters.ParamByName('@TIPO').Value := Edit7.Text ;
  end;


  GRAVA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;

  GRAVA_DESPESA.Parameters.ParamByName('@VALOR').Value := Edit4.Text;

   dia := Copy(MaskEdit2.Text,1,2);
   mes := Copy(MaskEdit2.Text,4,2);
   ano := Copy(MaskEdit2.Text,7,4);
   data_mask := ano + mes + dia ;

  GRAVA_DESPESA.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano+mes+dia;
  GRAVA_DESPESA.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);
  data_lbl := ano_c + mes_c + dia_c ;

  GRAVA_DESPESA.Parameters.ParamByName('@DTHORACADASTRO_DESPESA').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;
  GRAVA_DESPESA.Parameters.ParamByName('@PAG_FUNC').Value := NULL;
  GRAVA_DESPESA.Parameters.ParamByName('@PAG_DENT').Value := NULL;


  if Application.MessageBox('Tem certeza que deseja cadastrar a despesa?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
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

     Valor_pagamento := StrToFloat(Edit4.Text);

      if Valor_pagamento > Valor_caixa then
      begin
        Application.MessageBox('N�o h� dinheiro suficiente no caixa para realizar esta opera��o','ATEN��O',MB_ICONEXCLAMATION);
        exit;
      end;
    GRAVA_DESPESA.ExecProc;

    ///// LOG DESPESA
    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;
    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Despesa N� ' + INTtOSTR(GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;
    /////


   with CAIXA_AUTOMATICO do
   begin
     Parameters.ParamByName('@DATA').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
     Parameters.ParamByName('@ENTRADA').Value := '0.00';
     Parameters.ParamByName('@SAIDA').Value := Edit4.Text;
     Parameters.ParamByName('@DTCADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
     Parameters.ParamByName('@AVISTA').Value := NULL;
     Parameters.ParamByName('@APRAZO').Value := NULL;
     Parameters.ParamByName('@PARCELA').Value := NULL;
     Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value;
     ExecProc;
   end;


    Application.MessageBox('Despesa cadastrada!', 'AVISO', MB_OK);
    Image6Click(SELF);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_FINANCAS.Image6Click(Sender: TObject);
begin
  ComboBox2.Text := 'TIPO DE DESPESA';
  Edit4.Clear;
  Edit7.Clear;
  Edit7.Visible := false ;
  Label15.Visible := false;
  MaskEdit2.Clear;
  Memo1.Lines.Text := '';

end;

procedure TFORM_GRAVA_FINANCAS.Image7MouseEnter(Sender: TObject);
begin
 Image8.Visible:=True;
end;

procedure TFORM_GRAVA_FINANCAS.Image8Click(Sender: TObject);
begin
UNIT_GRAVA_FINANCAS.FORM_GRAVA_FINANCAS.Close;
end;

procedure TFORM_GRAVA_FINANCAS.Image8MouseLeave(Sender: TObject);
begin
Image8.Visible:=False;
end;

procedure TFORM_GRAVA_FINANCAS.MaskEdit1Exit(Sender: TObject);
begin
  Exit;
end;

procedure TFORM_GRAVA_FINANCAS.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_FINANCAS.Memo1MouseEnter(Sender: TObject);
begin
  PN_DESPESAS.ShowHint := true;
end;

procedure TFORM_GRAVA_FINANCAS.Oqueisso1Click(Sender: TObject);
begin

  Application.MessageBox('Aqui voc� pode cadastrar os produtos comprados. � uma forma de visualizar os gastos da empresa!', 'Aten��o!', MB_ICONEXCLAMATION);

end;

procedure TFORM_GRAVA_FINANCAS.PN_DESPESASMouseEnter(Sender: TObject);
begin
  PN_DESPESAS.ShowHint := true;
end;

procedure TFORM_GRAVA_FINANCAS.PN_PRODUTOSMouseEnter(Sender: TObject);
begin
  PN_PRODUTOS.ShowHint := true;
end;

procedure TFORM_GRAVA_FINANCAS.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
