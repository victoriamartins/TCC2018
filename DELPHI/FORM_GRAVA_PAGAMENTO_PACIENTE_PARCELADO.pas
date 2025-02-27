unit FORM_GRAVA_PAGAMENTO_PACIENTE_PARCELADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, DBCtrls, Grids, DBGrids, ExtCtrls, CheckLst,
  ComCtrls, jpeg, pngimage;

type
  TFORM_GRAVA_PAGAMENTO_PARCELADO = class(TForm)
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    Label1: TLabel;
    DBLOOKUPCOMBOBOX_DENTISTA: TDBLookupComboBox;
    DATASOURCE_DENTISTA: TDataSource;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    Label5: TLabel;
    RadioGroup2: TRadioGroup;
    Edit2: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    GRAVA_PARCELAS: TADOStoredProc;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label9: TLabel;
    Image4: TImage;
    lbl_data: TLabel;
    Image2: TImage;
    Image7: TImage;
    Image1: TImage;
    GRAVA_PAGAMENTO_PARCELADO: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    Image3: TImage;
    Image5: TImage;
    PACIENTES_Q: TADOQuery;
    PACIENTES_DS: TDataSource;
    PACIENTES_QCOD_PACIENTE: TAutoIncField;
    PACIENTES_QNOME_PACIENTE: TStringField;
    PACIENTES_QRG_PACIENTE: TStringField;
    PACIENTES_QCPF_PACIENTE: TStringField;
    PACIENTES_QSEXO_PACIENTE: TStringField;
    PACIENTES_QNASCIMENTO_PACIENTE: TWideStringField;
    PACIENTES_QENDERECO_PACIENTE: TStringField;
    PACIENTES_QEMAIL_PACIENTE: TStringField;
    PACIENTES_QCIDADE_PACIENTE: TIntegerField;
    PACIENTES_QTEL1_PACIENTE: TStringField;
    PACIENTES_QTEL2_PACIENTE: TStringField;
    PACIENTES_QMENORDE18ANOS: TBooleanField;
    PACIENTES_QOBS_PACIENTE: TMemoField;
    PACIENTES_QSTATUS_PACIENTE: TBooleanField;
    PACIENTES_QDTHORACADASTRO_PACIENTE: TDateTimeField;
    Edit6: TEdit;
    Label10: TLabel;
    procedure RadioGroup2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PACIENTES_QSTATUS_PACIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure Edit6Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_PAGAMENTO_PARCELADO: TFORM_GRAVA_PAGAMENTO_PARCELADO;

implementation

uses Unit_TELA_PRINCIPAL, UNIT_CONS_PAGAM_PARCELADO;

{$R *.dfm}

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Button1Click(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c,mes_proximo, mes_escolhido, ano_hoje, dia_escolhido : string ;
  valor_total, valor_parcela : real ;
  num_parcelas, i : integer ;
  dia_2, mes_2, ano_2, mes_proximo_2, mes_escolhido_2, ano_hoje_2 : string ;
begin

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Escolha o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;

  if (Edit1.Text = EmptyStr)or(Edit1.Text = '0,00') then
  begin
    Application.MessageBox('Preencha o valor total do pagamento!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    exit;
  end;

  if Edit3.Text = EmptyStr then
  begin
    Application.MessageBox('Preencha o n�mero de parcelas do pagamento!', 'Aten��o!', MB_ICONWARNING);
    Edit3.SetFocus;
    exit;
  end;

  dia_c := Copy(lbl_data.Caption, 1, 2);
  dia_2 := Copy(DateToStr(DateTimePicker2.Date),1, 2);
  mes_c := Copy(lbl_data.Caption, 4, 2);
  ano_c := Copy(lbl_data.Caption, 7, 4);
  hora_c := Copy(lbl_data.Caption, 14, 8);
  ano_hoje := Copy(DateToStr(DateTimePicker1.Date),7,4);


  with GRAVA_PAGAMENTO_PARCELADO.Parameters do
  begin
    ParamByName('@PACIENTE').Value := PACIENTES_QCOD_PACIENTE.AsInteger;
    ParamByName('@OBS').Value := Memo1.Lines.Text ;
    ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue ;
    ParamByName('@VALOR_TOTAL').Value := Edit1.Text;
    ParamByName('@QUANTIA').Value := Edit3.Text;
    ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'CART�O' ;
  end
  else if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'CHEQUE' ;
  end
  else if RadioGroup2.ItemIndex = 2 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO' ;
  end
  else if RadioGroup2.ItemIndex = 4 then
  begin
    Edit2.Visible := TRUE ;
    Label5.Visible := TRUE ;
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := Edit2.Text ;
  end;

  valor_total := StrToFloat(Edit5.Text);
  num_parcelas := StrToInt(Edit3.Text);
  mes_escolhido := Copy(DateToStr(DateTimePicker1.Date),4,2);
  mes_escolhido_2 := Copy(DateToStr(DateTimePicker2.Date),4,2);
  ano_hoje_2 := Copy(DateToStr(DateTimePicker2.Date),7,4);

  valor_parcela := valor_total / num_parcelas ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin

              GRAVA_PAGAMENTO_PARCELADO.ExecProc;
              Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);

              i := 1 ;
              mes_proximo := mes_escolhido;
              mes_proximo_2 := mes_escolhido_2 ;

              if (Edit4.Text=emptystr)or(Edit4.Text='0,00') then
              BEGIN

              while i<=StrToInt(Edit3.Text) do
              begin

                with GRAVA_PARCELAS.Parameters do
                begin

                  ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                  ParamByName('@VALOR').Value := valor_parcela ;
                  ParamByName('@DESCONTO').Value := NULL ;
                  ParamByName('@STATUS_PARCELA').Value := '0';

                  if (StrToInt(mes_proximo) > 12) then
                  begin
                    mes_proximo := '01';
                    ano_hoje := IntToStr(StrToInt(ano_hoje) + 1);
                  end;

                  dia_escolhido := Copy(DateToStr(DateTimePicker1.Date),1,2);

                  ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje+'-'+mes_proximo+'-'+dia_escolhido;
                  ParamByName('@DATAPAGAMENTO').Value := null ;
                  ParamByName('@ENTRADA').Value := '0' ;
                  ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                  GRAVA_PARCELAS.ExecProc;

                  i := i + 1;
                  mes_proximo := IntToStr(StrToInt(mes_proximo) + 1);

                end;
              end;
              image2Click(self);
              END

              //SE HOUVER ENTRADA ////////////////////////////////////////////////////
              else if Edit4.Text <> '0,00' then
              begin

                  while i<=StrToInt(Edit3.Text) do
                  begin
                    // grava parcelas
                    with GRAVA_PARCELAS.Parameters do
                    begin

                      ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                      ParamByName('@VALOR').Value := valor_parcela ;
                      ParamByName('@DESCONTO').Value := NULL ;
                      ParamByName('@STATUS_PARCELA').Value := '0';

                      if (StrToInt(mes_proximo) > 12) then
                      begin
                        mes_proximo := '01';
                        ano_hoje := IntToStr(StrToInt(ano_hoje) + 1);
                      end;

                      dia_escolhido := Copy(DateToStr(DateTimePicker1.Date),1,2);

                      ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje+'-'+mes_proximo+'-'+dia_escolhido;
                      ParamByName('@DATAPAGAMENTO').Value := null ;
                      ParamByName('@ENTRADA').Value := '0' ;
                      ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                      GRAVA_PARCELAS.ExecProc;

                      i := i + 1;
                      mes_proximo := IntToStr(StrToInt(mes_proximo) + 1);

                    end;
                  end;
                    // grava entrada

                    with GRAVA_PARCELAS.Parameters do
                    begin

                      ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                      ParamByName('@VALOR').Value := Edit4.Text ;
                      ParamByName('@DESCONTO').Value := NULL ;
                      ParamByName('@STATUS_PARCELA').Value := '0';

                      if (StrToInt(mes_proximo_2) > 12) then
                      begin
                        mes_proximo_2 := '01';
                        ano_hoje_2 := IntToStr(StrToInt(ano_hoje_2) + 1);
                      end;

                      ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje_2+'-'+mes_proximo_2+'-'+dia_2;
                      ParamByName('@DATAPAGAMENTO').Value := null ;
                      ParamByName('@ENTRADA').Value := '1' ;
                      ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                      GRAVA_PARCELAS.ExecProc;

                    end;

              end;

            image2Click(self);
  end //do if

  else
  begin
    exit;
  end;

end; // DO IF DO BOT�O

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.DateTimePicker1Exit(Sender: TObject);
var
  dia , mes , ano : string ;
  dia_l, mes_l, ano_l : string;
begin

  dia := Copy(DateToStr(DateTimePicker1.Date),1,2);
  mes := Copy(DateToStr(DateTimePicker1.Date),4,2);
  ano := Copy(DateToStr(DateTimePicker1.Date),7,4);
  dia_l := Copy(lbl_data.Caption, 1, 2);
  mes_l := Copy(lbl_data.Caption, 4, 2);
  ano_l := Copy(lbl_data.Caption, 7, 4);

  if StrToInt(ano) < StrToInt(ano_l) then
  begin
    Application.MessageBox('Ano inv�lido!', 'Aten��o!', MB_ICONWARNING);
    DateTimePicker1.SetFocus;
    Exit;
  end
  else if (StrToInt(ano) = StrToInt(ano_l))and(StrToInt(mes) < StrToInt(mes_l)) then
  begin
    Application.MessageBox('M�s inv�lido!', 'Aten��o!', MB_ICONWARNING);
    DateTimePicker1.SetFocus;
    Exit;
  end
  else if (StrToInt(ano) = StrToInt(ano_l))and(StrToInt(mes) = StrToInt(mes_l))and (StrToInt(dia) < StrToInt(dia_l)) then
  begin
    Application.MessageBox('Dia inv�lido!', 'Aten��o!', MB_ICONWARNING);
    DateTimePicker1.SetFocus;
    Exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
    begin
        TDBGrid(Sender).Canvas.Brush.Color:=  $00E6E6CC;
    end
    else
    begin
        TDBGrid(Sender).Brush.Color:= clCream;
    end;

    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
        begin
          Brush.Color := $00BABA77;
          FillRect(Rect);
          Font.Style := [fsbold]
        end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit1Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
  total, entrada, textodoedit : real ;
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

    if (Edit4.Text <> EmptyStr)then
    begin
      total := StrToFloat(Edit1.Text);
      entrada := StrToFloat(Edit4.Text);
      textodoedit := total - entrada ;
      Edit5.Text := FloatToStr(textodoedit);
    end;


end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit1DblClick(Sender: TObject);
begin
  Edit1.SelStart := Length(Edit1.text) ;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;

  Edit1.SelStart := Length(Edit1.text);

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit3Exit(Sender: TObject);
var
  i : integer ;
begin

  if (Edit3.Text = EmptyStr)or(Edit3.Text <> '0')or(Edit3.Text <> '00') then
  begin
     exit ;
  end;

      i := StrToInt(Edit3.Text) ;

      if i>12 then
      begin
        Application.MessageBox('Quantia inv�lida de parcelas!', 'Aten��o!', MB_ICONWARNING);
        Edit3.SetFocus;
      end;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  key := UpCase(key);
  if key in ['A'..'Z',#32] then
  begin
     key := #0;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit4Change(Sender: TObject);
VAR
  total , entrada, parcelar : real ;
  s : string;
  v : double;
  I : integer;
begin

  total := StrToFloat(Edit1.Text);
  entrada := StrToFloat(Edit4.Text);
  parcelar := total - entrada ;

  Edit5.Text := FloatToStr(parcelar);

  if (Edit4.Text = '0,00')or(Edit4.Text = emptystr)or(Edit4.Text = '0') then
  begin
    Edit5.Text := Edit1.Text ;
  end;

      //1� Passo : se o edit estiver vazio, nada pode ser feito.
    If (Edit4.Text = emptystr) then
      Begin
        Edit4.Text := '0,00';
        Exit;
      End;
    //2� Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
    s := '';
    for I := 1 to length(edit4.Text) do
        if (edit4.text[I] in ['0'..'9']) then
            s := s + edit4.text[I];

            //3� Passo : fazer com que o conte�do do edit apresente 2 casas decimais:
            v := strtofloat(s);
            v := (v /100); // para criar 2 casa decimais

            //4� Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
            edit4.text := FormatFloat('#####0.00',v);
            Edit4.SelStart := Length(Edit4.text) ;



end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit4Exit(Sender: TObject);
begin

  if Edit4.Text = '' then
  BEGIN
    Exit;
  END;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  key := UpCase(key);
  if key in ['A'..'Z',#32] then
  begin
     key := #0;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Edit6Change(Sender: TObject);
begin

  if Edit6.Text = '' then
  begin
    PACIENTES_Q.Close;
    PACIENTES_Q.Active := false ;
    PACIENTES_Q.SQL.Clear;
    PACIENTES_Q.SQL.Text := 'SELECT * FROM TB_PACIENTE WHERE status_paciente=1';
    PACIENTES_Q.Active := true ;
    PACIENTES_Q.Open;
  end
  else
  begin
    with PACIENTES_Q do
    begin
      close;
      Active := false ;
      sql.Clear ;
      SQL.AdD('SELECT * FROM TB_PACIENTE WHERE status_paciente=1');
      SQL.ADD(' AND NOME_PACIENTE LIKE '+ QuotedStr(Edit6.Text+'%'));
      Active := true ;
      open;
    end;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    WITH UNIT_CONS_PAGAM_PARCELADO.Form_CONS_PAGAM_PARCELADO DO
    BEGIN
      WITH QUERY_PARCELA DO
      BEGIN
        Active:=False;
        Active:=TRUE;
      END;
      WITH QUERY_PARCELAMENTO DO
      BEGIN
        Active:=False;
        Active:=TRUE;
      END;
    END;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
  DateTimePicker1.Date := Date ;
  DateTimePicker2.Date := Date ;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.FormShow(Sender: TObject);
begin

  PACIENTES_Q.Active := FALSE;
  PACIENTES_Q.Active := TRUE ;
  ADOQUERY_DENTISTA.Active := FALSE ;
  ADOQUERY_DENTISTA.Active := TRUE  ;
  Image2Click(SELF);

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Image2Click(Sender: TObject);
begin
  //RadioGroup1.ItemIndex := -1;
  RadioGroup2.ItemIndex := -1;
  Memo1.Lines.Clear;
  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1 ;
  Edit2.Clear;
  Edit2.Visible := false ;
  Label5.Visible := false ;
  Edit3.Clear;
//  Edit4.Clear;
  Edit4.Text := '0,00';
  Edit5.Clear;
  Edit1.Clear;
  Edit1.Text := '0,00';
  //ADOQUERY_PACIENTE_MENOR.Active := FALSE;
  //ADOQUERY_PACIENTE_MAIOR.Active := FALSE;
  DateTimePicker1.Date := date ;
  DateTimePicker2.Date := date ;
  DBGrid1.SetFocus;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Image3Click(Sender: TObject);
begin
FORM_GRAVA_PAGAMENTO_PACIENTE_PARCELADO.FORM_GRAVA_PAGAMENTO_PARCELADO.Close;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible := FALSE;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Image5MouseEnter(Sender: TObject);
begin
Image3.Visible := TRUE ;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Image7Click(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c,mes_proximo, mes_escolhido, ano_hoje, dia_escolhido : string ;
  valor_total, valor_parcela : real ;
  num_parcelas, i : integer ;
  dia_2, mes_2, ano_2, mes_proximo_2, mes_escolhido_2, ano_hoje_2 : string ;
begin

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Escolha o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;

  if (Edit1.Text = EmptyStr)or(Edit1.Text = '0,00') then
  begin
    Application.MessageBox('Preencha o valor do pagamento!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    exit;
  end;

  if Edit3.Text = EmptyStr then
  begin
    Application.MessageBox('Preencha o n�mero de parcelas do pagamento!', 'Aten��o!', MB_ICONWARNING);
    Edit3.SetFocus;
    exit;
  end;
  if RadioGroup2.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo de pagamento!', 'Aten��o!', MB_ICONWARNING);
    exit;
  end;

  dia_c := Copy(lbl_data.Caption, 1, 2);
  dia_2 := Copy(DateToStr(DateTimePicker2.Date),1, 2);
  mes_c := Copy(lbl_data.Caption, 4, 2);
  ano_c := Copy(lbl_data.Caption, 7, 4);
  hora_c := Copy(lbl_data.Caption, 14, 8);
  ano_hoje := Copy(DateToStr(DateTimePicker1.Date),7,4);
  {
  if ADOQUERY_PACIENTE_MENOR.Active = true then
  begin
        with GRAVA_PAGAMENTO_PARCELADO.Parameters do
        begin
          ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTE_MENORCOD_PACIENTE.AsInteger;
        end;
  end
  else if ADOQUERY_PACIENTE_MAIOR.Active = true then
  begin
        with GRAVA_PAGAMENTO_PARCELADO.Parameters do
        begin
          ADOQUERY_PACIENTE_MAIORCOD_PACIENTE.AsInteger;
        end;
  end;
  }
  with GRAVA_PAGAMENTO_PARCELADO.Parameters do
  begin
    ParamByName('@PACIENTE').Value := PACIENTES_QCOD_PACIENTE.AsInteger ;
    ParamByName('@OBS').Value := Memo1.Lines.Text ;
    ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue ;
    ParamByName('@VALOR_TOTAL').Value := Edit1.Text;
    ParamByName('@QUANTIA').Value := Edit3.Text;
    ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'CART�O' ;
  end
  else if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'CHEQUE' ;
  end
  else if RadioGroup2.ItemIndex = 2 then
  begin
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO' ;
  end
  else if RadioGroup2.ItemIndex = 4 then
  begin
    Edit2.Visible := TRUE ;
    Label5.Visible := TRUE ;
    GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@TIPO').Value := Edit2.Text ;
  end;

  valor_total := StrToFloat(Edit5.Text);
  num_parcelas := StrToInt(Edit3.Text);
  mes_escolhido := Copy(DateToStr(DateTimePicker1.Date),4,2);
  mes_escolhido_2 := Copy(DateToStr(DateTimePicker2.Date),4,2);
  ano_hoje_2 := Copy(DateToStr(DateTimePicker2.Date),7,4);

  valor_parcela := valor_total / num_parcelas ;


  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin

              GRAVA_PAGAMENTO_PARCELADO.ExecProc;


    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      close;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      open;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Pag. parcelado n� ' + INTtOSTR(GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

              Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);

              i := 1 ;
              mes_proximo := mes_escolhido;
              mes_proximo_2 := mes_escolhido_2 ;

              if (Edit4.Text=emptystr)or(Edit4.Text='0,00') then
              BEGIN

              while i<=StrToInt(Edit3.Text) do
              begin

                with GRAVA_PARCELAS.Parameters do
                begin

                  ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                  ParamByName('@VALOR').Value := valor_parcela ;
                  ParamByName('@DESCONTO').Value := NULL ;
                  ParamByName('@STATUS_PARCELA').Value := '0';
                  ParamByName('@OBS').Value := NULL;
                  if (StrToInt(mes_proximo) > 12) then
                  begin
                    mes_proximo := '01';
                    ano_hoje := IntToStr(StrToInt(ano_hoje) + 1);
                  end;

                  dia_escolhido := Copy(DateToStr(DateTimePicker1.Date),1,2);

                  ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje+'-'+mes_proximo+'-'+dia_escolhido;
                  ParamByName('@DATAPAGAMENTO').Value := null ;
                  ParamByName('@ENTRADA').Value := '0' ;
                  ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                  GRAVA_PARCELAS.ExecProc;

                  i := i + 1;
                  mes_proximo := IntToStr(StrToInt(mes_proximo) + 1);

                end;
              end;
             image2Click(self);
              END

              //SE HOUVER ENTRADA ////////////////////////////////////////////////////
              else if Edit4.Text <> '0,00' then
              begin

                  while i<=StrToInt(Edit3.Text) do
                  begin
                    // grava parcelas
                    with GRAVA_PARCELAS.Parameters do
                    begin

                      ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                      ParamByName('@VALOR').Value := valor_parcela ;
                      ParamByName('@DESCONTO').Value := NULL ;
                      ParamByName('@STATUS_PARCELA').Value := '0';
                      ParamByName('@OBS').Value := NULL;
                      if (StrToInt(mes_proximo) > 12) then
                      begin
                        mes_proximo := '01';
                        ano_hoje := IntToStr(StrToInt(ano_hoje) + 1);
                      end;

                      dia_escolhido := Copy(DateToStr(DateTimePicker1.Date),1,2);

                      ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje+'-'+mes_proximo+'-'+dia_escolhido;
                      ParamByName('@DATAPAGAMENTO').Value := null ;
                      ParamByName('@ENTRADA').Value := '0' ;
                      ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                      GRAVA_PARCELAS.ExecProc;

                      i := i + 1;
                      mes_proximo := IntToStr(StrToInt(mes_proximo) + 1);

                    end;
                  end;

                    // grava entrada
                    with GRAVA_PARCELAS.Parameters do
                    begin

                      ParamByName('@COD_PARCELAMENTO').Value := GRAVA_PAGAMENTO_PARCELADO.Parameters.ParamByName('@RETURN_VALUE').Value;
                      ParamByName('@VALOR').Value := StrToFloat(Edit4.Text) ;
                      ParamByName('@DESCONTO').Value := NULL ;
                      ParamByName('@STATUS_PARCELA').Value := '0';
                      ParamByName('@OBS').Value := NULL;
                      if (StrToInt(mes_proximo_2) > 12) then
                      begin
                        mes_proximo_2 := '01';
                        ano_hoje_2 := IntToStr(StrToInt(ano_hoje_2) + 1);
                      end;

                      ParamByName('@DATAVENCIMENTO').Value :=  ano_hoje_2+'-'+mes_proximo_2+'-'+dia_2;
                      ParamByName('@DATAPAGAMENTO').Value := null ;
                      ParamByName('@ENTRADA').Value := '1' ;
                      ParamByName('@DTHORA_CADASTRO').Value :=  ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

                      GRAVA_PARCELAS.ExecProc;

                    end;

              end;




            Image2Click(self);
  end //do if

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.PACIENTES_QSTATUS_PACIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if PACIENTES_QSTATUS_PACIENTE.AsBoolean=true then
  begin
    text := 'ATIVO';
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 3 then
  begin
    Edit2.Visible := true ;
    Label5.Visible := true ;
  end
  else
  begin
    Edit2.Visible := false ;
    Label5.Visible := false ;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_PARCELADO.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
