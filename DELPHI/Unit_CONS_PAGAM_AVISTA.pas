unit Unit_CONS_PAGAM_AVISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Clipbrd, pngimage, jpeg, DB, ADODB,
  Menus, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_CONS_PAGAM_AVISTA = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label16: TLabel;
    DBGrid3: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQueryPACIENTE: TADOQuery;
    ADOQueryDENTISTA: TADOQuery;
    DataSource1: TDataSource;
    DataSourcePACIENTE: TDataSource;
    DataSourceDENTISTA: TDataSource;
    ADOQueryPACIENTECOD_PACIENTE: TAutoIncField;
    ADOQueryPACIENTENOME_PACIENTE: TStringField;
    ADOQueryPACIENTERG_PACIENTE: TStringField;
    ADOQueryPACIENTECPF_PACIENTE: TStringField;
    ADOQueryPACIENTESEXO_PACIENTE: TStringField;
    ADOQueryPACIENTENASCIMENTO_PACIENTE: TWideStringField;
    ADOQueryPACIENTEENDERECO_PACIENTE: TStringField;
    ADOQueryPACIENTEEMAIL_PACIENTE: TStringField;
    ADOQueryPACIENTECIDADE_PACIENTE: TIntegerField;
    ADOQueryPACIENTETEL1_PACIENTE: TStringField;
    ADOQueryPACIENTETEL2_PACIENTE: TStringField;
    ADOQueryPACIENTEMENORDE18ANOS: TBooleanField;
    ADOQueryPACIENTERESPONSAVEL_PACIENTE: TIntegerField;
    ADOQueryPACIENTEOBS_PACIENTE: TMemoField;
    ADOQueryPACIENTESTATUS_PACIENTE: TBooleanField;
    ADOQueryPACIENTEDTHORACADASTRO_PACIENTE: TDateTimeField;
    ADOQueryDENTISTACOD_DENTISTA: TAutoIncField;
    ADOQueryDENTISTANOME_DENTISTA: TStringField;
    ADOQueryDENTISTASEXO_DENTISTA: TStringField;
    ADOQueryDENTISTACRO_DENTISTA: TStringField;
    ADOQueryDENTISTAEMAIL_DENTISTA: TStringField;
    ADOQueryDENTISTASTATUS_DENTISTA: TStringField;
    ADOQueryDENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    Edit5: TEdit;
    ADOStoredProc1: TADOStoredProc;
    Edit6: TEdit;
    Button1: TButton;
    ADOQuery1COD_AVISTA: TAutoIncField;
    ADOQuery1NOME_PACIENTE: TStringField;
    ADOQuery1PACIENTE_AVISTA: TIntegerField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1DENTISTA_AVISTA: TIntegerField;
    ADOQuery1VALOR_AVISTA: TBCDField;
    ADOQuery1DATAPAGAMENTO_AVISTA: TWideStringField;
    ADOQuery1TIPO_AVISTA: TStringField;
    ADOQuery1DTHORACADASTRO_AVISTA: TDateTimeField;
    Label1: TLabel;
    Edit7: TEdit;
    Image8: TImage;
    lbl_data: TLabel;
    Timer1: TTimer;
    ADOQuery1STATUS_PAGAMENTO: TBooleanField;
    PP_PAGAMENTO: TPopupMenu;
    REALIZARPAGAMENTO1: TMenuItem;
    GRAVA_LOG: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    RV_AVISTA: TRvDataSetConnection;
    PJ_AVISTA: TRvProject;
    procedure Button1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7Click(Sender: TObject);
    procedure ADOQuery1STATUS_PAGAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure REALIZARPAGAMENTO1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CONS_PAGAM_AVISTA: TForm_CONS_PAGAM_AVISTA;

implementation

uses Unit_TELA_PRINCIPAL, UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA;





{$R *.dfm}

procedure TForm_CONS_PAGAM_AVISTA.LabelAtualizado(Sender: TObject);
var
dia, mes, ano : string;

begin

    Edit1.Text := IntToStr(ADOQuery1COD_AVISTA.AsInteger);
        Label10.Caption := IntToStr(ADOQuery1COD_AVISTA.AsInteger);
    Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
        label11.Caption := ADOQuery1NOME_PACIENTE.AsString;
    Edit3.Text := ADOQuery1NOME_DENTISTA.AsString;
        Label12.Caption := ADOQuery1NOME_DENTISTA.AsString;
    Edit7.Text := 'R$ '+CurrToStr(ADOQuery1VALOR_AVISTA.AsCurrency);
        label13.Caption := 'R$ '+CurrToStr(ADOQuery1VALOR_AVISTA.AsCurrency);

    dia := Copy(ADOQuery1DATAPAGAMENTO_AVISTA.AsString,9,2);
    mes := Copy(ADOQuery1DATAPAGAMENTO_AVISTA.AsString,6,2);
    ano := Copy(ADOQuery1DATAPAGAMENTO_AVISTA.AsString,1,4);
    MaskEdit1.Text := dia+'/'+mes+'/'+ano;
        label14.Caption := dia+'/'+mes+'/'+ano;
    if ADOQuery1TIPO_AVISTA.AsString = 'CART�O'  then
    begin
        Label15.Caption := 'CART�O';
        ComboBox1.ItemIndex := 0;
    end
    ELSE if ADOQuery1TIPO_AVISTA.AsString = 'CHEQUE'  then
    begin
        Label15.Caption := 'CHEQUE';
        ComboBox1.ItemIndex := 1;
    end
    ELSE if ADOQuery1TIPO_AVISTA.AsString = 'DINHEIRO'  then
    begin
        Label15.Caption := 'DINHEIRO';
        ComboBox1.ItemIndex := 2;
    end
    ELSE if ADOQuery1TIPO_AVISTA.AsString <> ''  then
    begin
        Label15.Caption := ADOQuery1TIPO_AVISTA.AsString;
        ComboBox1.ItemIndex := 3;
        Edit5.Text :=  ADOQuery1TIPO_AVISTA.AsString;
    end
    ELSE
      EXIT;

    Image4.Enabled := false;

end;

procedure TForm_CONS_PAGAM_AVISTA.RadioGroup1Click(Sender: TObject);
begin
    Edit6.Enabled := true;
    RadioGroup2Click(self);
    Edit6Change(self);
    LabelAtualizado(SELF);
    Label10.Visible := true;
    Label11.Visible := true;
    Label12.Visible := true;
    Label13.Visible := true;
    Label14.Visible := true;
    Label15.Visible := true;

    Edit1.Visible := false;
    Edit2.Visible := false;
    Edit3.Visible := false;
    Edit4.Visible := false;
    Edit7.Visible := false;

    MaskEdit1.Visible := false;

    ComboBox1.Visible := false;

    Edit5.Visible := FALSE;
    Edit6.Clear;
    Edit6.SetFocus;


end;

procedure TForm_CONS_PAGAM_AVISTA.RadioGroup2Click(Sender: TObject);
begin
    Edit6Change(self);

    if RadioGroup1.ItemIndex = -1 then  //SEM O FILTRAR
    begin
         if RadioGroup2.ItemIndex = 0 then
         begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,' +
                                  ' VALOR_AVISTA,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA' +
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA' +
                                  ' WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA';
            ADOQuery1.Active := true;
            ADOQuery1.open;
         end

         else if RadioGroup2.ItemIndex = 1 then
         begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA, STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                  ' AND TIPO_AVISTA = '+ QuotedStr('CART�O');
            ADOQuery1.Active := true;
            ADOQuery1.open;
         end
         ELSE if RadioGroup2.ItemIndex = 2 then
         begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                  ' AND TIPO_AVISTA = '+ QuotedStr('CHEQUE');
            ADOQuery1.Active := true;
            ADOQuery1.open;
         end
         ELSE if RadioGroup2.ItemIndex = 3 then
         begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                  ' AND TIPO_AVISTA = '+ QuotedStr('DINHEIRO');
            ADOQuery1.Active := true;
            ADOQuery1.open;
         end

         ELSE if RadioGroup2.ItemIndex = 4 then
         begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                  ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                                  ' AND TIPO_AVISTA<>'+ QuotedStr('CHEQUE')+
                                  '	AND TIPO_AVISTA<>'+ QuotedStr('DINHEIRO');
            ADOQuery1.Active := true;
            ADOQuery1.open;
         end
         else
         exit;
    end   ///////////////////////////////////////////////////////////////////////////////////////////////////
    ///
    ///
    ELSE if RadioGroup1.ItemIndex <> -1 then    //COM O FILTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then //paciente
        begin
               if RadioGroup2.ItemIndex = 0 then //todos
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,' +
                                        ' VALOR_AVISTA,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA' +
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA' +
                                        ' WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA'+
                                        ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               else if RadioGroup2.ItemIndex = 1 then //cart�
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CART�O')+
                                        ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 2 then  //cheque
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CHEQUE')+
                                        ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 3 then //cheque
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('DINHEIRO')+
                                        ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               ELSE if RadioGroup2.ItemIndex = 4 then //outros
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                                        ' AND TIPO_AVISTA<> '+ QuotedStr('CHEQUE')+
                                        '	AND TIPO_AVISTA<> '+ QuotedStr('DINHEIRO')+
                                        ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end;
        end
        else if RadioGroup1.ItemIndex = 0 then //dentista
        begin
               if RadioGroup2.ItemIndex = 0 then
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,' +
                                        ' VALOR_AVISTA,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA' +
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA' +
                                        ' WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA'+
                                        ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               else if RadioGroup2.ItemIndex = 1 then //cart�o
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO ,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CART�O')+
                                        ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               ELSE if RadioGroup2.ItemIndex = 2 then //cheque
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CHEQUE')+
                                        ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 3 then //dinheiro
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('DINHEIRO')+
                                        ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 4 then //outros
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                                        ' AND TIPO_AVISTA<>'+ QuotedStr('CHEQUE')+
                                        '	AND TIPO_AVISTA<>'+ QuotedStr('DINHEIRO')+
                                        ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               else
               exit;
        end
        else if RadioGroup1.ItemIndex = 0 then //data
        begin
               if RadioGroup2.ItemIndex = 0 then
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,' +
                                        ' VALOR_AVISTA,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA' +
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA' +
                                        ' WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA'+
                                        ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               else if RadioGroup2.ItemIndex = 1 then //cart�
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CART�O')+
                                        ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 2 then  //cheque
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('CHEQUE')+
                                        ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               ELSE if RadioGroup2.ItemIndex = 3 then //cheque
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA = '+ QuotedStr('DINHEIRO')+
                                        ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end

               ELSE if RadioGroup2.ItemIndex = 4 then //outros
               begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                        ' VALOR_AVISTA,STATUS_PAGAMENTO, DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
                                        ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                        '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                                        ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                                        ' AND TIPO_AVISTA<>'+ QuotedStr('CHEQUE')+
                                        '	AND TIPO_AVISTA<>'+ QuotedStr('DINHEIRO')+
                                        ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
               end
               else
                exit;
        end
        else
          exit;



    end
    else
      exit;



    LabelAtualizado(SELF);
    Label10.Visible := true;
    Label11.Visible := true;
    Label12.Visible := true;
    Label13.Visible := true;
    Label14.Visible := true;
    Label15.Visible := true;

    Edit1.Visible := false;
    Edit2.Visible := false;
    Edit3.Visible := false;
    Edit4.Visible := false;
    Edit7.Visible := false;

    MaskEdit1.Visible := false;

    ComboBox1.Visible := false;

    Edit5.Visible := FALSE;

end;

procedure TForm_CONS_PAGAM_AVISTA.REALIZARPAGAMENTO1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
  dia, mes, ano : string;
begin

   dia_c := Copy(lbl_data.Caption,1,2);
   mes_c := Copy(lbl_data.Caption,4,2);
   ano_c := Copy(lbl_data.Caption,7,4);
   hora_c := Copy(lbl_data.Caption,14,8);

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true then
  begin
    Application.MessageBox('Esse pagamento j� foi realizado!','Aten��o!', MB_ICONEXCLAMATION);
    DBGrid1.SetFocus;
    Exit;
  end
  else if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false then
  begin

    if Application.MessageBox('Deseja mesmo pagar?','ATEN��O',
                                          MB_YESNO+MB_ICONEXCLAMATION)= IDYES then
    begin
      with ADOStoredProc1 do
      begin
        Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_AVISTA.AsInteger;
        Parameters.ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_AVISTA.AsInteger;
        Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_AVISTA.AsInteger;
        Parameters.ParamByName('@VALOR').Value := ADOQuery1VALOR_AVISTA.AsFloat;
        Parameters.ParamByName('@DATAPAGAMENTO').Value := ADOQuery1DATAPAGAMENTO_AVISTA.AsString;
        Parameters.ParamByName('@TIPO').Value := ADOQuery1TIPO_AVISTA.AsString;
        Parameters.ParamByName('@STATUS').Value := '1';
        ExecProc;
      end;

        with CAIXA_AUTOMATICO do
         begin
           Parameters.ParamByName('@DATA').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
           Parameters.ParamByName('@ENTRADA').Value := ADOQuery1VALOR_AVISTA.AsFloat;
           Parameters.ParamByName('@SAIDA').Value := '0.00';
           Parameters.ParamByName('@DTCADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
           Parameters.ParamByName('@AVISTA').Value := ADOQuery1COD_AVISTA.AsInteger;
           Parameters.ParamByName('@APRAZO').Value := NULL;
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
            Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento � vista n� ' + ADOQuery1COD_AVISTA.AsString + ' pago.' ;
            Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
            Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;
        ADOQuery1.Active := false;
        ADOQuery1.Active := true;
    end;

  end;


end;

procedure TForm_CONS_PAGAM_AVISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_CONS_PAGAM_AVISTA.ADOQuery1STATUS_PAGAMENTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = FALSE then
  BEGIN
    Text := 'PENDENTE';
  END;
  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = TRUE then
  BEGIN
    TEXT :='PAGO';
  END;
end;

procedure TForm_CONS_PAGAM_AVISTA.Button1Click(Sender: TObject);
begin

    Edit6.Enabled := false;
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := -1;
    ADOQuery1.close;
    ADOQuery1.Active := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
         ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, DTHORACADASTRO_AVISTA '+
         ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
         ' WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA order by DATAPAGAMENTO_AVISTA desc';
    ADOQuery1.Active := true;
    ADOQuery1.open;

end;

procedure TForm_CONS_PAGAM_AVISTA.ComboBox1Click(Sender: TObject);
begin
    if ComboBox1.ItemIndex = 3 then
    BEGIN
      Edit5.Visible := TRUE;
    END
    else if ComboBox1.ItemIndex <> 3 then
    BEGIN
      Edit5.Clear;
      Edit5.Visible := FALSE
    END
    else
      EXIT;
end;

procedure TForm_CONS_PAGAM_AVISTA.DBGrid1CellClick(Column: TColumn);
{var
  Seleciona_Paciente : integer;
  Seleciona_Dentista : string; }
begin
    LabelAtualizado(SELF);

    Label10.Visible := true;
    Label11.Visible := true;
    Label12.Visible := true;
    Label13.Visible := true;
    Label14.Visible := true;
    Label15.Visible := true;
    Edit1.Visible := false;
    Edit2.Visible := false;
    Edit3.Visible := false;
    Edit4.Visible := false;
    Edit7.Visible := FALSE;
    MaskEdit1.Visible := false;
    ComboBox1.Visible := false;
    Edit5.Visible := FALSE;

end;

procedure TForm_CONS_PAGAM_AVISTA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_AVISTA.DBGrid2CellClick(Column: TColumn);
begin

  if Edit1.Visible = true then
  begin
    Edit2.Text := ADOQueryPACIENTENOME_PACIENTE.AsString;
    ADOStoredProc1.Parameters.ParamByName('@PACIENTE').Value := ADOQueryPACIENTECOD_PACIENTE.AsInteger;
  end
  else
    exit;




end;

procedure TForm_CONS_PAGAM_AVISTA.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_AVISTA.DBGrid3CellClick(Column: TColumn);
begin

  if Edit1.Visible = true then
  begin
    Edit3.Text := ADOQueryDENTISTANOME_DENTISTA.AsString;
    ADOStoredProc1.Parameters.ParamByName('@DENTISTA').Value := ADOQueryDENTISTACOD_DENTISTA.AsInteger;
  end
  else
    exit;



end;

procedure TForm_CONS_PAGAM_AVISTA.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_PAGAM_AVISTA.Edit4Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin

	    //1� Passo : se o edit estiver vazio, nada pode ser feito.
	    If (edit4.Text = emptystr) then
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

procedure TForm_CONS_PAGAM_AVISTA.Edit4Click(Sender: TObject);
begin

		  Edit4.SelStart := Length(Edit4.text) ;
end;

procedure TForm_CONS_PAGAM_AVISTA.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
      if NOT (Key in ['0'..'9', #8, #9]) then
	  begin
	    key := #0;
	  end;

	    //Fun��o para posicionar o cursor sempre na direita
	    Edit4.SelStart := Length(Edit4.text);
end;

procedure TForm_CONS_PAGAM_AVISTA.Edit6Change(Sender: TObject);
{var
   Data_Automatica : string; }
begin

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver DESmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                    ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                                    ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                    '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
       else if RadioGroup1.ItemIndex = 1 then      //DENTISTA
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then     //DATA
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                                  ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                                  ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                                  '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end

    end

    else if RadioGroup2.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup2.ItemIndex=0 then //TODOS
          begin
                      if RadioGroup1.ItemIndex = 0 then  // PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND' +
                          ' NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then // DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND' +
                          ' NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then //DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND' +
                          ' DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end

          end;

          if RadioGroup2.ItemIndex=1 then //CART�O
          begin
                      if RadioGroup1.ItemIndex = 0 then  // PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CART�O')+
                          ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then // DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CART�O')+
                          ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then //DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CART�O')+
                          ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end

          end;

         if RadioGroup2.ItemIndex=2 then //CHEQUE
          begin
                      if RadioGroup1.ItemIndex = 0 then //PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CHEQUE')+
                          ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then  //DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CHEQUE')+
                          ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then  //DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('CHEQUE')+
                          ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end

          end;

          if RadioGroup2.ItemIndex=3 then //DINHEIRO
          begin
                      if RadioGroup1.ItemIndex = 0 then //PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('DINHEIRO')+
                          ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then  //DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO,DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('DINHEIRO')+
                          ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then  //DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA AND TIPO_AVISTA= '+ QuotedStr('DINHEIRO')+
                          ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end

          end;
          if RadioGroup2.ItemIndex=4 then //OUTROS
          begin
                      if RadioGroup1.ItemIndex = 0 then  //PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CHEQUE')+
                          '	AND TIPO_AVISTA<> '+ QuotedStr('DINHEIRO')+
                          ' AND NOME_PACIENTE LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then  //DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA, STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CHEQUE')+
                          '	AND TIPO_AVISTA<> '+ QuotedStr('DINHEIRO')+
                          ' AND NOME_DENTISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then //DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := ' SELECT COD_AVISTA, NOME_PACIENTE,PACIENTE_AVISTA,NOME_DENTISTA,DENTISTA_AVISTA,'+
                          ' VALOR_AVISTA,STATUS_PAGAMENTO,DATAPAGAMENTO_AVISTA, TIPO_AVISTA,  STATUS_PAGAMENTO, DTHORACADASTRO_AVISTA '+
                          ' FROM TB_PAGAMENTO_PACIENTE_AVISTA,TB_PACIENTE,TB_DENTISTA   '+
                          '	WHERE PACIENTE_AVISTA=COD_PACIENTE AND DENTISTA_AVISTA=COD_DENTISTA '+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CART�O')+
                          ' AND TIPO_AVISTA<> '+ QuotedStr('CHEQUE')+
                          '	AND TIPO_AVISTA<> '+ QuotedStr('DINHEIRO')+
                          ' AND DATAPAGAMENTO_AVISTA LIKE '+QuotedStr(Edit6.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end

          end;

    end;






 {   if RadioGroup1.ItemIndex = 2 then
    begin


          if Length(Edit6.Text)=4 then
          begin
              Data_Automatica := Edit6.Text;
              Data_Automatica := Data_Automatica+'-';
              Edit6.Text := Data_Automatica;
              Edit6.SelStart := Length(Edit6.text);
          end;
          if Length(Edit6.Text)=7 then
          begin
              Data_Automatica := Edit6.Text;
              Data_Automatica := Data_Automatica+'-';
              Edit6.Text := Data_Automatica;
              Edit6.SelStart := Length(Edit6.text);
          end;



    end;
               }





end;

procedure TForm_CONS_PAGAM_AVISTA.Edit6KeyPress(Sender: TObject; var Key: Char);
var
   Data_Automatica : string;
begin
   if RadioGroup1.ItemIndex = 2 then
    begin
         if Key <> #8 then
         begin
              if Length(Edit6.Text)=4 then
              begin
                  Data_Automatica := Edit6.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit6.Text := Data_Automatica;
                  Edit6.SelStart := Length(Edit6.text);
              end;
              if Length(Edit6.Text)=7 then
              begin
                  Data_Automatica := Edit6.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit6.Text := Data_Automatica;
                  Edit6.SelStart := Length(Edit6.text);
              end;
         end
         else if Key = #8 then
         begin
           exit;
         end;
    end;


end;

procedure TForm_CONS_PAGAM_AVISTA.Edit7Click(Sender: TObject);
begin
    Edit4.Text := '0,00';
    Edit7.Visible := FALSE;
    Edit4.Visible := TRUE;

    Edit4.SetFocus;
end;

procedure TForm_CONS_PAGAM_AVISTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ADOQuery1.Active := false;
     ADOQuery1.Active := true;

     ADOQueryPACIENTE.Active := false;
     ADOQueryPACIENTE.Active := true;

     ADOQueryDENTISTA.Active := false;
     ADOQueryDENTISTA.Active := true;

     Button1Click(self);
     if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
     begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        DBGrid3.DataSource.DataSet.RecNo := 1;

        LabelAtualizado(SELF);

     end;
end;

procedure TForm_CONS_PAGAM_AVISTA.FormShow(Sender: TObject);
begin
     ADOQuery1.Active := false;
     ADOQuery1.Active := true;
     ADOQueryPACIENTE.Active := false;
     ADOQueryPACIENTE.Active := true;
     ADOQueryDENTISTA.Active := false;
     ADOQueryDENTISTA.Active := true;

     Button1Click(self);
     if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
     begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        DBGrid3.DataSource.DataSet.RecNo := 1;
        LabelAtualizado(SELF);
     end;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image2Click(Sender: TObject);
begin
UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA.FORM_GRAVA_PAGAMENTO_AVISTA.ShowModal;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image3Click(Sender: TObject);
begin


    if (Edit2.Text=EmptyStr) or (label10.Caption = 'DADOS') then
    begin
      Application.MessageBox('N�o � possivel alterar! Selecione um registro!','ATEN��O!',MB_ICONEXCLAMATION);
      exit;
    end;


    Image4.Enabled := true;
    Label10.Visible := false;
    Label11.Visible := false;
    Label12.Visible := false;
    Label13.Visible := true;
    Label14.Visible := true;
    Label15.Visible := false;
    Edit1.Visible := true;
    Edit2.Visible := true;
    Edit3.Visible := true;
    Edit7.Visible := false;
    Edit4.Visible := false;
    MaskEdit1.Visible := FALSE;
    ComboBox1.Visible := true;

    if ComboBox1.ItemIndex = 3 then
    BEGIN
      Edit5.Visible := TRUE ;
    END
    ELSE
    BEGIN
      EXIT;
    END;
end;


procedure TForm_CONS_PAGAM_AVISTA.Image4Click(Sender: TObject);
var
  dia,mes,ano : string;
  Cod_pagamento_Selecionado : integer;
  dia_c, mes_c, ano_c, hora_c : string;
begin
    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do c�digo!', 'Aten��o!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Selecione um dentista na tabela de dentistas!', 'Aten��o!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Selecione um paciente na tabela de pacientes!', 'Aten��o!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end


    else if MaskEdit1.Text = '  /  /    ' then
    begin
        Application.MessageBox('Preencha o campo da data!', 'Aten��o!', MB_ICONWARNING);
        MaskEdit1.SetFocus;
        Exit;
    end

    else if (Edit7.Text = '0,00') or (Edit7.Text = '') then
    begin
        Application.MessageBox('Preencha o campo do valor!', 'Aten��o!', MB_ICONWARNING);
        Edit7.SetFocus;
        Exit;
    end

    else if ComboBox1.ItemIndex = -1 then
    begin
        Application.MessageBox('Selecione um tipo de pagamento!', 'Aten��o!', MB_ICONWARNING);
        Exit;
    end

    else if ComboBox1.ItemIndex = 3 then
    begin
        if Edit5.Text = '' then
        begin
            Application.MessageBox('Preencha o campo do tipo de pagamento!', 'Aten��o!', MB_ICONWARNING);
            Edit5.SetFocus;
            Exit;
        end
    end;


    if Application.MessageBox('Deseja mesmo alterar o pagamento?','ATEN��O',
                                          MB_YESNO+MB_ICONEXCLAMATION)= IDYES then
    BEGIN

       ADOStoredProc1.Parameters.ParamByName('@CODIGO').Value :=  Edit1.Text;

     if Edit2.Text <> ADOQuery1NOME_PACIENTE.AsString then
     begin
       ADOStoredProc1.Parameters.ParamByName('@PACIENTE').Value := ADOQueryPACIENTECOD_PACIENTE.AsInteger;
     end
     else
     begin
       ADOStoredProc1.Parameters.ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_AVISTA.AsInteger;
     end ;

     if Edit3.Text <> ADOQuery1NOME_DENTISTA.AsString then
     begin
       ADOStoredProc1.Parameters.ParamByName('@DENTISTA').Value := ADOQueryDENTISTACOD_DENTISTA.AsInteger;
     end
     else
     begin
       ADOStoredProc1.Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_AVISTA.AsInteger;
     end ;

     if Edit7.Visible = TRUE then
     BEGIN
       ADOStoredProc1.Parameters.ParamByName('@VALOR').Value := Edit7.Text;
     END
     ELSE if Edit7.Visible = FALSE then
     BEGIN
       ADOStoredProc1.Parameters.ParamByName('@VALOR').Value := Edit4.Text;
     END;
       dia := copy(MaskEdit1.Text,1,2);
       mes := copy(MaskEdit1.Text,4,2);
       ano := copy(MaskEdit1.Text,7,4);
       ADOStoredProc1.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano+'-'+mes+'-'+dia;
       if ComboBox1.ItemIndex = 0 then
       begin
       ADOStoredProc1.Parameters.ParamByName('@TIPO').Value := 'CART�O';
       end
       else if ComboBox1.ItemIndex = 1 then
       begin
       ADOStoredProc1.Parameters.ParamByName('@TIPO').Value := 'CHEQUE';
       end
       else if ComboBox1.ItemIndex = 2 then
       begin
       ADOStoredProc1.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO';
       end
       else if ComboBox1.ItemIndex = 3 then
       begin
       ADOStoredProc1.Parameters.ParamByName('@TIPO').Value := Edit5.Text;
       end
       ELSE
          EXIT;

      Cod_pagamento_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
      ADOStoredProc1.ExecProc;

      dia_c := Copy(lbl_data.Caption,1,2);
      mes_c := Copy(lbl_data.Caption,4,2);
      ano_c := Copy(lbl_data.Caption,7,4);
      hora_c := Copy(lbl_data.Caption,14,8);

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;
        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento � vista n� ' + Edit1.Text + ' alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;


      ADOQuery1.Active := false;
      ADOQuery1.Active := true;

      DBGrid1.DataSource.DataSet.RecNo := Cod_pagamento_Selecionado;
      LabelAtualizado(self);

    END
    else
      Image4.Enabled := false;










    Label10.Visible := true;
    Label11.Visible := true;
    Label12.Visible := true;
    Label13.Visible := true;
    Label14.Visible := true;
    Label15.Visible := true;

    Edit1.Visible := false;
    Edit2.Visible := false;
    Edit3.Visible := false;
    Edit4.Visible := false;
    Edit5.Visible := false;
    Edit7.Visible := FALSE;

    MaskEdit1.Visible := false;

    ComboBox1.Visible := false;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image6MouseEnter(Sender: TObject);
begin
 Image7.Visible:=True;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image7Click(Sender: TObject);
begin
 Form_CONS_PAGAM_AVISTA.Close;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image7MouseLeave(Sender: TObject);
begin
 Image7.Visible:=False;
end;

procedure TForm_CONS_PAGAM_AVISTA.Image8Click(Sender: TObject);
begin
    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_AVISTA.Execute;
end;

end.



