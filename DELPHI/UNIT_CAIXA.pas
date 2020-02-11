unit UNIT_CAIXA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, jpeg, pngimage, Menus;

type
  TFORM_CAIXA = class(TForm)
    Timer1: TTimer;
    ADOQUERY_CAIXA: TADOQuery;
    DATASOURCE_CAIXA: TDataSource;
    DBGRID_CAIXA: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQUERY_CAIXACOD_CAIXA: TAutoIncField;
    ADOQUERY_CAIXAENTRADA_CAIXA: TBCDField;
    ADOQUERY_CAIXASAIDA_CAIXA: TBCDField;
    ADOQUERY_CAIXATOTAL_CAIXA: TBCDField;
    ADOQUERY_CAIXADTCADASTRO_CAIXA: TDateTimeField;
    ADOQUERY_CAIXAPAGAMENTOS_AVISTA_CAIXA: TIntegerField;
    ADOQUERY_CAIXAPAGAMENTOS_APRAZO_CAIXA: TIntegerField;
    ADOQUERY_CAIXAPAGAMENTOS_PARCELAS_CAIXA: TIntegerField;
    ADOQUERY_CAIXADESPESAS_CAIXA: TIntegerField;
    RadioGroup1: TRadioGroup;
    ADOQUERY_CAIXA_DATA: TADOQuery;
    DATASOURCE_CAIXA_DATA: TDataSource;
    ADOQUERY_CAIXA_DATACOD_CAIXA: TAutoIncField;
    ADOQUERY_CAIXA_DATAENTRADA_CAIXA: TBCDField;
    ADOQUERY_CAIXA_DATASAIDA_CAIXA: TBCDField;
    ADOQUERY_CAIXA_DATATOTAL_CAIXA: TBCDField;
    ADOQUERY_CAIXA_DATADTCADASTRO_CAIXA: TDateTimeField;
    ADOQUERY_CAIXA_DATAPAGAMENTOS_AVISTA_CAIXA: TIntegerField;
    ADOQUERY_CAIXA_DATAPAGAMENTOS_APRAZO_CAIXA: TIntegerField;
    ADOQUERY_CAIXA_DATAPAGAMENTOS_PARCELAS_CAIXA: TIntegerField;
    ADOQUERY_CAIXA_DATADESPESAS_CAIXA: TIntegerField;
    Label1: TLabel;
    LBL_TOTAL: TLabel;
    ADOQUERY_TOTAL: TADOQuery;
    DATASOURCE_TOTAL: TDataSource;
    DBGrid1: TDBGrid;
    ADOQUERY_TOTALCOLUMN1: TBCDField;
    DATASOURCE_TOTAL_HOJE: TDataSource;
    ADOQUERY_TOTAL_HOJE: TADOQuery;
    ADOQUERY_TOTAL_HOJECOLUMN1: TBCDField;
    Image3: TImage;
    Image1: TImage;
    lbl_data: TLabel;
    Label2: TLabel;
    Image7: TImage;
    Image6: TImage;
    DETALHES: TPopupMenu;
    VERDETALHES1: TMenuItem;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    BUSCA_AV: TADOQuery;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Image2: TImage;
    Label8: TLabel;
    BUSCA_AP: TADOQuery;
    Label9: TLabel;
    Edit6: TEdit;
    BUSCA_APCOD_APRAZO: TAutoIncField;
    BUSCA_APPACIENTE_APRAZO: TIntegerField;
    BUSCA_APDENTISTA_APRAZO: TIntegerField;
    BUSCA_APVALOR_APRAZO: TBCDField;
    BUSCA_APDATAPAGAMENTO_APRAZO: TWideStringField;
    BUSCA_APTIPO_APRAZO: TStringField;
    BUSCA_APOBS_APRAZO: TMemoField;
    BUSCA_APSTATUS_PAGAMENTO: TBooleanField;
    BUSCA_APDTHORACADASTRO_APRAZO: TDateTimeField;
    BUSCA_APCOD_CAIXA: TAutoIncField;
    BUSCA_APENTRADA_CAIXA: TBCDField;
    BUSCA_APSAIDA_CAIXA: TBCDField;
    BUSCA_APTOTAL_CAIXA: TBCDField;
    BUSCA_APDTCADASTRO_CAIXA: TDateTimeField;
    BUSCA_APPAGAMENTOS_AVISTA_CAIXA: TIntegerField;
    BUSCA_APPAGAMENTOS_APRAZO_CAIXA: TIntegerField;
    BUSCA_APPAGAMENTOS_PARCELAS_CAIXA: TIntegerField;
    BUSCA_APDESPESAS_CAIXA: TIntegerField;
    BUSCA_APCOD_PACIENTE: TAutoIncField;
    BUSCA_APNOME_PACIENTE: TStringField;
    BUSCA_APRG_PACIENTE: TStringField;
    BUSCA_APCPF_PACIENTE: TStringField;
    BUSCA_APSEXO_PACIENTE: TStringField;
    BUSCA_APNASCIMENTO_PACIENTE: TWideStringField;
    BUSCA_APENDERECO_PACIENTE: TStringField;
    BUSCA_APEMAIL_PACIENTE: TStringField;
    BUSCA_APCIDADE_PACIENTE: TIntegerField;
    BUSCA_APTEL1_PACIENTE: TStringField;
    BUSCA_APTEL2_PACIENTE: TStringField;
    BUSCA_APMENORDE18ANOS: TBooleanField;
    BUSCA_APRESPONSAVEL_PACIENTE: TIntegerField;
    BUSCA_APOBS_PACIENTE: TMemoField;
    BUSCA_APSTATUS_PACIENTE: TBooleanField;
    BUSCA_APDTHORACADASTRO_PACIENTE: TDateTimeField;
    BUSCA_APCOD_DENTISTA: TAutoIncField;
    BUSCA_APNOME_DENTISTA: TStringField;
    BUSCA_APSEXO_DENTISTA: TStringField;
    BUSCA_APCRO_DENTISTA: TStringField;
    BUSCA_APEMAIL_DENTISTA: TStringField;
    BUSCA_APSTATUS_DENTISTA: TStringField;
    BUSCA_APDTHORACADASTRO_DENTISTA: TDateTimeField;
    BUSCA_AVCOD_AVISTA: TAutoIncField;
    BUSCA_AVPACIENTE_AVISTA: TIntegerField;
    BUSCA_AVDENTISTA_AVISTA: TIntegerField;
    BUSCA_AVVALOR_AVISTA: TBCDField;
    BUSCA_AVDATAPAGAMENTO_AVISTA: TWideStringField;
    BUSCA_AVTIPO_AVISTA: TStringField;
    BUSCA_AVSTATUS_PAGAMENTO: TBooleanField;
    BUSCA_AVDTHORACADASTRO_AVISTA: TDateTimeField;
    BUSCA_AVCOD_CAIXA: TAutoIncField;
    BUSCA_AVENTRADA_CAIXA: TBCDField;
    BUSCA_AVSAIDA_CAIXA: TBCDField;
    BUSCA_AVTOTAL_CAIXA: TBCDField;
    BUSCA_AVDTCADASTRO_CAIXA: TDateTimeField;
    BUSCA_AVPAGAMENTOS_AVISTA_CAIXA: TIntegerField;
    BUSCA_AVPAGAMENTOS_APRAZO_CAIXA: TIntegerField;
    BUSCA_AVPAGAMENTOS_PARCELAS_CAIXA: TIntegerField;
    BUSCA_AVDESPESAS_CAIXA: TIntegerField;
    BUSCA_AVCOD_PACIENTE: TAutoIncField;
    BUSCA_AVNOME_PACIENTE: TStringField;
    BUSCA_AVRG_PACIENTE: TStringField;
    BUSCA_AVCPF_PACIENTE: TStringField;
    BUSCA_AVSEXO_PACIENTE: TStringField;
    BUSCA_AVNASCIMENTO_PACIENTE: TWideStringField;
    BUSCA_AVENDERECO_PACIENTE: TStringField;
    BUSCA_AVEMAIL_PACIENTE: TStringField;
    BUSCA_AVCIDADE_PACIENTE: TIntegerField;
    BUSCA_AVTEL1_PACIENTE: TStringField;
    BUSCA_AVTEL2_PACIENTE: TStringField;
    BUSCA_AVMENORDE18ANOS: TBooleanField;
    BUSCA_AVRESPONSAVEL_PACIENTE: TIntegerField;
    BUSCA_AVOBS_PACIENTE: TMemoField;
    BUSCA_AVSTATUS_PACIENTE: TBooleanField;
    BUSCA_AVDTHORACADASTRO_PACIENTE: TDateTimeField;
    BUSCA_AVCOD_DENTISTA: TAutoIncField;
    BUSCA_AVNOME_DENTISTA: TStringField;
    BUSCA_AVSEXO_DENTISTA: TStringField;
    BUSCA_AVCRO_DENTISTA: TStringField;
    BUSCA_AVEMAIL_DENTISTA: TStringField;
    BUSCA_AVSTATUS_DENTISTA: TStringField;
    BUSCA_AVDTHORACADASTRO_DENTISTA: TDateTimeField;
    BUSCA_PA: TADOQuery;
    BUSCA_DP: TADOQuery;
    BUSCA_DPCOD_CAIXA: TAutoIncField;
    BUSCA_DPENTRADA_CAIXA: TBCDField;
    BUSCA_DPSAIDA_CAIXA: TBCDField;
    BUSCA_DPTOTAL_CAIXA: TBCDField;
    BUSCA_DPDTCADASTRO_CAIXA: TDateTimeField;
    BUSCA_DPPAGAMENTOS_AVISTA_CAIXA: TIntegerField;
    BUSCA_DPPAGAMENTOS_APRAZO_CAIXA: TIntegerField;
    BUSCA_DPPAGAMENTOS_PARCELAS_CAIXA: TIntegerField;
    BUSCA_DPDESPESAS_CAIXA: TIntegerField;
    BUSCA_DPCOD_DESPESA: TAutoIncField;
    BUSCA_DPTIPO_DESPESA: TStringField;
    BUSCA_DPPRODUTO_DESPESA: TIntegerField;
    BUSCA_DPPAG_FUNCIONARIO: TIntegerField;
    BUSCA_DPPAG_DENTISTA: TIntegerField;
    BUSCA_DPVALOR_DESPESA: TBCDField;
    BUSCA_DPDATAPAGAMENTO_DESPESA: TWideStringField;
    BUSCA_DPOBS_DESPESA: TMemoField;
    BUSCA_DPDTHORACADASTRO_DESPESA: TDateTimeField;
    BUSCA_PACOD_PARCELA: TAutoIncField;
    BUSCA_PACOD_PARCELAMENTO: TIntegerField;
    BUSCA_PADATAPAGAMENTO_PARCELA: TWideStringField;
    BUSCA_PADATAVENCIMENTO_PARCELA: TWideStringField;
    BUSCA_PAENTRADA_PARCELA: TBooleanField;
    BUSCA_PAVALOR_PARCELA: TBCDField;
    BUSCA_PADESCONTO_PARCELA: TBCDField;
    BUSCA_PASTATUS_PARCELA: TBooleanField;
    BUSCA_PAOBS_PARCELA: TMemoField;
    BUSCA_PADTHORACADASTRO_PARCELA: TDateTimeField;
    BUSCA_PACOD_PARCELAMENTO_1: TAutoIncField;
    BUSCA_PAPACIENTE_PARCELAMENTO: TIntegerField;
    BUSCA_PADENTISTA_PARCELAMENTO: TIntegerField;
    BUSCA_PATIPO_PARCELAMENTO: TStringField;
    BUSCA_PAVALOR_TOTAL: TBCDField;
    BUSCA_PAQUANTIA_PARCELAS: TIntegerField;
    BUSCA_PAOBS_PARCELAMENTO: TMemoField;
    BUSCA_PADTHORACADASTRO_PARCELADO: TDateTimeField;
    BUSCA_PACOD_PACIENTE: TAutoIncField;
    BUSCA_PANOME_PACIENTE: TStringField;
    BUSCA_PARG_PACIENTE: TStringField;
    BUSCA_PACPF_PACIENTE: TStringField;
    BUSCA_PASEXO_PACIENTE: TStringField;
    BUSCA_PANASCIMENTO_PACIENTE: TWideStringField;
    BUSCA_PAENDERECO_PACIENTE: TStringField;
    BUSCA_PAEMAIL_PACIENTE: TStringField;
    BUSCA_PACIDADE_PACIENTE: TIntegerField;
    BUSCA_PATEL1_PACIENTE: TStringField;
    BUSCA_PATEL2_PACIENTE: TStringField;
    BUSCA_PAMENORDE18ANOS: TBooleanField;
    BUSCA_PARESPONSAVEL_PACIENTE: TIntegerField;
    BUSCA_PAOBS_PACIENTE: TMemoField;
    BUSCA_PASTATUS_PACIENTE: TBooleanField;
    BUSCA_PADTHORACADASTRO_PACIENTE: TDateTimeField;
    BUSCA_PACOD_DENTISTA: TAutoIncField;
    BUSCA_PANOME_DENTISTA: TStringField;
    BUSCA_PASEXO_DENTISTA: TStringField;
    BUSCA_PACRO_DENTISTA: TStringField;
    BUSCA_PAEMAIL_DENTISTA: TStringField;
    BUSCA_PASTATUS_DENTISTA: TStringField;
    BUSCA_PADTHORACADASTRO_DENTISTA: TDateTimeField;
    procedure Timer1Timer(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure VERDETALHES1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBGRID_CAIXAMouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGRID_CAIXADrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_CAIXA: TFORM_CAIXA;

implementation

{$R *.dfm}

procedure TFORM_CAIXA.DBGRID_CAIXADrawColumnCell(Sender: TObject;
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

procedure TFORM_CAIXA.DBGRID_CAIXAMouseEnter(Sender: TObject);
begin
DBGRID_CAIXA.ShowHint := true ;
end;

procedure TFORM_CAIXA.FormCreate(Sender: TObject);
begin

  {DBGRID_CAIXA.DataSource := DATASOURCE_CAIXA ;
  LBL_TOTAL.Caption := ADOQUERY_TOTALCOLUMN1.Text ;
  ADOQUERY_CAIXA.Active := FALSE ;
  ADOQUERY_CAIXA.Active := TRUE  ;
  ADOQUERY_CAIXA_DATA.Active := FALSE ;
  ADOQUERY_CAIXA_DATA.Active := TRUE  ;
  ADOQUERY_TOTAL.Active := FALSE ;
  ADOQUERY_TOTAL.Active := TRUE  ;
  ADOQUERY_TOTAL_HOJE.Active := FALSE ;
  ADOQUERY_TOTAL_HOJE.Active := TRUE  ;}
  RadioGroup1.ItemIndex := -1 ;
  DBGrid1.DataSource := DATASOURCE_CAIXA ;
  Panel1.Visible := FALSE ;
  Label9.Caption := 'PACIENTE:';
  Label8.Caption := 'DENTISTA:';
  Label7.Caption := 'CÓDIGO:';
  Label4.Caption := 'ENTRADA:';
  Label6.Caption := 'PAGO EM:';
  Label5.Caption := 'SAÍDA:';
  ADOQUERY_CAIXA.Active := FALSE ;
  ADOQUERY_CAIXA.Active := TRUE  ;
  ADOQUERY_CAIXA_DATA.Active := FALSE ;
  ADOQUERY_CAIXA_DATA.Active := TRUE  ;
  ADOQUERY_TOTAL.Active := FALSE ;
  ADOQUERY_TOTAL.Active := TRUE ;
  ADOQUERY_TOTAL_HOJE.Active := FALSE ;
  ADOQUERY_TOTAL_HOJE.Active := TRUE  ;   ADOQUERY_TOTAL_HOJE.Active := FALSE ;
 // RadioGroup1.ItemIndex := ;

end;

procedure TFORM_CAIXA.FormShow(Sender: TObject);
begin
  RadioGroup1.ItemIndex := -1 ;
  DBGrid1.DataSource := DATASOURCE_CAIXA ;
  Panel1.Visible := FALSE ;
  Label9.Caption := 'PACIENTE:';
  Label8.Caption := 'DENTISTA:';
  Label7.Caption := 'CÓDIGO:';
  Label4.Caption := 'ENTRADA:';
  Label6.Caption := 'PAGO EM:';
  Label5.Caption := 'SAÍDA:';

  ADOQUERY_CAIXA.Active := false;
  ADOQUERY_CAIXA.Active := true;
  RadioGroup1.ItemIndex := 0;
  RadioGroup1Click(self);
end;

procedure TFORM_CAIXA.Image2Click(Sender: TObject);
begin
Panel1.Visible := FALSE ;
end;

procedure TFORM_CAIXA.Image6MouseEnter(Sender: TObject);
begin
Image7.Visible := true ;
end;

procedure TFORM_CAIXA.Image7Click(Sender: TObject);
begin
UNIT_CAIXA.FORM_CAIXA.Close;
end;

procedure TFORM_CAIXA.Image7MouseLeave(Sender: TObject);
begin
Image7.Visible := false;
end;

procedure TFORM_CAIXA.RadioGroup1Click(Sender: TObject);
var
  data_lbl, dia_lbl, mes_lbl, ano_lbl: string;
  data_query: string;
begin

  if RadioGroup1.ItemIndex = 0 then
  begin
    ADOQUERY_CAIXA.Active := FALSE;
    ADOQUERY_CAIXA.Active := TRUE;
    ADOQUERY_CAIXA_DATA.Active := false;
    DBGRID_CAIXA.DataSource := DATASOURCE_CAIXA;
        ADOQUERY_TOTAL.Active := TRUE ;
    ADOQUERY_TOTAL.Active := FALSE;
    ADOQUERY_TOTAL.Active := TRUE ;
    with LBL_TOTAL do
    begin
      Caption := ADOQUERY_TOTALCOLUMN1.Text ;
    end;
    with Label1 do
    begin
      Caption := 'TOTAL' ;
    end;
  end;

  if RadioGroup1.ItemIndex = 1 then
  begin

    with Label1 do
    begin
      Caption := 'TOTAL HOJE' ;
    end;

    dia_lbl := Copy(lbl_data.Caption, 1, 2);
    mes_lbl := Copy(lbl_data.Caption, 4, 2);
    ano_lbl := Copy(lbl_data.Caption, 7, 4);
    data_lbl := ano_lbl + '-' + mes_lbl + '-' + dia_lbl;

    ADOQUERY_CAIXA.Active := false;

    ADOQUERY_CAIXA_DATA.Active := FALSE;
    ADOQUERY_CAIXA_DATA.Active := true;

    ADOQUERY_TOTAL_HOJE.Active := FALSE;
    ADOQUERY_TOTAL_HOJE.Active := true;

    DBGRID_CAIXA.DataSource := DATASOURCE_CAIXA_DATA;
    DBGrid1.DataSource := DATASOURCE_TOTAL_HOJE;
    ADOQUERY_CAIXA_DATA.Close;
    ADOQUERY_CAIXA_DATA.Parameters.ParamByName('DATA').Value := data_lbl;
    ADOQUERY_CAIXA_DATA.Open;

    ADOQUERY_TOTAL_HOJE.Close;
    ADOQUERY_TOTAL_HOJE.Parameters.ParamByName('DATA').Value := data_lbl;
    ADOQUERY_TOTAL_HOJE.Open;

    LBL_TOTAL.Caption := ADOQUERY_TOTAL_HOJECOLUMN1.Text;



  end;

end;

procedure TFORM_CAIXA.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date) + ' | ' + timetostr(time);
end;

procedure TFORM_CAIXA.VERDETALHES1Click(Sender: TObject);
begin

  if (RadioGroup1.ItemIndex = 0)OR(RadioGroup1.ItemIndex = -1) then
  begin
      if ADOQUERY_CAIXAPAGAMENTOS_AVISTA_CAIXA.AsVariant <> NULL then
      begin
        Label9.Caption := 'DENTISTA:';
        Label8.Caption := 'PACIENTE:';
        Label7.Caption := 'CÓDIGO:';
        Label4.Caption := 'ENTRADA:';
        Label6.Caption := 'PAGO EM:';
        Label5.Caption := 'SAÍDA:';
        Edit3.Text := ADOQUERY_CAIXADTCADASTRO_CAIXA.AsString ;
        Edit1.Text := ADOQUERY_CAIXAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXACOD_CAIXA.AsString ;
        with BUSCA_AV do
        begin
          close;
          Active := false ;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXAPAGAMENTOS_AVISTA_CAIXA.AsString;
          Active := true ;
          open;
        end;
        Edit5.Text := BUSCA_AVNOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_AVNOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;

      if ADOQUERY_CAIXAPAGAMENTOS_APRAZO_CAIXA.AsVARIANT <> NULL then
      begin
        Label9.Caption := 'DENTISTA:';
        Label8.Caption := 'PACIENTE:';
        Label7.Caption := 'CÓDIGO:';
        Label4.Caption := 'ENTRADA:';
        Label6.Caption := 'PAGO EM:';
        Label5.Caption := 'SAÍDA:';
        Edit3.Text := ADOQUERY_CAIXADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXACOD_CAIXA.AsString ;
        with BUSCA_AP do
        begin
          close;
          Active:=false;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXAPAGAMENTOS_APRAZO_CAIXA.AsInteger ;
          Active:=true;
          open;
        end;
        Edit5.Text := BUSCA_APNOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_APNOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;

      if ADOQUERY_CAIXADESPESAS_CAIXA.AsVariant <> NULL then
      begin
        Edit3.Text := ADOQUERY_CAIXADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXACOD_CAIXA.AsString ;
        with BUSCA_DP do
        begin
          close;
          Active := false ;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXADESPESAS_CAIXA.AsInteger ;
          Active := true ;
          open ;
        end;
        Label8.Caption := 'TIPO:' ;
        Edit5.Text := BUSCA_DPTIPO_DESPESA.AsString;
        Label9.Caption := 'CADASTRO EM:'             ;
        Edit6.Text := BUSCA_DPDTHORACADASTRO_DESPESA.AsString;
        Panel1.Visible := TRUE ;

      end;
      if ADOQUERY_CAIXAPAGAMENTOS_PARCELAS_CAIXA.AsVariant <> NULL then
      begin
        Label9.Caption := 'DENTISTA:';
        Label8.Caption := 'PACIENTE:';
        Edit3.Text := ADOQUERY_CAIXADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXACOD_CAIXA.AsString ;
        with BUSCA_PA do
        begin
          close;
          Active:=false;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXAPAGAMENTOS_PARCELAS_CAIXA.AsInteger ;
          Active:=true;
          open;
        end;
        Edit5.Text := BUSCA_PANOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_PANOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;

  end



















  else if RadioGroup1.ItemIndex = 1 then
  begin
      if ADOQUERY_CAIXA_DATAPAGAMENTOS_AVISTA_CAIXA.Asvariant <> NULL then
      begin
        Label9.Caption := 'PACIENTE:';
        Label8.Caption := 'DENTISTA:';
        Label7.Caption := 'CÓDIGO:';
        Label4.Caption := 'ENTRADA:';
        Label6.Caption := 'PAGO EM:';
        Label5.Caption := 'SAÍDA:';
        Edit3.Text := ADOQUERY_CAIXA_DATADTCADASTRO_CAIXA.AsString ;
        Edit1.Text := ADOQUERY_CAIXA_DATAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXA_DATASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXA_DATACOD_CAIXA.AsString ;
        with BUSCA_AV do
        begin
          close;
          Active := false ;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXA_DATAPAGAMENTOS_AVISTA_CAIXA.AsString;
          Active := true ;
          open;
        end;
        Edit5.Text := BUSCA_AVNOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_AVNOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;

      if ADOQUERY_CAIXA_DATAPAGAMENTOS_APRAZO_CAIXA.AsVARIANT <> NULL then
      begin
        Label9.Caption := 'PACIENTE:';
        Label8.Caption := 'DENTISTA:';
        Label7.Caption := 'CÓDIGO:';
        Label4.Caption := 'ENTRADA:';
        Label6.Caption := 'PAGO EM:';
        Label5.Caption := 'SAÍDA:';
        Edit3.Text := ADOQUERY_CAIXA_DATADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXA_DATAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXA_DATASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXA_DATACOD_CAIXA.AsString ;
        with BUSCA_AP do
        begin
          close;
          Active:=false;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXA_DATAPAGAMENTOS_APRAZO_CAIXA.AsInteger ;
          Active:=true;
          open;
        end;
        Edit5.Text := BUSCA_APNOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_APNOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;

      if ADOQUERY_CAIXA_DATADESPESAS_CAIXA.AsVariant <> NULL then
      begin
        Edit3.Text := ADOQUERY_CAIXA_DATADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXA_DATAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXA_DATASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXA_DATACOD_CAIXA.AsString ;
        with BUSCA_DP do
        begin
          close;
          Active := false ;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXA_DATADESPESAS_CAIXA.AsInteger ;
          Active := true ;
          open ;
        end;
        Label8.Caption := 'TIPO:' ;
        Edit5.Text := BUSCA_DPTIPO_DESPESA.AsString;
        Label9.Caption := 'CADASTRO EM:'             ;
        Edit6.Text := BUSCA_DPDTHORACADASTRO_DESPESA.AsString;
        Panel1.Visible := TRUE ;
      end;

      if ADOQUERY_CAIXA_DATAPAGAMENTOS_PARCELAS_CAIXA.AsVariant <> NULL then
      begin
        Edit3.Text := ADOQUERY_CAIXA_DATADTCADASTRO_CAIXA.AsString;
        Edit1.Text := ADOQUERY_CAIXA_DATAENTRADA_CAIXA.AsString ;
        Edit2.Text := ADOQUERY_CAIXA_DATASAIDA_CAIXA.AsString ;
        Edit4.Text := ADOQUERY_CAIXA_DATACOD_CAIXA.AsString ;
        with BUSCA_PA do
        begin
          close;
          Active:=false;
          Parameters.ParamByName('COD').Value := ADOQUERY_CAIXA_DATAPAGAMENTOS_PARCELAS_CAIXA.AsInteger ;
          Active:=true;
          open;
        end;
        Edit5.Text := BUSCA_PANOME_PACIENTE.AsString;
        Edit6.Text := BUSCA_PANOME_DENTISTA.AsString;
        Panel1.Visible := TRUE;
      end;
  end;


end;

end.
