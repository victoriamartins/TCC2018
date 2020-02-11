unit Unit_CONS_AGENDAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, pngimage, ComCtrls, DB, ADODB,
  Mask, DBCtrls, RpRave, RpDefine, RpCon, RpConDS, Menus;

type
  TForm_CONS_AGENDAMENTO = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label17: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQueryPaciente: TADOQuery;
    ADOQueryDentista: TADOQuery;
    ADOQueryTratamento: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery1COD_AGENDAMENTO: TAutoIncField;
    ADOQuery1DATAHORA_AGENDAMENTO: TDateTimeField;
    ADOQuery1PACIENTE_AGENDAMENTO: TIntegerField;
    ADOQuery1NOME_PACIENTE: TStringField;
    ADOQuery1DENTISTA_AGENDAMENTO: TIntegerField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1TRATAMENTO_AGENDAMENTO: TIntegerField;
    ADOQuery1NOME_TRATAMENTO: TStringField;
    ADOQuery1CONSULTA_AGENDAMENTO: TStringField;
    ADOQuery1OBS_AGENDAMENTO: TMemoField;
    ADOQuery1DTHORACADASTRO_AGENDAMENTO: TDateTimeField;
    ADOQueryDentistaCOD_DENTISTA: TAutoIncField;
    ADOQueryDentistaNOME_DENTISTA: TStringField;
    ADOQueryDentistaSEXO_DENTISTA: TStringField;
    ADOQueryDentistaCRO_DENTISTA: TStringField;
    ADOQueryDentistaEMAIL_DENTISTA: TStringField;
    ADOQueryDentistaSTATUS_DENTISTA: TStringField;
    ADOQueryDentistaDTHORACADASTRO_DENTISTA: TDateTimeField;
    ADOQueryTratamentoCOD_TRATAMENTO: TAutoIncField;
    ADOQueryTratamentoNOME_TRATAMENTO: TStringField;
    ADOQueryTratamentoOBS_TRATAMENTO: TMemoField;
    ADOQueryTratamentoDTHORACADASTRO_TRATAMENTO: TDateTimeField;
    Image6: TImage;
    Image7: TImage;
    Image2: TImage;
    ADOStoredProc1: TADOStoredProc;
    ADOQueryConsulta: TADOQuery;
    DataSourceConsulta: TDataSource;
    ADOQueryConsultaCOD_CONSULTA: TAutoIncField;
    ADOQueryConsultaDATAHORA_CONSULTA: TDateTimeField;
    ADOQueryConsultaPACIENTE_CONSULTA: TIntegerField;
    ADOQueryConsultaNOME_PACIENTE: TStringField;
    ADOQueryConsultaDENTISTA_CONSULTA: TIntegerField;
    ADOQueryConsultaNOME_DENTISTA: TStringField;
    ADOQueryConsultaTRATAMENTO_CONSULTA: TIntegerField;
    ADOQueryConsultaNOME_TRATAMENTO: TStringField;
    ADOQueryConsultaPREAGENDAMENTO_CONSULTA: TIntegerField;
    ADOQueryConsultaOBS_CONSULTA: TMemoField;
    ADOQueryConsultaDTHORACADASTRO_CONSULTA: TDateTimeField;
    Edit4: TEdit;
    Button3: TButton;
    ADOQueryPacienteCOD_PACIENTE: TAutoIncField;
    ADOQueryPacienteNOME_PACIENTE: TStringField;
    ADOQueryPacienteRG_PACIENTE: TStringField;
    ADOQueryPacienteCPF_PACIENTE: TStringField;
    ADOQueryPacienteSEXO_PACIENTE: TStringField;
    ADOQueryPacienteNASCIMENTO_PACIENTE: TWideStringField;
    ADOQueryPacienteENDERECO_PACIENTE: TStringField;
    ADOQueryPacienteEMAIL_PACIENTE: TStringField;
    ADOQueryPacienteCIDADE_PACIENTE: TIntegerField;
    ADOQueryPacienteNM_CIDADE: TStringField;
    ADOQueryPacienteTEL1_PACIENTE: TStringField;
    ADOQueryPacienteTEL2_PACIENTE: TStringField;
    ADOQueryPacienteMENORDE18ANOS: TBooleanField;
    ADOQueryPacienteMENORDE18ANOS_1: TStringField;
    ADOQueryPacienteRESPONSAVEL_PACIENTE: TIntegerField;
    ADOQueryPacienteOBS_PACIENTE: TMemoField;
    ADOQueryPacienteSTATUS_PACIENTE: TBooleanField;
    ADOQueryPacienteSTATUS_PACIENTE_1: TStringField;
    ADOQueryPacienteDTHORACADASTRO_PACIENTE: TDateTimeField;
    Image3: TImage;
    Image4: TImage;
    Timer1: TTimer;
    Memo1: TMemo;
    RV_AG: TRvDataSetConnection;
    PJ_AG: TRvProject;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    CONSULTAR: TPopupMenu;
    VIROUCONSULTA1: TMenuItem;
    ALTERA_BIT: TADOStoredProc;
    GRAVA_CONSULTA: TADOStoredProc;
    RadioGroup3: TRadioGroup;
    EXCLUI: TImage;
    EXCLUI_AG: TADOStoredProc;
    Image5: TImage;
    lbl_data: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure imfClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure VIROUCONSULTA1Click(Sender: TObject);
    procedure EXCLUIClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery1OBS_AGENDAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CONS_AGENDAMENTO: TForm_CONS_AGENDAMENTO;

implementation

uses Unit_MARCAR_CONSULTA, UNIT_GRAVA_AGENDAMENTO, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_CONS_AGENDAMENTO.LabelAtualizado(Sender: TObject);
var
    dia,mes,ano,hora : string;
begin

              Edit1.Text := IntToStr(ADOQuery1COD_AGENDAMENTO.AsInteger) ;
                  Label9.Caption := IntToStr(ADOQuery1COD_AGENDAMENTO.AsInteger) ;
              dia := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,1,2);
              mes := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,4,2);
              ano := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,7,4);
              hora := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,12,5);
              MaskEdit1.Text := dia+'/'+mes+'/'+ano ;
              MaskEdit2.Text := hora;
                  Label10.Caption :=  dia+'/'+mes+'/'+ano+' '+hora;
              Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
                  Label11.Caption := ADOQuery1NOME_PACIENTE.AsString;
              Edit3.Text := ADOQuery1NOME_DENTISTA.AsString;
                  Label12.Caption := ADOQuery1NOME_DENTISTA.AsString;
              DBLookupComboBox1.KeyValue := ADOQuery1TRATAMENTO_AGENDAMENTO.AsInteger;
                  Label13.Caption := ADOQuery1NOME_TRATAMENTO.AsString;

              {if ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'SIM' then
              begin
                CheckBox1.Checked := true;
              end
              else if ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'NÃO' then
              BEGIN
                CheckBox1.Checked := FALSE;
              END
              ELSE
                EXIT;
                  Label14.Caption := ADOQuery1CONSULTA_AGENDAMENTO.AsString;  }
              Memo1.Lines.Text := ADOQuery1OBS_AGENDAMENTO.AsString;
                  Label15.Caption := ADOQuery1OBS_AGENDAMENTO.AsString;



end;

procedure TForm_CONS_AGENDAMENTO.RadioGroup1Click(Sender: TObject);
begin
    Edit4.Enabled := TRUE;
    Edit4.SetFocus;
end;

procedure TForm_CONS_AGENDAMENTO.RadioGroup2Click(Sender: TObject);
begin
      if RadioGroup1.ItemIndex = -1 then ////SOMENTE O MOSTRAR
      BEGIN

          if RadioGroup2.ItemIndex =0 then ////TODOS
          BEGIN
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                        '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                        '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                        '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ';
            ADOQuery1.Active := true;
            ADOQuery1.open;
          END
          ELSE if RadioGroup2.ItemIndex =1 then ////CONSULTADOS
          BEGIN
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                        '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                        '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                        '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                        '  AND CONSULTA_AGENDAMENTO = 1';
            ADOQuery1.Active := true;
            ADOQuery1.open;

          END
          ELSE if RadioGroup2.ItemIndex =2 then //// NÃO CONSULTADOS
          BEGIN
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                        '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                        '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                        '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                        '  AND CONSULTA_AGENDAMENTO = 0';
            ADOQuery1.Active := true;
            ADOQuery1.open;

          END;

      END
      ELSE if RadioGroup1.ItemIndex <> -1 then //// MOSTRAR E FILTRAR POR
      BEGIN
           if RadioGroup1.ItemIndex = 0 then  ///PACIENTE
           BEGIN
                if RadioGroup2.ItemIndex =0 then ////TODOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =1 then ////CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 1'+
                              '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;

                END
                ELSE if RadioGroup2.ItemIndex =2 then //// NÃO CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 0'+
                              '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;

                END;
           END
           ELSE if RadioGroup1.ItemIndex = 1 then  ///DENTISTA
           BEGIN
                if RadioGroup2.ItemIndex =0 then ////TODOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =1 then ////CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 1'+
                              '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;

                END
                ELSE if RadioGroup2.ItemIndex =2 then //// NÃO CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 0'+
                              '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;

                END;
           END
           ELSE if RadioGroup1.ItemIndex = 0 then  ///TRATAMENTO
           BEGIN
                if RadioGroup2.ItemIndex =0 then ////TODOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =1 then ////CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 1'+
                              '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =2 then //// NÃO CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 0'+
                              '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;

                END;
           END
           ELSE  if RadioGroup1.ItemIndex = 0 then  ///DATA
           BEGIN
                if RadioGroup2.ItemIndex =0 then ////TODOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =1 then ////CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 1'+
                              '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END
                ELSE if RadioGroup2.ItemIndex =2 then //// NÃO CONSULTADOS
                BEGIN
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                              '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                              '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO '+
                              '  AND CONSULTA_AGENDAMENTO = 0'+
                              '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;
                  Edit4.SetFocus;
                END;
           END;

      END;











     LabelAtualizado(SELF);
        Label9.Visible := true;
        Label10.Visible := true;
        Label11.Visible := true;
        Label12.Visible := true;
        Label13.Visible := true;
        //Label14.Visible := true;
        Label15.Visible := true;

        Edit1.Visible := false;
        Edit2.Visible := false;
        Edit3.Visible := false;

        DBLookupComboBox1.Visible := false;
        //CheckBox1.Visible := false;

        MaskEdit1.Visible := false ;
        MaskEdit2.Visible := false ;

        Memo1.Visible := false;


end;

procedure TForm_CONS_AGENDAMENTO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_CONS_AGENDAMENTO.VIROUCONSULTA1Click(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c : string ;
  dia, mes, ano, hora : string ;
begin

  if ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'NÃO' then
  begin

        ALTERA_BIT.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_AGENDAMENTO.AsInteger;

        dia := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,1,2);
        mes := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,4,2);
        ano := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,7,4);
        hora := Copy(ADOQuery1DATAHORA_AGENDAMENTO.AsString,12,4);

        dia_c := Copy(lbl_data.Caption,1,2);
        mes_c := Copy(lbl_data.Caption,4,2);
        ano_c := Copy(lbl_data.Caption,7,4);
        hora_c := Copy(lbl_data.Caption,14,8);

         if Application.MessageBox('Deseja alterar o agendamento e vinculá-lo a uma consulta?','ATENÇÃO',MB_YESNO+MB_ICONEXCLAMATION)= IDYES then
         begin
            ALTERA_BIT.ExecProc;
            //ShowMessage(ADOQuery1DATAHORA_AGENDAMENTO.AsString);

            with GRAVA_CONSULTA.Parameters do
            begin
              ParamByName('@DATAHORA').Value := ano + '-' + mes + '-' + dia + ' ' + hora ;
              ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_AGENDAMENTO.AsInteger;
              ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_AGENDAMENTO.AsInteger;
              ParamByName('@TRATAMENTO').Value := ADOQuery1TRATAMENTO_AGENDAMENTO.AsInteger;
              ParamByName('@PREAGENDADO').Value := ADOQuery1COD_AGENDAMENTO.AsString;
              ParamByName('@OBS').Value := '' ;
              ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;
            end;
              GRAVA_CONSULTA.ExecProc ;
              with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
              begin
                CLOSE;
                Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
                OPEN;
              end;

              with GRAVA_LOG do
              begin
                Parameters.ParamByName('@DESCRICAO').Value := 'Consulta nº ' + INTTOSTR(GRAVA_CONSULTA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrada.' ;
                Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                ExecProc;
              end;
         end

         else
         begin
           exit ;
         end;
          ADOQuery1.Active := false;
          ADOQuery1.Active := true;
  end
  else if ADOQuery1CONSULTA_AGENDAMENTO.AsString='SIM' then
  begin
      Application.MessageBox('Já existe uma consulta vinculada a este agendamento!', 'AVISO!', MB_ICONINFORMATION);
      EXIT ;
  end;



end;

procedure TForm_CONS_AGENDAMENTO.ADOQuery1OBS_AGENDAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(ADOQuery1OBS_AGENDAMENTO.AsString, 1, 200);

end;

procedure TForm_CONS_AGENDAMENTO.Button1Click(Sender: TObject);
VAR
  Agendamento_Selecionado : integer;
begin
 {
  if CheckBox1.Checked = TRUE then
  BEGIN
              with Form_MARCA_CONSULTA.ADOStoredProc1 do
              begin
                Parameters.ParamByName('@CODIGO').Value :=          ADOQueryConsultaCOD_CONSULTA.AsInteger;
                Parameters.ParamByName('@DATAHORA').Value :=        ADOQueryConsultaDATAHORA_CONSULTA.AsDateTime;
                Parameters.ParamByName('@PACIENTE').Value :=        ADOQueryConsultaPACIENTE_CONSULTA.AsInteger;
                Parameters.ParamByName('@DENTISTA').Value :=        ADOQueryConsultaDENTISTA_CONSULTA.AsInteger;
                Parameters.ParamByName('@TRATAMENTO').Value :=      ADOQueryConsultaTRATAMENTO_CONSULTA.AsInteger;
                Parameters.ParamByName('@PREAGENDAMENTO').Value :=  ADOQuery1COD_AGENDAMENTO.AsInteger;  //////////  GRAVA FOREIGN KEY NA TB_CONSULTA
                Parameters.ParamByName('@OBS').Value :=             ADOQueryConsultaOBS_CONSULTA.AsString;
                ExecProc;
              end;
              Agendamento_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
              ADOQuery1.Active := false;
              ADOQuery1.Active := true;
              DBGrid1.DataSource.DataSet.RecNo := Agendamento_Selecionado;
              Image7Click(self);
              Panel1.Visible := false;
  END
  ELSE if CheckBox1.Checked = FALSE then
  BEGIN
              with Form_MARCA_CONSULTA.ADOStoredProc1 do
              begin
                Parameters.ParamByName('@CODIGO').Value :=          ADOQueryConsultaCOD_CONSULTA.AsInteger;
                Parameters.ParamByName('@DATAHORA').Value :=        ADOQueryConsultaDATAHORA_CONSULTA.AsDateTime;
                Parameters.ParamByName('@PACIENTE').Value :=        ADOQueryConsultaPACIENTE_CONSULTA.AsInteger;
                Parameters.ParamByName('@DENTISTA').Value :=        ADOQueryConsultaDENTISTA_CONSULTA.AsInteger;
                Parameters.ParamByName('@TRATAMENTO').Value :=      ADOQueryConsultaTRATAMENTO_CONSULTA.AsInteger;
                Parameters.ParamByName('@PREAGENDAMENTO').Value :=  NULL;
                Parameters.ParamByName('@OBS').Value :=             ADOQueryConsultaOBS_CONSULTA.AsString;
                ExecProc;
              end;
              Agendamento_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
              ADOQuery1.Active := false;
              ADOQuery1.Active := true;
              DBGrid1.DataSource.DataSet.RecNo := Agendamento_Selecionado;
              Image7Click(self);
              Panel1.Visible := false;
  END;
  }


  //Button1.Enabled := FALSE;
end;

procedure TForm_CONS_AGENDAMENTO.Button3Click(Sender: TObject);
begin
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0;
    Edit4.Enabled := FALSE;
    Edit4.Clear ;
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=  '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                        '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                        '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                        '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ';
            ADOQuery1.Active := true;
            ADOQuery1.open;
    LabelAtualizado(SELF);

end;

procedure TForm_CONS_AGENDAMENTO.CheckBox1Click(Sender: TObject);
begin


   {
    if (ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'NÃO') AND (CheckBox1.Checked = TRUE) then
    BEGIN
       ADOQueryConsulta.Close;
       ADOQueryConsulta.Active := FALSE;
       ADOQueryConsulta.SQL.Text := ' select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA, '+
			                              ' TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA, OBS_CONSULTA,DTHORACADASTRO_CONSULTA '+
                                    ' from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                  		        	    ' where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
	                                  ' AND PREAGENDAMENTO_CONSULTA is null ';
       Panel1.Left := 450;
       Panel1.Top := 250;
       Panel1.Visible := TRUE;
       ADOQueryConsulta.Active := TRUE;
       ADOQueryConsulta.Open;
       Label18.Caption := 'CONSULTAS QUE NÃO FORAM AGENDADAS:';
    END
    ELSE if (ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'SIM') AND (CheckBox1.Checked = FALSE) then
    BEGIN
       ADOQueryConsulta.Close;
       ADOQueryConsulta.Active := FALSE;
       ADOQueryConsulta.SQL.Text := ' select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA, '+
			                              ' TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA, OBS_CONSULTA,DTHORACADASTRO_CONSULTA '+
                                    ' from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                  		        	    ' where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
	                                  ' AND PREAGENDAMENTO_CONSULTA <> '+ QuotedStr('');
       Panel1.Left := 450;
       Panel1.Top := 250;
       Panel1.Visible := TRUE;
       ADOQueryConsulta.Active := TRUE;
       ADOQueryConsulta.Open;
       Label18.Caption := 'CONSULTAS QUE FORAM AGENDADAS:';
    END;
   }
end;

procedure TForm_CONS_AGENDAMENTO.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(self);

        Label9.Visible := true;
        Label10.Visible := true;
        Label11.Visible := true;
        Label12.Visible := true;
        Label13.Visible := true;
        //Label14.Visible := true;
        Label15.Visible := true;

        Edit1.Visible := false;
        Edit2.Visible := false;
        Edit3.Visible := false;

        DBLookupComboBox1.Visible := false;
        //CheckBox1.Visible := false;

        if ADOQuery1CONSULTA_AGENDAMENTO.AsString='SIM' then
        begin
          RadioGroup3.ItemIndex := 0 ;
        end
        else if ADOQuery1CONSULTA_AGENDAMENTO.AsString='NÃO' then
        begin
          RadioGroup3.ItemIndex := 1 ;
        end;

        MaskEdit1.Visible := false ;
        MaskEdit2.Visible := false ;

        Memo1.Visible := false;

end;

procedure TForm_CONS_AGENDAMENTO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_AGENDAMENTO.DBGrid2CellClick(Column: TColumn);
begin
     if Edit2.Visible = TRUE then
     BEGIN
          Edit2.Text := ADOQueryPacienteNOME_PACIENTE.AsString;
     END
     ELSE
        EXIT;
end;

procedure TForm_CONS_AGENDAMENTO.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_AGENDAMENTO.DBGrid3CellClick(Column: TColumn);
begin

    if Edit3.Visible = TRUE then
    BEGIN
        Edit3.Text := ADOQueryDentistaNOME_DENTISTA.AsString;
    END
    ELSE
      EXIT;

end;

procedure TForm_CONS_AGENDAMENTO.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TForm_CONS_AGENDAMENTO.Edit4Change(Sender: TObject);
begin


    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then ////PACIENTE
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
		                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
				                          '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
				                          '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                  '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
      else if RadioGroup1.ItemIndex = 1 then         //////DENTISTA
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
		                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
				                          '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
				                          '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                  '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then   //////TRATAMENTO
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
		                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
				                          '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
				                          '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                  '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 3 then   ///// DATA
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
		                              '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
				                          '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
				                          '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                  '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
    end
    else if RadioGroup2.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup2.ItemIndex=0 then //TODOS
          begin
                      if RadioGroup1.ItemIndex = 0 then  ////PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then ////DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then  /////TRATAMENTO
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then  ///// DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=1 then //CONSULTADOS
          begin
                      if RadioGroup1.ItemIndex = 0 then  ////PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                ' FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                ' WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 1'+
                                                ' AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then ////DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 1'+
                                                '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then  /////TRATAMENTO
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 1'+
                                                '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then  ///// DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 1'+
                                                '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=2 then //NÃO CONSULTADOS
          begin
                      if RadioGroup1.ItemIndex = 0 then  ////PACIENTE
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 0'+
                                                '  AND NOME_PACIENTE like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then ////DENTISTA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 0'+
                                                '  AND NOME_DENTISTA like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then  /////TRATAMENTO
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 0'+
                                                '  AND NOME_TRATAMENTO like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then  ///// DATA
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := '	SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO,'+
                                                '	CASE [CONSULTA_AGENDAMENTO] WHEN 1 THEN ''SIM'' ELSE ''NÃO'' END AS CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO '+
                                                '  FROM TB_AGENDAMENTO,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO '+
                                                '  WHERE PACIENTE_AGENDAMENTO=COD_PACIENTE AND DENTISTA_AGENDAMENTO=COD_DENTISTA AND TRATAMENTO_AGENDAMENTO=COD_TRATAMENTO ' +
                                                ' AND CONSULTA_AGENDAMENTO = 0'+
                                                '  AND CAST(DATAHORA_AGENDAMENTO AS DATE) like '+ QuotedStr(Edit4.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;




    LabelAtualizado(SELF);
        Label9.Visible := true;
        Label10.Visible := true;
        Label11.Visible := true;
        Label12.Visible := true;
        Label13.Visible := true;
        //Label14.Visible := true;
        Label15.Visible := true;

        Edit1.Visible := false;
        Edit2.Visible := false;
        Edit3.Visible := false;

        DBLookupComboBox1.Visible := false;
        //CheckBox1.Visible := false;

        MaskEdit1.Visible := false ;
        MaskEdit2.Visible := false ;

        Memo1.Visible := false;

end;

procedure TForm_CONS_AGENDAMENTO.Edit4KeyPress(Sender: TObject; var Key: Char);
VAR
  Data_Automatica : string;
begin
    if RadioGroup1.ItemIndex = 3 then
    BEGIN
      if Key <> #8 then
         begin
              if Length(Edit4.Text)=4 then
              begin
                  Data_Automatica := Edit4.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit4.Text := Data_Automatica;
                  Edit4.SelStart := Length(Edit4.text);
              end;
              if Length(Edit4.Text)=7 then
              begin
                  Data_Automatica := Edit4.Text;
                  Data_Automatica := Data_Automatica+'-';
                  Edit4.Text := Data_Automatica;
                  Edit4.SelStart := Length(Edit4.text);
              end;
         end
         else if Key = #8 then
         begin
           exit;
         end;
    END;
end;

procedure TForm_CONS_AGENDAMENTO.EXCLUIClick(Sender: TObject);
var
    ano_c, mes_c, dia_c, hora_c : string ;
begin

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  EXCLUI_AG.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_AGENDAMENTO.AsInteger ;
  if Application.MessageBox('Tem certeza que deseja excluir o agendamento? Atenção: se houver uma consulta vinculada com este, ela será excluída!','EXCLUIR', mb_iconquestion + mb_yesno) = idYes then
  begin

    EXCLUI_AG.ExecProc ;
    ADOQuery1.Active := FALSE ;
    ADOQuery1.Active := TRUE ;
    WITH Unit_MARCAR_CONSULTA.Form_MARCA_CONSULTA.ADOQuery1 DO
    BEGIN
      Active := FALSE ;
      Active := TRUE ;
    END;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Agendamento excluído.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

  end;

end;

procedure TForm_CONS_AGENDAMENTO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Button3Click(self);
    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;

    ADOQueryPaciente.Active := FALSE;
    ADOQueryPaciente.Active := TRUE;

    ADOQueryDentista.Active := FALSE;
    ADOQueryDentista.Active := TRUE;

    //DBGrid1.DataSource.DataSet.RecNo := 1;     //
    //DBGrid2.DataSource.DataSet.RecNo := 1;     // ativar depois
    //DBGrid3.DataSource.DataSet.RecNo := 1;     //
    LabelAtualizado(SELF);
end;

procedure TForm_CONS_AGENDAMENTO.FormShow(Sender: TObject);
begin
    Button3Click(self);
    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;

    ADOQueryPaciente.Active := FALSE;
    ADOQueryPaciente.Active := TRUE;

    ADOQueryDentista.Active := FALSE;
    ADOQueryDentista.Active := TRUE;

    ADOQueryTratamento.Active := false ;
    ADOQueryTratamento.Active := true ;

    //DBGrid1.DataSource.DataSet.RecNo := 1;     //
    //DBGrid2.DataSource.DataSet.RecNo := 1;     // ativar depois
    //DBGrid3.DataSource.DataSet.RecNo := 1;     //
    LabelAtualizado(SELF);
end;

procedure TForm_CONS_AGENDAMENTO.Image3Click(Sender: TObject);
begin
 Form_CONS_AGENDAMENTO.Close;
end;

procedure TForm_CONS_AGENDAMENTO.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible:=False;
end;

procedure TForm_CONS_AGENDAMENTO.Image4Click(Sender: TObject);
begin
Form_CONS_AGENDAMENTO.Close;
end;

procedure TForm_CONS_AGENDAMENTO.Image4MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TForm_CONS_AGENDAMENTO.Image5Click(Sender: TObject);
begin
UNIT_GRAVA_AGENDAMENTO.FORM_GRAVA_AGENDAMENTO.ShowModal;
end;

procedure TForm_CONS_AGENDAMENTO.Image6Click(Sender: TObject);
begin
        Label9.Visible := false;
        Label10.Visible := false;
        Label11.Visible := false;
        Label12.Visible := false;
        Label13.Visible := false;
        //Label14.Visible := false;
        Label15.Visible := false;

        Edit1.Visible := true;
        Edit2.Visible := true;
        Edit3.Visible := true;

        DBLookupComboBox1.Visible := true;
        //CheckBox1.Visible := true;

        MaskEdit1.Visible := true ;
        MaskEdit2.Visible := true ;

        Memo1.Visible := true;
end;

procedure TForm_CONS_AGENDAMENTO.Image7Click(Sender: TObject);
var
  dia, mes, ano, hora : string;
  Agendamento_Selecionado : integer;
    dia_c , mes_c, ano_c, hora_c: string;
begin

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

   if Application.MessageBox('Tem certeza que deseja alterar o agendamento?','ATENÇÃO!',MB_YESNO+MB_ICONEXCLAMATION)= IDYES then
   begin
          ADOStoredProc1.Parameters.ParamByName('@CODIGO').Value :=      StrToInt(Edit1.Text);

          dia := Copy(MaskEdit1.Text,1,2);
          mes := Copy(MaskEdit1.Text,4,2);
          ano := Copy(MaskEdit1.Text,7,4);
          hora := MaskEdit2.Text;
          ADOStoredProc1.Parameters.ParamByName('@DATAHORA').Value :=    ano+'-'+mes+'-'+dia+' '+hora ;
        if Edit2.Text <> ADOQuery1NOME_PACIENTE.AsString then
        begin
             ADOStoredProc1.Parameters.ParamByName('@PACIENTE').Value := ADOQueryPacienteCOD_PACIENTE.AsInteger ;
        end
        else if Edit2.Text = ADOQuery1NOME_PACIENTE.AsString then
        begin
             ADOStoredProc1.Parameters.ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_AGENDAMENTO.AsInteger;
        end;

        if Edit3.Text <> ADOQuery1NOME_DENTISTA.AsString then
        begin
             ADOStoredProc1.Parameters.ParamByName('@DENTISTA').Value := ADOQueryDentistaCOD_DENTISTA.AsInteger;
        end
        ELSE if Edit3.Text = ADOQuery1NOME_DENTISTA.AsString then
        begin
             ADOStoredProc1.Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_AGENDAMENTO.AsInteger;
        end;
          ADOStoredProc1.Parameters.ParamByName('@TRATAMENTO').Value := DBLookupComboBox1.KeyValue;
       { if CheckBox1.Checked = false then
        begin
          ADOStoredProc1.Parameters.ParamByName('@CONSULTA').Value :=  false;
        end
        else if CheckBox1.Checked = true then
        begin
          ADOStoredProc1.Parameters.ParamByName('@CONSULTA').Value :=  true;
        end;  }
          ADOStoredProc1.Parameters.ParamByName('@OBS').Value :=        Memo1.Lines.Text;

          Agendamento_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
          ADOStoredProc1.ExecProc;
        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Agendamento nº ' + Edit1.Text + 'alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;
          ADOQuery1.Active := false;
          ADOQuery1.Active := true;

          DBGrid1.DataSource.DataSet.RecNo := Agendamento_Selecionado;

   end;

        LabelAtualizado(self);
        Label9.Visible := true;
        Label10.Visible := true;
        Label11.Visible := true;
        Label12.Visible := true;
        Label13.Visible := true;
        //Label14.Visible := true;
        Label15.Visible := true;

        Edit1.Visible := false;
        Edit2.Visible := false;
        Edit3.Visible := false;

        DBLookupComboBox1.Visible := false;
        //CheckBox1.Visible := false;

        MaskEdit1.Visible := false ;
        MaskEdit2.Visible := false ;

        Memo1.Visible := false;

end;

procedure TForm_CONS_AGENDAMENTO.Image8Click(Sender: TObject);
begin

    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    PJ_AG.Execute;

end;

procedure TForm_CONS_AGENDAMENTO.imfClick(Sender: TObject);
begin
  { Panel1.Visible := FALSE;

   if (ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'SIM') then
   BEGIN
   CheckBox1.Checked := TRUE;
   END
   ELSE if (ADOQuery1CONSULTA_AGENDAMENTO.AsString = 'NÃO') then
   BEGIN
   CheckBox1.Checked := FALSE;
   END;   }

end;

end.
