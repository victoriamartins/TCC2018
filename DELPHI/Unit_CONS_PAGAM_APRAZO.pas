unit Unit_CONS_PAGAM_APRAZO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, pngimage, jpeg, ADODB, DB,
  dblookup, DBCtrls, Mask, Menus, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_CONS_PAGAM_APRAZO = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RadioGroup1: TRadioGroup;
    Image1: TImage;
    Image2: TImage;
    Label11: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQuery2COD_PACIENTE: TAutoIncField;
    ADOQuery2NOME_PACIENTE: TStringField;
    ADOQuery2RG_PACIENTE: TStringField;
    ADOQuery2CPF_PACIENTE: TStringField;
    ADOQuery2SEXO_PACIENTE: TStringField;
    ADOQuery2NASCIMENTO_PACIENTE: TWideStringField;
    ADOQuery2ENDERECO_PACIENTE: TStringField;
    ADOQuery2EMAIL_PACIENTE: TStringField;
    ADOQuery2CIDADE_PACIENTE: TIntegerField;
    ADOQuery2TEL1_PACIENTE: TStringField;
    ADOQuery2TEL2_PACIENTE: TStringField;
    ADOQuery2MENORDE18ANOS: TBooleanField;
    ADOQuery2RESPONSAVEL_PACIENTE: TIntegerField;
    ADOQuery2OBS_PACIENTE: TMemoField;
    ADOQuery2STATUS_PACIENTE: TBooleanField;
    ADOQuery2DTHORACADASTRO_PACIENTE: TDateTimeField;
    ADOQuery3: TADOQuery;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    Label19: TLabel;
    Label20: TLabel;
    Edit8: TEdit;
    Button1: TButton;
    RadioGroup2: TRadioGroup;
    ADOConnection1: TADOConnection;
    Edit5: TEdit;
    ALTERA_PAGAMENTO_PACIENTE_APRAZO: TADOStoredProc;
    ADOQuery3COD_DENTISTA: TAutoIncField;
    ADOQuery3NOME_DENTISTA: TStringField;
    ADOQuery3SEXO_DENTISTA: TStringField;
    ADOQuery3CRO_DENTISTA: TStringField;
    ADOQuery3EMAIL_DENTISTA: TStringField;
    ADOQuery3STATUS_DENTISTA: TStringField;
    ADOQuery3DTHORACADASTRO_DENTISTA: TDateTimeField;
    PP_ALTERACAO: TPopupMenu;
    REALIZARPAGAMENTO1: TMenuItem;
    ADOQuery1COD_APRAZO: TAutoIncField;
    ADOQuery1PACIENTE_APRAZO: TIntegerField;
    ADOQuery1NOME_PACIENTE: TStringField;
    ADOQuery1DENTISTA_APRAZO: TIntegerField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1TIPO_APRAZO: TStringField;
    ADOQuery1VALOR_APRAZO: TBCDField;
    ADOQuery1DATAPAGAMENTO_APRAZO: TWideStringField;
    ADOQuery1OBS_APRAZO: TMemoField;
    ADOQuery1STATUS_PAGAMENTO: TBooleanField;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image8: TImage;
    CAIXA_AUTOMATICO: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    APRAZO: TRvDataSetConnection;
    PJ_APRAZO: TRvProject;
    procedure Button1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure REALIZARPAGAMENTO1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure ADOQuery1STATUS_PAGAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure ADOQuery1OBS_APRAZOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CONS_PAGAM_APRAZO: TForm_CONS_PAGAM_APRAZO;

implementation

uses Unit_TELA_PRINCIPAL, UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO;

{$R *.dfm}

procedure TForm_CONS_PAGAM_APRAZO.LabelAtualizado(Sender: TObject);
var
   ano, mes, dia: string;
   COD_PACIENTE: integer;
begin
    ano:= Copy(ADOQuery1DATAPAGAMENTO_APRAZO.AsVariant,1,4);
    mes:= Copy(ADOQuery1DATAPAGAMENTO_APRAZO.AsVariant,6,2);
    dia:= Copy(ADOQuery1DATAPAGAMENTO_APRAZO.AsVariant,9,2);

//LABEL
    Label11.Caption := IntToStr(ADOQuery1COD_APRAZO.AsInteger);
    Label12.Caption := ADOQuery1NOME_PACIENTE.AsString;
    Label13.Caption := ADOQuery1NOME_DENTISTA.AsString;
    Label14.Caption := ADOQuery1TIPO_APRAZO.AsString;
    Label15.Caption := FloatToStr(ADOQuery1VALOR_APRAZO.AsFloat);
    Label16.Caption := dia+'/'+mes+'/'+ano;
    Label20.Caption := ADOQuery1OBS_APRAZO.AsString;


//EDIT
    Edit1.Text := IntToStr(ADOQuery1COD_APRAZO.AsInteger);
    Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
    Edit3.Text := ADOQuery1NOME_DENTISTA.AsString;
    Edit4.Text := FloatToStr(ADOQuery1VALOR_APRAZO.AsFloat);
    MaskEdit1.Text := dia+'/'+mes+'/'+ano;
    Memo1.Lines.Text:= ADOQuery1OBS_APRAZO.AsString;

//COMBOBOX
    if ADOQuery1TIPO_APRAZO.AsString = 'CARTÃO' then
    begin
        ComboBox1.ItemIndex := 0;
    end
    else if ADOQuery1TIPO_APRAZO.AsString = 'DINHEIRO' then
    begin
        ComboBox1.ItemIndex := 1;
    end
    else if ADOQuery1TIPO_APRAZO.AsString = 'CHEQUE' then
    begin
        ComboBox1.ItemIndex := 2;
    end
    else
    begin
        ComboBox1.ItemIndex := 3;
        Edit5.Text := ADOQuery1TIPO_APRAZO.AsString;
        Label14.Caption := ADOQuery1TIPO_APRAZO.AsString;
    end ;


    //COD_PACIENTE := ADOQuery1PACIENTE_APRAZO.AsInteger;
    //DBGrid2CellClick(TColumn.ADOQuery2COD_PACIENTE.AsInteger) := COD_PACIENTE;




    Image4.Enabled := FALSE;

    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;
    Label14.Visible := TRUE;
    Label15.Visible := TRUE;
    Label16.Visible := TRUE;
    Label20.Visible := true;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;

    MaskEdit1.Visible := FALSE;

    Memo1.Visible := FALSE;

    ComboBox1.Visible := FALSE;
end;

procedure TForm_CONS_PAGAM_APRAZO.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_CONS_PAGAM_APRAZO.RadioGroup2Click(Sender: TObject);
var
   PACIENTE, DENTISTA, DATA: STRING;
begin
    PACIENTE :=  'NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
    DENTISTA :=  'NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
    DATA :=   'DATAPAGAMENTO_APRAZO like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //só o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND COD_PACIENTE = PACIENTE_APRAZO';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO,STATUS_PAGAMENTO , OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                      'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                      'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO <> ' + QuotedStr('CHEQUE') + ' AND TIPO_APRAZO <> ' + QuotedStr('DINHEIRO') +
                                        ' AND TIPO_APRAZO <> ' + QuotedStr('CARTÃO');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else
                  Exit;
    end;

    if RadioGroup1.ItemIndex <> -1 then // o MOSTRAR e o FILTRAR
    begin
         if RadioGroup1.ItemIndex = 0 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND ' + PACIENTE;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO,STATUS_PAGAMENTO , OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND ' + PACIENTE;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO,STATUS_PAGAMENTO , OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND ' + PACIENTE;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND ' + PACIENTE;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO <> ' + QuotedStr('CHEQUE') + ' AND TIPO_APRAZO <> ' + QuotedStr('DINHEIRO') +
                                        ' AND TIPO_APRAZO <> ' + QuotedStr('CARTÃO') + ' AND ' + PACIENTE;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else
                exit;
         end;

         if RadioGroup1.ItemIndex = 1 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND ' + DENTISTA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND ' + DENTISTA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND ' + DENTISTA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND ' + DENTISTA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO,STATUS_PAGAMENTO , OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO <> ' + QuotedStr('CHEQUE') + ' AND TIPO_APRAZO <> ' + QuotedStr('DINHEIRO') +
                                        ' AND TIPO_APRAZO <> ' + QuotedStr('CARTÃO') + 'AND ' + DENTISTA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else
                exit;
         end;

         if RadioGroup1.ItemIndex = 2 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                        'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO <> ' + QuotedStr('CHEQUE') + ' AND TIPO_APRAZO <> ' + QuotedStr('DINHEIRO') +
                                        ' AND TIPO_APRAZO <> ' + QuotedStr('CARTÃO') + 'AND ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
              end

              else
                  Exit;
         end;
    end;
end;

procedure TForm_CONS_PAGAM_APRAZO.REALIZARPAGAMENTO1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin

   dia_c := Copy(lbl_data.Caption,1,2);
   mes_c := Copy(lbl_data.Caption,4,2);
   ano_c := Copy(lbl_data.Caption,7,4);
   hora_c := Copy(lbl_data.Caption,14,8);

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true then
  begin
    Application.MessageBox('Esse pagamento já foi realizado!','Atenção!', MB_ICONEXCLAMATION);
    DBGrid1.SetFocus;
    Exit;
  end
  else if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false then
  begin

    if Application.MessageBox('Deseja mesmo pagar?','ATENÇÃO',
                                          MB_YESNO+MB_ICONEXCLAMATION)= IDYES then
    BEGIN
          ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@STATUS').Value := '1';

          with ALTERA_PAGAMENTO_PACIENTE_APRAZO do
          begin
            Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_APRAZO.AsInteger;
            Parameters.ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_APRAZO.AsInteger;
            Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_APRAZO.AsInteger;
            Parameters.ParamByName('@VALOR').Value := ADOQuery1VALOR_APRAZO.AsFloat;
            Parameters.ParamByName('@DATAPAGAMENTO').Value := ADOQuery1DATAPAGAMENTO_APRAZO.AsString;
            Parameters.ParamByName('@TIPO').Value := ADOQuery1TIPO_APRAZO.AsString;
            Parameters.ParamByName('@OBS').Value := ADOQuery1OBS_APRAZO.AsString;
            Parameters.ParamByName('@STATUS').Value := '1';
            ExecProc;
          end;

            with CAIXA_AUTOMATICO do
             begin
               Parameters.ParamByName('@DATA').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
               Parameters.ParamByName('@ENTRADA').Value := ADOQuery1VALOR_APRAZO.AsFloat;
               Parameters.ParamByName('@SAIDA').Value := '0.00';
               Parameters.ParamByName('@DTCADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
               Parameters.ParamByName('@AVISTA').Value := null;
               Parameters.ParamByName('@APRAZO').Value := ADOQuery1COD_APRAZO.AsInteger;
               Parameters.ParamByName('@PARCELA').Value := NULL;
               Parameters.ParamByName('@DESPESA').Value := NULL;
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
                Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento à prazo nº ' + ADOQuery1COD_APRAZO.AsString + ' pago.' ;
                Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                ExecProc;
              end;
            ADOQuery1.Active := false;
            ADOQuery1.Active := true;
            Application.MessageBox('Pagamento realizado!', 'ATENÇÃO!', MB_ICONINFORMATION);
    END;
  end;


end;

procedure TForm_CONS_PAGAM_APRAZO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_CONS_PAGAM_APRAZO.ADOQuery1OBS_APRAZOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text := Copy(ADOQuery1OBS_APRAZO.AsString,1,200);
end;

procedure TForm_CONS_PAGAM_APRAZO.ADOQuery1STATUS_PAGAMENTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false  then
  begin
    Text := 'PENDENTE';
  end;
  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true  then
  begin
    Text := 'PAGO';
  end;
end;

procedure TForm_CONS_PAGAM_APRAZO.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0;
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                        'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                        'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                        'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND COD_PACIENTE = PACIENTE_APRAZO order by DATAPAGAMENTO_APRAZO desc';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
end;

procedure TForm_CONS_PAGAM_APRAZO.ComboBox1Change(Sender: TObject);
begin
    if ComboBox1.ItemIndex = 3 then
    begin
        Edit5.Visible := TRUE;
    end
    else
    begin
        Edit5.Visible := FALSE;
    end;
end;

procedure TForm_CONS_PAGAM_APRAZO.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key<>#13 then
   begin
      Key := #0;
   end;
end;

procedure TForm_CONS_PAGAM_APRAZO.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(Self);
end;

procedure TForm_CONS_PAGAM_APRAZO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_APRAZO.DBGrid2CellClick(Column: TColumn);
begin
    if Edit1.Visible = false then
    begin
      exit;
    end
    else
      Edit2.Text := ADOQuery2NOME_PACIENTE.AsString;
end;

procedure TForm_CONS_PAGAM_APRAZO.DBGrid3CellClick(Column: TColumn);
begin
    if Edit1.Visible = false then
    begin
      exit;
    end
   else
   Edit3.Text := ADOQuery3NOME_DENTISTA.AsString;
end;

procedure TForm_CONS_PAGAM_APRAZO.Edit8Change(Sender: TObject);
begin
Edit8.Enabled := true ;

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                  'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, OBS_APRAZO, STATUS_PAGAMENTO ' +
                                  'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                  'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                'COD_PACIENTE = PACIENTE_APRAZO AND NOME_PACIENTE LIKE ' + QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                  'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, OBS_APRAZO , STATUS_PAGAMENTO' +
                                  'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                  'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                'COD_PACIENTE = PACIENTE_APRAZO AND NOME_DENTISTA LIKE ' + QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                  'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, OBS_APRAZO, STATUS_PAGAMENTO ' +
                                  'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                  'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                'COD_PACIENTE = PACIENTE_APRAZO AND DATAPAGAMENTO_APRAZO LIKE ' + QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
    end

    else if RadioGroup2.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup2.ItemIndex=0 then //TODOS
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND NOME_PACIENTE LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND NOME_DENTISTA LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
                                                'COD_PACIENTE = PACIENTE_APRAZO AND DATAPAGAMENTO_APRAZO LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=1 then //Cartão
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND NOME_PACIENTE LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND NOME_DENTISTA LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CARTÃO') + ' AND DATAPAGAMENTO_APRAZO LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=2 then //DINHEIRO
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND NOME_PACIENTE LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND NOME_DENTISTA LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('DINHEIRO') + ' AND DATAPAGAMENTO_APRAZO LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=3 then //Cheque
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND NOME_PACIENTE LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND NOME_DENTISTA LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT	COD_APRAZO, PACIENTE_APRAZO, NOME_PACIENTE, DENTISTA_APRAZO, NOME_DENTISTA, ' +
                                                'TIPO_APRAZO, VALOR_APRAZO, DATAPAGAMENTO_APRAZO, TIPO_APRAZO, STATUS_PAGAMENTO ,OBS_APRAZO ' +
                                                'FROM	TB_DENTISTA, TB_PACIENTE,TB_PAGAMENTO_PACIENTE_APRAZO ' +
                                                'WHERE	COD_DENTISTA = DENTISTA_APRAZO AND ' +
	                                              'COD_PACIENTE = PACIENTE_APRAZO AND TIPO_APRAZO = ' + QuotedStr('CHEQUE') + ' AND DATAPAGAMENTO_APRAZO LIKE ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TForm_CONS_PAGAM_APRAZO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      ADOQuery1.Active := false;
      ADOQuery1.Active := true;
      ADOQuery2.Active := false;
      ADOQuery2.Active := true;
      ADOQuery3.Active := false;
      ADOQuery3.Active := true;

      Button1Click(self);
     if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
      begin
          DBGrid1.DataSource.DataSet.RecNo := 1;
          DBGrid3.DataSource.DataSet.RecNo := 1;
          dBGrid2.DataSource.DataSet.RecNo := 1;
          LabelAtualizado(self);

      end;
end;

procedure TForm_CONS_PAGAM_APRAZO.FormShow(Sender: TObject);
begin
      ADOQuery1.Active := false;
      ADOQuery1.Active := true;
      ADOQuery2.Active := false;
      ADOQuery2.Active := true;
      ADOQuery3.Active := false;
      ADOQuery3.Active := true;

      Button1Click(self);
      if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
      begin
          DBGrid1.DataSource.DataSet.RecNo := 1;
          DBGrid3.DataSource.DataSet.RecNo := 1;
          dBGrid2.DataSource.DataSet.RecNo := 1;
          LabelAtualizado(self);

      end;

end;

procedure TForm_CONS_PAGAM_APRAZO.Image2Click(Sender: TObject);
begin
UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO.FORM_GRAVA_PAGAMENTO_APRAZO.ShowModal;
end;

procedure TForm_CONS_PAGAM_APRAZO.Image3Click(Sender: TObject);
begin

    if Edit2.Text = EmptyStr then
    begin
        Application.MessageBox('Selecione um pagamento!','ATENÇÃO!',MB_ICONEXCLAMATION);
        exit;

    end;


   if ADOQuery1STATUS_PAGAMENTO.AsBoolean = TRUE then
   begin
         Application.MessageBox('Não é possível alterar este pagamento, ele já foi realizado!', 'ATENÇÃO!', MB_ICONINFORMATION);
         Exit;
   end
   else if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false then
   begin

        Image4.Enabled := true;
        Label11.Visible := FALSE;
        Label12.Visible := FALSE;
        Label13.Visible := FALSE;
        Label14.Visible := FALSE;
        Label15.Visible := FALSE;
        Label16.Visible := FALSE;
        Label20.Visible := FALSE;
        Edit1.Visible := TRUE;
        Edit2.Visible := TRUE;
        Edit3.Visible := TRUE;
        Edit4.Visible := TRUE;
        MaskEdit1.Visible := TRUE;
        Memo1.Visible := TRUE;
        ComboBox1.Visible := TRUE;
        if ComboBox1.ItemIndex <> 3 then
        BEGIN
          EXIT;
        END
        ELSE
        BEGIN
          Edit5.Visible := TRUE
        END;

   end;

end;

procedure TForm_CONS_PAGAM_APRAZO.Image4Click(Sender: TObject);
var
  dia, mes, ano : string;
  dia_c , mes_c, ano_c, hora_c: string;
  Cod_Pagam_Selecionado : integer;
begin
    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do código!', 'Atenção!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do nome do paciente!', 'Atenção!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do nome do dentista!', 'Atenção!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if ComboBox1.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do tipo de pagamento!', 'Atenção!', MB_ICONWARNING);
        ComboBox1.SetFocus;
        Exit;
    end

    else if Edit4.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do valor!', 'Atenção!', MB_ICONWARNING);
        Edit4.SetFocus;
        Exit;
    end

    else if MaskEdit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo da data de pagamento!', 'Atenção!', MB_ICONWARNING);
        MaskEdit1.SetFocus;
        Exit;
    end;



/////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if Application.MessageBox('Tem certeza que deseja alterar o pagamento do paciente à prazo?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
        ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);

        if Edit2.Text <> ADOQuery2NOME_PACIENTE.AsString   then
        begin
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_APRAZO.AsInteger;
        end
        else
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@PACIENTE').Value := ADOQuery2COD_PACIENTE.AsInteger;


        if Edit3.Text <> ADOQuery3NOME_DENTISTA.AsString   then
        begin
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_APRAZO.AsInteger;
        end
        else
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@DENTISTA').Value := ADOQuery3COD_DENTISTA.AsInteger;






        dia := Copy(MaskEdit1.Text,1,2);
        mes := Copy(MaskEdit1.Text,4,2);
        ano := Copy(MaskEdit1.Text,7,4);
        if ComboBox1.ItemIndex = 0 then
        begin
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@TIPO').Value := 'CARTÃO';
        end

        else if ComboBox1.ItemIndex = 1 then
        begin
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO';
        end

        else if ComboBox1.ItemIndex = 2 then
        begin
            ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@TIPO').Value := 'CHEQUE';
        end

        else if ComboBox1.ItemIndex = 3 then
        begin
            if Edit5.Text = '' then
            begin
                Application.MessageBox('Preencha o campo do tipo de pagamento!', 'Atenção!', MB_ICONWARNING);
                Edit5.SetFocus;
                Exit;
            end
            else
            begin
                ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@TIPO').Value := Edit5.Text;
            end;
        end;


         dia_c := Copy(lbl_data.Caption,1,2);
         mes_c := Copy(lbl_data.Caption,4,2);
         ano_c := Copy(lbl_data.Caption,7,4);
         hora_c := Copy(lbl_data.Caption,14,8);
        ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@VALOR').Value := StrToFloat(Edit4.Text);
        ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano +'-'+ mes +'-'+ dia;
        ALTERA_PAGAMENTO_PACIENTE_APRAZO.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

        Cod_Pagam_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
        ALTERA_PAGAMENTO_PACIENTE_APRAZO.ExecProc;




        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;
        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento à prazo nº ' + ADOQuery1COD_APRAZO.AsString + ' alterado.' ; //conferir
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;
        Application.MessageBox('Pagamento do paciente à prazo alterado!', 'AVISO', MB_OK)
    end

    else
    begin
        Exit;
    end;

    //ATUALIZANDO OS LABELS

    ADOQuery1.Active:= FALSE;
    ADOQuery1.Active:= TRUE;

    DBGrid1.DataSource.DataSet.RecNo := Cod_Pagam_Selecionado;
    LabelAtualizado(Self);

    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;
    Label14.Visible := TRUE;
    Label15.Visible := TRUE;
    Label16.Visible := TRUE;
    Label20.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;
    MaskEdit1.Visible := FALSE;

    Memo1.Visible := FALSE;
    ComboBox1.Visible := FALSE;

    Image4.Enabled := false;
end;

procedure TForm_CONS_PAGAM_APRAZO.Image6MouseEnter(Sender: TObject);
begin
 Image7.Visible:=True;
end;

procedure TForm_CONS_PAGAM_APRAZO.Image7Click(Sender: TObject);
begin
 Form_CONS_PAGAM_APRAZO.Close;
end;

procedure TForm_CONS_PAGAM_APRAZO.Image7MouseLeave(Sender: TObject);
begin
 Image7.Visible:=False;
end;

procedure TForm_CONS_PAGAM_APRAZO.Image8Click(Sender: TObject);
begin
    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    PJ_APRAZO.Execute;
end;

end.
