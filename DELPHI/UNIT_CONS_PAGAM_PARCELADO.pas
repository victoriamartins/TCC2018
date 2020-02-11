unit UNIT_CONS_PAGAM_PARCELADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, DB, ADODB, Grids, DBGrids, Menus, Mask,
  DBCtrls, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_CONS_PAGAM_PARCELADO = class(TForm)
    Image4: TImage;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    QUERY_PARCELA: TADOQuery;
    DS_PARCELA: TDataSource;
    ADOConnection1: TADOConnection;
    QUERY_PARCELAMENTO: TADOQuery;
    DS_PARCELAMENTO: TDataSource;
    Image2: TImage;
    Image8: TImage;
    Image3: TImage;
    Image1: TImage;
    PAGAR: TPopupMenu;
    REALIZARPAGAMENTO1: TMenuItem;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image5: TImage;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    RadioGroup2: TRadioGroup;
    Button1: TButton;
    Edit5: TEdit;
    Label6: TLabel;
    ADOSTORED_ALTERA_PARCELA: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit6: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Memo1: TMemo;
    RadioGroup4: TRadioGroup;
    ADOQueryPACIENTE: TADOQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    QUERY_PARCELAMENTOCOD_PARCELAMENTO: TAutoIncField;
    QUERY_PARCELAMENTOPACIENTE_PARCELAMENTO: TIntegerField;
    QUERY_PARCELAMENTONOME_PACIENTE: TStringField;
    QUERY_PARCELAMENTODENTISTA_PARCELAMENTO: TIntegerField;
    QUERY_PARCELAMENTONOME_DENTISTA: TStringField;
    QUERY_PARCELAMENTOTIPO_PARCELAMENTO: TStringField;
    QUERY_PARCELAMENTOVALOR_TOTAL: TBCDField;
    QUERY_PARCELAMENTOQUANTIA_PARCELAS: TIntegerField;
    QUERY_PARCELAMENTOOBS_PARCELAMENTO: TMemoField;
    QUERY_PARCELAMENTODTHORACADASTRO_PARCELADO: TDateTimeField;
    ADOQueryPACIENTECOD_PARCELAMENTO: TAutoIncField;
    ADOQueryPACIENTEPACIENTE_PARCELAMENTO: TIntegerField;
    ADOQueryPACIENTEDENTISTA_PARCELAMENTO: TIntegerField;
    ADOQueryPACIENTENOME_PACIENTE: TStringField;
    QUERY_PARCELACOD_PARCELA: TAutoIncField;
    QUERY_PARCELACOD_PARCELAMENTO: TIntegerField;
    QUERY_PARCELAPACIENTE_PARCELAMENTO: TIntegerField;
    QUERY_PARCELANOME_PACIENTE: TStringField;
    QUERY_PARCELADATAPAGAMENTO_PARCELA: TWideStringField;
    QUERY_PARCELADATAVENCIMENTO_PARCELA: TWideStringField;
    QUERY_PARCELAENTRADA_PARCELA: TBooleanField;
    QUERY_PARCELAENTRADA_PARCELA_STR: TStringField;
    QUERY_PARCELAVALOR_PARCELA: TBCDField;
    QUERY_PARCELADESCONTO_PARCELA: TBCDField;
    QUERY_PARCELASTATUS_PARCELA: TBooleanField;
    QUERY_PARCELASTATUS_PARCELA_STR: TStringField;
    QUERY_PARCELAOBS_PARCELA: TMemoField;
    QUERY_PARCELADTHORACADASTRO_PARCELA: TDateTimeField;
    ADOSTORED_PAGA_PARCELA: TADOStoredProc;
    Image6: TImage;
    Edit7: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Button2: TButton;
    Image7: TImage;
    Image9: TImage;
    lbl_data: TLabel;
    RV_PARCELAS: TRvDataSetConnection;
    PJ_PARCELAS: TRvProject;
    procedure Timer1Timer(Sender: TObject);
    procedure QUERY_PARCELAENTRADA_PARCELAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure QUERY_PARCELASTATUS_PARCELAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure Image2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure REALIZARPAGAMENTO1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure QUERY_PARCELAOBS_PARCELAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image9MouseEnter(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Image8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CONS_PAGAM_PARCELADO: TForm_CONS_PAGAM_PARCELADO;

implementation

uses FORM_GRAVA_PAGAMENTO_PACIENTE_PARCELADO, Unit_TELA_PRINCIPAL;

{$R *.dfm}



procedure TForm_CONS_PAGAM_PARCELADO.LabelAtualizado(Sender: TObject);
VAR
  DIA_PAG, DIA_VEN, MES_PAG, MES_VEN, ANO_PAG, ANO_VEN : STRING;
begin
      Edit6.Text := IntToStr(QUERY_PARCELACOD_PARCELA.AsInteger);
        Label18.Caption := IntToStr(QUERY_PARCELACOD_PARCELA.AsInteger);
 //     DBLookupComboBox1.KeyValue := QUERY_PARCELACOD_PARCELAMENTO.AsInteger;
      DBLookupComboBox1.KeyValue := QUERY_PARCELACOD_PARCELAMENTO.AsInteger ;
        Label19.Caption := QUERY_PARCELANOME_PACIENTE.AsString;
      DIA_PAG := Copy(QUERY_PARCELADATAPAGAMENTO_PARCELA.AsString,9,2);
      MES_PAG := Copy(QUERY_PARCELADATAPAGAMENTO_PARCELA.AsString,6,2);
      ANO_PAG := Copy(QUERY_PARCELADATAPAGAMENTO_PARCELA.AsString,1,4);
      MaskEdit1.Text := DIA_PAG+'/'+MES_PAG+'/'+ANO_PAG ;
        Label20.Caption := DIA_PAG+'/'+MES_PAG+'/'+ANO_PAG ;
      DIA_VEN := Copy(QUERY_PARCELADATAVENCIMENTO_PARCELA.AsString,9,2);
      MES_VEN := Copy(QUERY_PARCELADATAVENCIMENTO_PARCELA.AsString,6,2);
      ANO_VEN := Copy(QUERY_PARCELADATAVENCIMENTO_PARCELA.AsString,1,4);
      MaskEdit2.Text := DIA_VEN+'/'+MES_VEN+'/'+ANO_VEN ;
        Label21.Caption := DIA_VEN+'/'+MES_VEN+'/'+ANO_VEN ;
     if QUERY_PARCELAENTRADA_PARCELA.AsBoolean = true then
     begin
         RadioGroup4.ItemIndex := 1;
         Label22.Caption := 'ENTRADA';
     end
     ELSE if QUERY_PARCELAENTRADA_PARCELA.AsBoolean = FALSE then
     begin
         RadioGroup4.ItemIndex := 0;
         Label22.Caption := 'PARCELA';
     end;

        Label23.Caption := CurrToStr(QUERY_PARCELAVALOR_PARCELA.AsCurrency);
        Label24.Caption := CurrToStr(QUERY_PARCELADESCONTO_PARCELA.AsCurrency);
     if QUERY_PARCELASTATUS_PARCELA.AsBoolean = true then
     begin

       Label25.Caption := 'PAGA';
     end
     else if QUERY_PARCELASTATUS_PARCELA.AsBoolean = false then
     begin

       Label25.Caption := 'N�O PAGA';
     end;

     Memo1.Lines.Text := QUERY_PARCELAOBS_PARCELA.AsString;
       Label26.Caption := QUERY_PARCELAOBS_PARCELA.AsString;


end;

procedure TForm_CONS_PAGAM_PARCELADO.MaskEdit1Exit(Sender: TObject);
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
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 10 then
  begin
     Application.MessageBox('Preencha todos os d�gitos da data!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit1.SetFocus;
  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.MaskEdit2Exit(Sender: TObject);
const
   caracteres = '0123456789/';
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

  if cont < 10 then
  begin
     Application.MessageBox('Preencha todos os d�gitos da data!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit2.SetFocus;
  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Button1Click(Sender: TObject);
var
dia_c, mes_c, ano_c, valor_novo, hora_c : string ;
total : real ;
begin

   dia_c := Copy(lbl_data.Caption,1,2);
   mes_c := Copy(lbl_data.Caption,4,2);
   ano_c := Copy(lbl_data.Caption,7,4);
   hora_c := Copy(lbl_data.Caption,14,8);

  with ADOSTORED_PAGA_PARCELA.Parameters do
  begin
    ParamByName('@CODIGO').Value := Edit1.Text ;
  end;
    total := StrToFloat(Edit5.Text);

  if (RadioGroup2.ItemIndex = 0) OR (Edit3.Text = Edit2.Text) then
  begin
    with ADOSTORED_PAGA_PARCELA.Parameters do
    begin
        ParamByName('@STATUS_PARCELA').Value := 1 ;

        if Edit4.Text <> EmptyStr then
        begin
          ParamByName('@DESCONTO').Value := Edit4.Text;
        end;
        if Edit4.Text = EmptyStr then
        begin
          ParamByName('@DESCONTO').Value := null ;
        end;
        ParamByName('@DATA').Value := ano_c + '-' + mes_c + '-' + dia_c ;
        ParamByName('@VALOR').Value := total ;
    end;
    QUERY_PARCELA.Active := FALSE ;
    QUERY_PARCELA.Active := TRUE ;
  end

  else if (RadioGroup2.ItemIndex = 1) OR (Edit3.Text <> Edit2.Text) then
  begin
    with ADOSTORED_PAGA_PARCELA.Parameters do
    begin
      ParamByName('@STATUS_PARCELA').Value := 0 ;

      if Edit4.Text <> EmptyStr then
      begin
        ParamByName('@DESCONTO').Value := Edit4.Text;
      end;
      if Edit4.Text = EmptyStr then
      begin
        ParamByName('@DESCONTO').Value := null ;
      end;
        ParamByName('@DATA').Value := ano_c + '-' + mes_c + '-' + dia_c ;
      ParamByName('@VALOR').Value := total ;
    end;
    QUERY_PARCELA.Active := FALSE ;
    QUERY_PARCELA.Active := TRUE ;
  end;

 if Application.MessageBox('Tem certeza que deseja pagar a parcela?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin

    ADOSTORED_PAGA_PARCELA.ExecProc;



////////////////////LOG E CAIXA////////////////////////
    if RadioGroup2.ItemIndex = 0 then
    begin

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Parcela n� ' + Edit1.Text + ' paga inteiramente.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

          with CAIXA_AUTOMATICO do
          begin
            Parameters.ParamByName('@DATA').Value :=  ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@SAIDA').Value := '0.00';
            Parameters.ParamByName('@ENTRADA').Value := Edit5.Text ;
            Parameters.ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@AVISTA').Value := null;
            Parameters.ParamByName('@APRAZO').Value := null;
            Parameters.ParamByName('@PARCELA').Value := Edit1.Text;
            Parameters.ParamByName('@DESPESA').Value := null ;
            ExecProc;
          end;

    end

    else if RadioGroup2.ItemIndex = 1 then
    begin
        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Parcela n� ' + Edit1.Text + ' paga parcialmente.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

          with CAIXA_AUTOMATICO do
          begin
            Parameters.ParamByName('@DATA').Value :=  ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@SAIDA').Value := '0.00';
            Parameters.ParamByName('@ENTRADA').Value := Edit3.Text ;
            Parameters.ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@AVISTA').Value := null;
            Parameters.ParamByName('@APRAZO').Value := null;
            Parameters.ParamByName('@PARCELA').Value := Edit1.Text;
            Parameters.ParamByName('@DESPESA').Value := null ;
            ExecProc;
          end;
    end;
///////////////////////////////////////////////


    Panel1.Visible := false ;
    QUERY_PARCELA.Active := false ;
    QUERY_PARCELA.Active := true ;
    QUERY_PARCELAMENTO.Active := false ;
    QUERY_PARCELAMENTO.Active := true ;




     Edit1.Clear;

     Edit3.Clear;
     Edit4.Clear;
     Edit2.Clear;
     Edit5.Clear;
     RadioGroup2.ItemIndex := -1;

  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Button2Click(Sender: TObject);
begin
    RadioGroup1.ItemIndex := -1;
    RadioGroup3.ItemIndex := -1;
    Edit7.Clear ;
            QUERY_PARCELA.close;
            QUERY_PARCELA.Active := false;
            QUERY_PARCELA.SQL.Clear;
            QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
              '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
              '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
              '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
              '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
              '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
              '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
              ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
              ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
              ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     ';
            QUERY_PARCELA.Active := true;
            QUERY_PARCELA.open;
    Edit7.Enabled := FALSE;
end;

procedure TForm_CONS_PAGAM_PARCELADO.DBGrid1CellClick(Column: TColumn);
begin
   ADOQueryPACIENTE.Active := FALSE;
   ADOQueryPACIENTE.Active := TRUE;

    LabelAtualizado(self);

    Edit6.Visible := FALSE;
    DBLookupComboBox1.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    Memo1.Visible := FALSE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;
    Label25.Visible := TRUE;
    Label26.Visible := TRUE;
    DBGrid2.DataSource.DataSet.RecNo := QUERY_PARCELACOD_PARCELAMENTO.AsInteger;

end;

procedure TForm_CONS_PAGAM_PARCELADO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_PARCELADO.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_PARCELADO.Edit3Change(Sender: TObject);
var
  valor , desc , pago : real ;
begin

    if (Edit3.ReadOnly = false)and(RadioGroup2.ItemIndex = 1)then
    begin

    if Edit4.Text = EmptyStr then
    begin
      desc := 0.00 ;
    end
    else
    begin
      desc := StrToFloat(Edit4.Text);
    end;

    Edit2.Text := FloatToStr(QUERY_PARCELAVALOR_PARCELA.AsFloat);
    valor :=  StrToFloat(Edit2.Text);

    if Edit3.Text = EmptyStr then
    begin
      pago := 0.00 ;
    end
    else
    begin
      pago := StrToFloat(Edit3.Text);
    end;


     Edit5.Text := FloatToStr(valor - (desc + pago))

    end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if key in ['A'..'Z',#32] then
  begin
     key := #0;
  end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Edit4Change(Sender: TObject);
VAR
  valor , desc , pago : real ;


begin


  if RadioGroup2.ItemIndex = 0 then
  begin
        if Edit4.Text = EmptyStr then
        begin
          desc := 0.00 ;
        end
        else
        begin
          desc := StrToFloat(Edit4.Text);
        end;

        valor :=  StrToFloat(Edit2.Text);

        Edit5.Text := FloatToStr(valor - desc)
  end;

  if RadioGroup2.ItemIndex = 1 then
  begin
      if Edit4.Text = EmptyStr then
      begin
        desc := 0.00 ;
      end
      else
      begin
        desc := StrToFloat(Edit4.Text);
      end;

      valor :=  StrToFloat(Edit2.Text);

      if Edit3.Text = EmptyStr then
      begin
        pago := 0.00 ;
      end
      else
      begin
        pago := StrToFloat(Edit3.Text);
      end;


       Edit5.Text := FloatToStr(valor - (desc + pago))
  end;

{
  if RadioGroup2.ItemIndex = 0 then
  begin

    Edit3.CLEAR;
    Edit3.Text := Edit2.Text ;
    Edit3.Enabled := false ;
    valor := Edit2.Text ;

      if Edit4.Text <> EmptyStr then
      begin
        desc := Edit4.Text ;
      end
      else
      begin
        desc := '0';
      end;

    Edit5.Text := FloatToStr(StrToFloat(valor) - StrToFloat(desc)) ;

  end

  else if RadioGroup2.ItemIndex = 1 then
  begin

    Edit5.Clear;
    Edit3.Clear;

    Edit1.Enabled := true ;
    Edit2.Enabled := true ;
    Edit3.Enabled := true ;
    Edit4.Enabled := true ;
    Edit5.Enabled := true ;

    Edit4.SetFocus;
    valor := Edit2.Text ;
    //pago := Edit3.Text;
      if Edit4.Text <> EmptyStr then
      begin
        desc := Edit4.Text ;
      end
      else
      begin
        desc := '0';
      end;
      if Edit3.Text <> EmptyStr then
      begin
        pago := Edit3.Text ;
      end
      else
      begin
        pago := '0';
      end;
    Edit5.Text := FloatToStr(StrToFloat(valor) - StrToFloat(desc) - StrToFloat(pago)) ;

  end;
}
end;

procedure TForm_CONS_PAGAM_PARCELADO.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if key in ['A'..'Z',#32] then
  begin
     key := #0;
  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Edit7Change(Sender: TObject);
begin

    if RadioGroup3.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then  //PACIENTE
        begin
            QUERY_PARCELA.close;
            QUERY_PARCELA.Active := false;
            QUERY_PARCELA.SQL.Clear;
            QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
              '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
              '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
              '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
              '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
              '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
              '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
              ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
              ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
              ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
              ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
            QUERY_PARCELA.Active := true;
            QUERY_PARCELA.open;
        end
        else if RadioGroup1.ItemIndex = 1 then   //DTPAG
        begin
            QUERY_PARCELA.close;
            QUERY_PARCELA.Active := false;
            QUERY_PARCELA.SQL.Clear;
            QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
              '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
              '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
              '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
              '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
              '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
              '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
              ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
              ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
              ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
              ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
            QUERY_PARCELA.Active := true;
            QUERY_PARCELA.open;
        end
        else if RadioGroup1.ItemIndex = 2 then   //DT VENC
        begin
            QUERY_PARCELA.close;
            QUERY_PARCELA.Active := false;
            QUERY_PARCELA.SQL.Clear;
            QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
              '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
              '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
              '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
              '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
              '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
              '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
              ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
              ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
              ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
              ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
            QUERY_PARCELA.Active := true;
            QUERY_PARCELA.open;
        end;
    end
    else if RadioGroup3.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup3.ItemIndex=0 then //PENDENTES
          begin
                if RadioGroup1.ItemIndex = 0 then  //PACIENTE
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 0    '+
                      ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 1 then   //DTPAG
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 0    '+
                      ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 2 then   //DT VENC
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 0    '+
                      ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end;
          end

          else if RadioGroup3.ItemIndex=1 then //PAGOS
          begin
                if RadioGroup1.ItemIndex = 0 then  //PACIENTE
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 1    '+
                      ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 1 then   //DTPAG
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 1    '+
                      ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 2 then   //DT VENC
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  STATUS_PARCELA = 1    '+
                      ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end;
          end

          else if RadioGroup3.ItemIndex=2 then //ENTRADAS
          begin
                if RadioGroup1.ItemIndex = 0 then  //PACIENTE
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 1    '+
                      ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 1 then   //DTPAG
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 1    '+
                      ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 2 then   //DT VENC
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 1    '+
                      ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end;
          end;
          if RadioGroup3.ItemIndex=3 then //PARCELAS
          begin
                if RadioGroup1.ItemIndex = 0 then  //PACIENTE
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 0    '+
                      ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 1 then   //DTPAG
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 0    '+
                      ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end
                else if RadioGroup1.ItemIndex = 2 then   //DT VENC
                begin
                    QUERY_PARCELA.close;
                    QUERY_PARCELA.Active := false;
                    QUERY_PARCELA.SQL.Clear;
                    QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                      '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                      '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                      '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                      '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                      '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                      '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                      ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                      ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                      ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                      ' AND  ENTRADA_PARCELA = 0    '+
                      ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                    QUERY_PARCELA.Active := true;
                    QUERY_PARCELA.open;
                end;
          end;

    end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Edit7KeyPress(Sender: TObject;
  var Key: Char);
var
   Data_Automatica : string;
begin
   if (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 2) then
    begin
         if Key <> #8 then
         begin
              if Length(Edit7.Text)=4 then
              begin
                  Data_Automatica := Edit7.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit7.Text := Data_Automatica;
                  Edit7.SelStart := Length(Edit7.text);
              end;
              if Length(Edit7.Text)=7 then
              begin
                  Data_Automatica := Edit7.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit7.Text := Data_Automatica;
                  Edit7.SelStart := Length(Edit7.text);
              end;
         end
         else if Key = #8 then
         begin
           exit;
         end;
    end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    QUERY_PARCELA.Active := false;
    QUERY_PARCELA.Active := true;

    QUERY_PARCELAMENTO.Active := false;
    QUERY_PARCELAMENTO.Active := true;

    Button2Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        LabelAtualizado(SELF);
    end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.FormCreate(Sender: TObject);
begin
{  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
    with QUERY_PARCELA do
    begin
      close ;
      Active := false ;
      Sql.Clear;
      Sql.Add('Select * from TB_PARCELA');
      Active := true ;
      open ;
    end;}
    RadioGroup1.ItemIndex := -1;
end;

procedure TForm_CONS_PAGAM_PARCELADO.FormShow(Sender: TObject);
begin

    QUERY_PARCELA.Active := false;
    QUERY_PARCELA.Active := true;

    QUERY_PARCELAMENTO.Active := false;
    QUERY_PARCELAMENTO.Active := true;

    Button2Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        LabelAtualizado(SELF);
    end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image1Click(Sender: TObject);
VAR
  DIA_PAG, DIA_VEN, MES_PAG, MES_VEN, ANO_PAG, ANO_VEN : STRING;
  Parcela_Selecionada : integer;
begin

    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@CODIGO').Value :=           StrToInt(Edit6.Text);
    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@COD_PARCELAMENTO').Value := DBLookupComboBox1.KeyValue;
      DIA_PAG := Copy(MaskEdit1.Text,1,2);
      MES_PAG := Copy(MaskEdit1.Text,4,2);
      ANO_PAG := Copy(MaskEdit1.Text,7,4);
    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@DATAPAGAMENTO').Value :=    ANO_PAG+'-'+MES_PAG+'-'+DIA_PAG;
      DIA_VEN := Copy(MaskEdit2.Text,1,2);
      MES_VEN := Copy(MaskEdit2.Text,4,2);
      ANO_VEN := Copy(MaskEdit2.Text,7,4);
    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@DATAVENCIMENTO').Value :=   ANO_VEN+'-'+MES_VEN+'-'+DIA_VEN;

   if RadioGroup4.ItemIndex = 0 then
   begin
    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@ENTRADA').Value := 0 ;
   end
   else if RadioGroup4.ItemIndex = 1 then
   begin
    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@ENTRADA').Value := 1 ;
   end;

    ADOSTORED_ALTERA_PARCELA.Parameters.ParamByName('@OBS').Value :=  Memo1.Lines.Text  ;

    Parcela_Selecionada := DBGrid1.DataSource.DataSet.RecNo;
    ADOSTORED_ALTERA_PARCELA.ExecProc;

    QUERY_PARCELA.Active := false;
    QUERY_PARCELA.Active := true;

    DBGrid1.DataSource.DataSet.RecNo := Parcela_Selecionada;



    LabelAtualizado(self);
    Edit6.Visible := FALSE;
    DBLookupComboBox1.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    RadioGroup4.Visible := FALSE;


    Memo1.Visible := FALSE;

    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;
    Label25.Visible := TRUE;
    Label26.Visible := TRUE;

    Image1.Enabled := false;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image2Click(Sender: TObject);
begin
FORM_GRAVA_PAGAMENTO_PACIENTE_PARCELADO.FORM_GRAVA_PAGAMENTO_PARCELADO.ShowModal;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image3Click(Sender: TObject);
begin

    if (Edit6.Text ='0') or (Edit6.Text ='DADOS') then
    BEGIN
      Application.MessageBox('Selecione um pagamento!','ATEN��O!',MB_ICONEXCLAMATION);
      exit;
    END;

    if QUERY_PARCELASTATUS_PARCELA.AsBoolean = true  then
    begin
      Application.MessageBox('N�o � poss�vel alterar este pagamento, ele j� foi realizado!', 'ATEN��O!', MB_ICONINFORMATION);
      Exit;
    end
    else if QUERY_PARCELASTATUS_PARCELA.AsBoolean = false then
    begin

      Image1.Enabled := true;
      Label18.Visible := FALSE;
      Label19.Visible := FALSE;
      Label20.Visible := FALSE;
      Label21.Visible := FALSE;
      Label22.Visible := FALSE;
      Label26.Visible := FALSE;
      Edit6.Visible := TRUE;
      DBLookupComboBox1.Visible := TRUE;
     // DBLookupComboBox1.KeyValue := QUERY_PARCELAPACIENTE_PARCELAMENTO.AsInteger;
      MaskEdit1.Visible := TRUE;
      MaskEdit1.Enabled := false ;
      MaskEdit2.Visible := TRUE;
      RadioGroup4.Visible := TRUE;
      Memo1.Visible := TRUE;

    end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Image5Click(Sender: TObject);
begin
Panel1.Visible := false ;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image7Click(Sender: TObject);
begin
    Form_CONS_PAGAM_PARCELADO.Close;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image7MouseLeave(Sender: TObject);
begin
    Image7.Visible:=False;
    Image9.Visible := true;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image8Click(Sender: TObject);
begin

    QUERY_PARCELA.Active := FALSE ;
    QUERY_PARCELA.Active := TRUE ;
    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_PARCELAS.Execute;

end;

procedure TForm_CONS_PAGAM_PARCELADO.Image9Click(Sender: TObject);
begin
    Form_CONS_PAGAM_PARCELADO.Close;
end;

procedure TForm_CONS_PAGAM_PARCELADO.Image9MouseEnter(Sender: TObject);
begin
Image7.Visible:=True;
IMAGE9.Visible := FALSE ;
end;

procedure TForm_CONS_PAGAM_PARCELADO.QUERY_PARCELAENTRADA_PARCELAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if QUERY_PARCELAENTRADA_PARCELA.AsBoolean = false then
  begin
    Text:='PARCELA';
  end;
  if QUERY_PARCELAENTRADA_PARCELA.AsBoolean = true then
  begin
    Text:='ENTRADA';
  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.QUERY_PARCELAOBS_PARCELAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(QUERY_PARCELAOBS_PARCELA.AsString,1, 200);

end;

procedure TForm_CONS_PAGAM_PARCELADO.QUERY_PARCELASTATUS_PARCELAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if QUERY_PARCELASTATUS_PARCELA.AsBoolean = TRUE then
  begin
    Text:='PAGO';
  end;
  if QUERY_PARCELASTATUS_PARCELA.AsBoolean = FALSE then
  begin
    Text:='PENDENTE';
  end;
end;

procedure TForm_CONS_PAGAM_PARCELADO.RadioGroup1Click(Sender: TObject);
begin
    Edit7.Enabled := TRUE;
    Edit7.SetFocus;
end;

procedure TForm_CONS_PAGAM_PARCELADO.RadioGroup2Click(Sender: TObject);
VAR
  valor , desc , pago : real ;
begin

  if RadioGroup2.ItemIndex = 0 then
  begin

    Edit3.ReadOnly := true ;
    Edit3.Clear;
    Edit4.clear;
    Edit5.clear;

    Edit3.Text := Edit2.Text ;

    if Edit4.Text = EmptyStr then
    begin
      desc := 0.00 ;
    end
    else
    begin
      desc := StrToFloat(Edit4.Text);
    end;

    valor :=  StrToFloat(Edit2.Text);

    Edit5.Text := FloatToStr(valor - desc)
  end;


///////////////////////////////////////////////////////////////////////////////


  if RadioGroup2.ItemIndex = 1 then
  begin

    Edit3.ReadOnly := false ;
    Edit3.Clear;
    Edit4.clear;
    Edit5.clear;

    if Edit4.Text = EmptyStr then
    begin
      desc := 0.00 ;
    end
    else
    begin
      desc := StrToFloat(Edit4.Text);
    end;

    valor :=  StrToFloat(Edit2.Text);

    if Edit3.Text = EmptyStr then
    begin
      pago := 0.00 ;
    end
    else
    begin
      pago := StrToFloat(Edit3.Text);
    end;


     Edit5.Text := FloatToStr(valor - (desc + pago))

  end;

end;

procedure TForm_CONS_PAGAM_PARCELADO.RadioGroup3Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = -1 then ///// filtrando apenas pelo MOSTRAR :
    begin
          if RadioGroup3.ItemIndex = 0 then  //PENDENTES
          begin
              QUERY_PARCELA.close;
              QUERY_PARCELA.Active := false;
              QUERY_PARCELA.SQL.Clear;
              QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                ' AND  STATUS_PARCELA = 0    ';
              QUERY_PARCELA.Active := true;
              QUERY_PARCELA.open;
          end
          else if RadioGroup3.ItemIndex = 1 then   //PAGOS
          begin
              QUERY_PARCELA.close;
              QUERY_PARCELA.Active := false;
              QUERY_PARCELA.SQL.Clear;
              QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                ' AND  STATUS_PARCELA = 1    ';
              QUERY_PARCELA.Active := true;
              QUERY_PARCELA.open;
          end
          else if RadioGroup3.ItemIndex = 2 then   //ENTRADAS
          begin
              QUERY_PARCELA.close;
              QUERY_PARCELA.Active := false;
              QUERY_PARCELA.SQL.Clear;
              QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                ' AND  ENTRADA_PARCELA = 1  ';
              QUERY_PARCELA.Active := true;
              QUERY_PARCELA.open;
          end
          else if RadioGroup3.ItemIndex = 3 then   //PARCELA
          begin
              QUERY_PARCELA.close;
              QUERY_PARCELA.Active := false;
              QUERY_PARCELA.SQL.Clear;
              QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                ' AND  ENTRADA_PARCELA = 0  ';
              QUERY_PARCELA.Active := true;
              QUERY_PARCELA.open;
          end;

    end
    ELSE if RadioGroup1.ItemIndex <> -1 then   ///// filtrando apenas pelo MOSTRAR  e FILTRAR :
    begin
        if RadioGroup1.ItemIndex = 0 then //// PACIENTE
        begin
            if RadioGroup3.ItemIndex = 0 then  //PENDENTES
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 0    '+
                  ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 1 then   //PAGOS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 1    '+
                  ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 2 then   //ENTRADAS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 1  '+
                  ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 3 then   //PARCELA
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 0  '+
                  ' and NOME_PACIENTE LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end;
        end
        else if RadioGroup1.ItemIndex = 1 then //// DT PAGAMENTO
        begin
            if RadioGroup3.ItemIndex = 0 then  //PENDENTES
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 0    '+
                  ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 1 then   //PAGOS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 1    '+
                  ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 2 then   //ENTRADAS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 1  '+
                  ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 3 then   //PARCELA
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 0  '+
                  ' and DATAPAGAMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end;
        end
        else if RadioGroup1.ItemIndex = 2 then //// DT VENCIMENTO
        begin
            if RadioGroup3.ItemIndex = 0 then  //PENDENTES
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 0    '+
                  ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 1 then   //PAGOS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  STATUS_PARCELA = 1    '+
                  ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 2 then   //ENTRADAS
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 1  '+
                  ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end
            else if RadioGroup3.ItemIndex = 3 then   //PARCELA
            begin
                QUERY_PARCELA.close;
                QUERY_PARCELA.Active := false;
                QUERY_PARCELA.SQL.Clear;
                QUERY_PARCELA.sql.Text := 'select TB_PARCELA.COD_PARCELA, TB_PARCELA.COD_PARCELAMENTO, TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO, '+
                  '  (NOME_PACIENTE + '' - '' + convert(varchar(10),TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO)) as NOME_PACIENTE,                    '+
                  '  DATAPAGAMENTO_PARCELA, DATAVENCIMENTO_PARCELA, ENTRADA_PARCELA,                         '+
                  '  CASE ENTRADA_PARCELA WHEN 1 THEN ''ENTRADA'' ELSE ''PARCELA'' END ENTRADA_PARCELA_STR,      '+
                  '  VALOR_PARCELA, DESCONTO_PARCELA, STATUS_PARCELA,                                        '+
                  '  CASE STATUS_PARCELA WHEN 1 THEN ''PAGA'' ELSE ''PENDENTE'' END STATUS_PARCELA_STR,          '+
                  '  OBS_PARCELA,DTHORACADASTRO_PARCELA                                                      '+
                  ' from   TB_PAGAMENTO_PACIENTE_PARCELADO,TB_PARCELA,TB_PACIENTE                            '+
                  ' WHERE  TB_PARCELA.COD_PARCELAMENTO = TB_PAGAMENTO_PACIENTE_PARCELADO.COD_PARCELAMENTO    '+
                  ' AND TB_PAGAMENTO_PACIENTE_PARCELADO.PACIENTE_PARCELAMENTO = TB_PACIENTE.COD_PACIENTE     '+
                  ' AND  ENTRADA_PARCELA = 0  '+
                  ' and DATAVENCIMENTO_PARCELA LIKE '+ QuotedStr(Edit7.Text+'%') ;
                QUERY_PARCELA.Active := true;
                QUERY_PARCELA.open;
            end;
        end;
    end;


end;

procedure TForm_CONS_PAGAM_PARCELADO.REALIZARPAGAMENTO1Click(Sender: TObject);
begin

  if QUERY_PARCELASTATUS_PARCELA.AsBoolean = true then
  begin
    Application.MessageBox('J� est� paga!', 'Aten��o!', MB_ICONWARNING);
    EXIT;
  end
  else if QUERY_PARCELASTATUS_PARCELA.AsBoolean = false then
  begin
    Panel1.Visible := TRUE ;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    RadioGroup2.ItemIndex := -1 ;
    Edit1.Text := QUERY_PARCELACOD_PARCELA.AsString;
    Edit2.Text := QUERY_PARCELAVALOR_PARCELA.AsString;
    Panel1.Left := 440;
    Panel1.Top := 190;
  end


end;

procedure TForm_CONS_PAGAM_PARCELADO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
