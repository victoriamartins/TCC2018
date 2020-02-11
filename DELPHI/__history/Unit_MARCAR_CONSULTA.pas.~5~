unit Unit_MARCAR_CONSULTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, pngimage, jpeg, DB, ADODB,
  DBCtrls, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_MARCA_CONSULTA = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit8: TEdit;
    Memo1: TMemo;
    Edit3: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label16: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQueryPaciente: TADOQuery;
    ADOQueryDentista: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQueryPacienteCOD_PACIENTE: TAutoIncField;
    ADOQueryPacienteNOME_PACIENTE: TStringField;
    ADOQueryPacienteRG_PACIENTE: TStringField;
    ADOQueryPacienteCPF_PACIENTE: TStringField;
    ADOQueryPacienteSEXO_PACIENTE: TStringField;
    ADOQueryPacienteNASCIMENTO_PACIENTE: TWideStringField;
    ADOQueryPacienteENDERECO_PACIENTE: TStringField;
    ADOQueryPacienteEMAIL_PACIENTE: TStringField;
    ADOQueryPacienteCIDADE_PACIENTE: TIntegerField;
    ADOQueryPacienteTEL1_PACIENTE: TStringField;
    ADOQueryPacienteTEL2_PACIENTE: TStringField;
    ADOQueryPacienteMENORDE18ANOS: TBooleanField;
    ADOQueryPacienteRESPONSAVEL_PACIENTE: TIntegerField;
    ADOQueryPacienteOBS_PACIENTE: TMemoField;
    ADOQueryPacienteSTATUS_PACIENTE: TBooleanField;
    ADOQueryPacienteDTHORACADASTRO_PACIENTE: TDateTimeField;
    ADOQueryDentistaCOD_DENTISTA: TAutoIncField;
    ADOQueryDentistaNOME_DENTISTA: TStringField;
    ADOQueryDentistaSEXO_DENTISTA: TStringField;
    ADOQueryDentistaCRO_DENTISTA: TStringField;
    ADOQueryDentistaEMAIL_DENTISTA: TStringField;
    ADOQueryDentistaSTATUS_DENTISTA: TStringField;
    ADOQueryDentistaDTHORACADASTRO_DENTISTA: TDateTimeField;
    ADOQueryTratamento: TADOQuery;
    DataSource4: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1COD_CONSULTA: TAutoIncField;
    ADOQuery1DATAHORA_CONSULTA: TDateTimeField;
    ADOQuery1PACIENTE_CONSULTA: TIntegerField;
    ADOQuery1NOME_PACIENTE: TStringField;
    ADOQuery1DENTISTA_CONSULTA: TIntegerField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1TRATAMENTO_CONSULTA: TIntegerField;
    ADOQuery1NOME_TRATAMENTO: TStringField;
    ADOQuery1PREAGENDAMENTO_CONSULTA: TIntegerField;
    ADOQuery1OBS_CONSULTA: TMemoField;
    ADOQuery1DTHORACADASTRO_CONSULTA: TDateTimeField;
    ADOQueryPreAgendado: TADOQuery;
    DataSource5: TDataSource;
    ADOQueryPreAgendadoCOD_AGENDAMENTO: TAutoIncField;
    ADOQueryPreAgendadoDATAHORA_AGENDAMENTO: TDateTimeField;
    ADOQueryPreAgendadoPACIENTE_AGENDAMENTO: TIntegerField;
    ADOQueryPreAgendadoDENTISTA_AGENDAMENTO: TIntegerField;
    ADOQueryPreAgendadoTRATAMENTO_AGENDAMENTO: TIntegerField;
    ADOQueryPreAgendadoCONSULTA_AGENDAMENTO: TBooleanField;
    ADOQueryPreAgendadoOBS_AGENDAMENTO: TMemoField;
    ADOQueryPreAgendadoDTHORACADASTRO_AGENDAMENTO: TDateTimeField;
    ADOStoredProc1: TADOStoredProc;
    Button1: TButton;
    lbl_data: TLabel;
    Timer1: TTimer;
    ADOQUERY_BUSCA: TADOQuery;
    ADOQUERY_BUSCA_2: TADOQuery;
    Image8: TImage;
    DS_AG: TDataSource;
    RV_CONS: TRvDataSetConnection;
    PJ_CONS: TRvProject;
    EXCLUI: TImage;
    EXCLUI_AG: TADOStoredProc;
    EXCLUI_CONS: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    ADOQUERY_BUSCACOD_AGENDAMENTO: TAutoIncField;
    ADOQUERY_BUSCADATAHORA_AGENDAMENTO: TDateTimeField;
    ADOQUERY_BUSCAPACIENTE_AGENDAMENTO: TIntegerField;
    ADOQUERY_BUSCADENTISTA_AGENDAMENTO: TIntegerField;
    ADOQUERY_BUSCATRATAMENTO_AGENDAMENTO: TIntegerField;
    ADOQUERY_BUSCACONSULTA_AGENDAMENTO: TBooleanField;
    ADOQUERY_BUSCAOBS_AGENDAMENTO: TMemoField;
    ADOQUERY_BUSCADTHORACADASTRO_AGENDAMENTO: TDateTimeField;
    ADOQUERY_BUSCA_2COD_CONSULTA: TAutoIncField;
    ADOQUERY_BUSCA_2DATAHORA_CONSULTA: TDateTimeField;
    ADOQUERY_BUSCA_2PACIENTE_CONSULTA: TIntegerField;
    ADOQUERY_BUSCA_2DENTISTA_CONSULTA: TIntegerField;
    ADOQUERY_BUSCA_2TRATAMENTO_CONSULTA: TIntegerField;
    ADOQUERY_BUSCA_2PREAGENDAMENTO_CONSULTA: TIntegerField;
    ADOQUERY_BUSCA_2OBS_CONSULTA: TMemoField;
    ADOQUERY_BUSCA_2DTHORACADASTRO_CONSULTA: TDateTimeField;
    CONSULTAS_RV: TRvDataSetConnection;
    PJ_CONSULTAS: TRvProject;
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure CLICK(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AGOBS_AGENDAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure imfClick(Sender: TObject);
    procedure EXCLUIClick(Sender: TObject);
    procedure DBGrid1MouseEnter(Sender: TObject);
    procedure DBGrid1MouseLeave(Sender: TObject);
    procedure altera(Sender: TObject);
    procedure ADOQuery1OBS_CONSULTAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQueryDentistaSTATUS_DENTISTAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ADOQueryPacienteSTATUS_PACIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ADOQueryPacienteOBS_PACIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_MARCA_CONSULTA: TForm_MARCA_CONSULTA;

implementation

uses UNIT_GRAVA_CONSULTA, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_MARCA_CONSULTA.LabelAtualizado(Sender: TObject);
var
   dia, mes, ano, hora : string ;
begin


    Edit1.Text := IntToStr(ADOQuery1COD_CONSULTA.AsInteger);
      Label8.Caption := IntToStr(ADOQuery1COD_CONSULTA.AsInteger);
    dia := Copy(ADOQuery1DATAHORA_CONSULTA.AsString,1,2);
    mes := Copy(ADOQuery1DATAHORA_CONSULTA.AsString,4,2);
    ano := Copy(ADOQuery1DATAHORA_CONSULTA.AsString,7,4);
    hora := Copy(ADOQuery1DATAHORA_CONSULTA.AsString,12,5);
    MaskEdit1.Text := dia+'/'+mes+'/'+ano;
      label9.Caption := ADOQuery1DATAHORA_CONSULTA.AsString;
    MaskEdit2.Text := hora;
    Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
      Label10.Caption := ADOQuery1NOME_PACIENTE.AsString;
    Edit3.Text := ADOQuery1NOME_DENTISTA.AsString;
      Label11.Caption := ADOQuery1NOME_DENTISTA.AsString;
    DBLookupComboBox1.KeyValue := ADOQuery1TRATAMENTO_CONSULTA.AsInteger ;
      Label12.Caption := ADOQuery1NOME_TRATAMENTO.AsString;
    Memo1.Lines.Text := ADOQuery1OBS_CONSULTA.AsString;
      Label13.Caption := ADOQuery1OBS_CONSULTA.AsString;

    //Image7.Enabled := false;
  {
 if ADOQuery1PREAGENDAMENTO_CONSULTA.AsInteger <> 0 then
  BEGIN
      CheckBox1.Checked := TRUE;
  END
  ELSE
  BEGIN
      CheckBox1.Checked := FALSE;
  END;

       Panel1.Visible := FALSE ;
 }
end;

procedure TForm_MARCA_CONSULTA.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := true;
end;

procedure TForm_MARCA_CONSULTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_MARCA_CONSULTA.ADOQuery1OBS_CONSULTAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  text := Copy(ADOQuery1OBS_CONSULTA.AsString,1,200);
end;

procedure TForm_MARCA_CONSULTA.ADOQueryDentistaSTATUS_DENTISTAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQueryDentistaSTATUS_DENTISTA.AsBoolean = true  then
  begin
    Text := 'ATIVO';
  end
  else
  begin
    Text := 'INATIVO';
  end;


end;

procedure TForm_MARCA_CONSULTA.ADOQueryPacienteOBS_PACIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  Text := Copy(ADOQueryPacienteOBS_PACIENTE.AsString,1,250);

end;

procedure TForm_MARCA_CONSULTA.ADOQueryPacienteSTATUS_PACIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ADOQueryPacienteSTATUS_PACIENTE.AsBoolean = true  then
  begin
    Text := 'ATIVO';
  end
  else
  begin
    Text := 'INATIVO';
  end;
end;

procedure TForm_MARCA_CONSULTA.AGOBS_AGENDAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
//Text := Copy(AGOBS_AGENDAMENTO.AsString,1,200);
end;

procedure TForm_MARCA_CONSULTA.CheckBox1Click(Sender: TObject);
begin
{    if Edit1.Visible = true then
    begin
          if CheckBox1.Checked = true then
          begin
               DBLookupComboBox2.KeyValue := 0;
               DBLookupComboBox2.Visible := true;
          end
          else if CheckBox1.Checked = false then
          begin
               DBLookupComboBox2.Visible := false;
          end
          else
              exit;
    end
    else if Edit1.Visible = false then
    begin
          exit;
    end
    else
        exit;  }

  //Panel1.Visible := TRUE ;
end;

procedure TForm_MARCA_CONSULTA.CLICK(Column: TColumn);
begin
     LabelAtualizado(self);

     Edit1.Visible := false;
     Edit2.Visible := false;
     Edit3.Visible := false;

     MaskEdit1.Visible := false;
     MaskEdit2.Visible := false;

     DBLookupComboBox1.Visible := false;
     //DBLookupComboBox2.Visible := false;
     //CheckBox1.Enabled := false;

     Memo1.Visible := false;


     Label8.Visible := true;
     Label9.Visible := true;
     Label10.Visible := true;
     Label11.Visible := true;
     Label12.Visible := true;
     Label13.Visible := true;
    // ShowMessage(dia+' '+mes+' '+ano+' '+hora);



end;

procedure TForm_MARCA_CONSULTA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_MARCA_CONSULTA.DBGrid1MouseEnter(Sender: TObject);
begin
ShowHint := true ;
end;

procedure TForm_MARCA_CONSULTA.DBGrid1MouseLeave(Sender: TObject);
begin
ShowHint := false ;
end;

procedure TForm_MARCA_CONSULTA.DBGrid2CellClick(Column: TColumn);
begin

     if Edit1.Visible = TRUE then
     BEGIN
         Edit2.Text := ADOQueryPacienteNOME_PACIENTE.AsString;

     END
     ELSE
      EXIT;

end;

procedure TForm_MARCA_CONSULTA.DBGrid3CellClick(Column: TColumn);
begin
    if Edit1.Visible = false then
    begin
      exit;
    end
    else
    Edit3.Text := ADOQueryDentistaNOME_DENTISTA.AsString;

end;

procedure TForm_MARCA_CONSULTA.Edit8Change(Sender: TObject);
begin


    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA,'+
                                  '  TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA,OBS_CONSULTA,DTHORACADASTRO_CONSULTA        '+
                                  '	 from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO                                                      '+
                                  '	 where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
                                  '  and CAST(DATAHORA_CONSULTA AS DATE) LIKE '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := '	select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA,'+
                                  '  TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA,OBS_CONSULTA,DTHORACADASTRO_CONSULTA        '+
                                  '	 from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO                                                      '+
                                  '	 where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
                                  '  and NOME_PACIENTE LIKE '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA,'+
                                  '  TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA,OBS_CONSULTA,DTHORACADASTRO_CONSULTA        '+
                                  '	 from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO                                                      '+
                                  '	 where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
                                  '  and NOME_DENTISTA LIKE '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 3 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select COD_CONSULTA,DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE,DENTISTA_CONSULTA, NOME_DENTISTA,'+
                                  '  TRATAMENTO_CONSULTA, NOME_TRATAMENTO,PREAGENDAMENTO_CONSULTA,OBS_CONSULTA,DTHORACADASTRO_CONSULTA        '+
                                  '	 from TB_CONSULTA,TB_PACIENTE,TB_DENTISTA,TB_TRATAMENTO                                                      '+
                                  '	 where PACIENTE_CONSULTA=COD_PACIENTE and DENTISTA_CONSULTA=COD_DENTISTA and TRATAMENTO_CONSULTA=COD_TRATAMENTO'+
                                  '  and NOME_TRATAMENTO LIKE '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
    end
    else if RadioGroup2.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup2.ItemIndex=0 then // PRE
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=1 then //Ativo
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=2 then //Inativo
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   STATUS_PACIENTE=1 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
          if RadioGroup2.ItemIndex=3 then //Maiores
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   MENORDE18ANOS=0 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
          if RadioGroup2.ItemIndex=4 then //Menores
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   MENORDE18ANOS=1 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

    end;

end;

procedure TForm_MARCA_CONSULTA.EXCLUIClick(Sender: TObject);
begin

  if ADOQuery1PREAGENDAMENTO_CONSULTA.AsVariant <> NULL then
  BEGIN
      EXCLUI_AG.Parameters.ParamByName('@CODIGO').Value := ADOQuery1PREAGENDAMENTO_CONSULTA.AsInteger ;
      if Application.MessageBox('Tem certeza que deseja excluir a consulta? Atenção: o agendamento vinculada com este, ele será excluído!','EXCLUIR', mb_iconquestion + mb_yesno) = idYes then
      begin
        EXCLUI_AG.ExecProc ;
        ADOQuery1.Active := FALSE ;
        ADOQuery1.Active := TRUE ;
        WITH Unit_MARCAR_CONSULTA.Form_MARCA_CONSULTA.ADOQuery1 DO
        BEGIN
          Active := FALSE ;
          Active := TRUE ;
        END;
      end;
  END;

  if ADOQuery1PREAGENDAMENTO_CONSULTA.AsVariant = NULL then
  BEGIN
    EXCLUI_CONS.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_CONSULTA.AsInteger;
      if Application.MessageBox('Tem certeza que deseja excluir a consulta?','EXCLUIR', mb_iconquestion + mb_yesno) = idYes then
      begin
        EXCLUI_CONS.ExecProc ;
        ADOQuery1.Active := FALSE ;
        ADOQuery1.Active := TRUE ;
        WITH Unit_MARCAR_CONSULTA.Form_MARCA_CONSULTA.ADOQuery1 DO
        BEGIN
          Active := FALSE ;
          Active := TRUE ;
        END;
      end;
  END;


end;

procedure TForm_MARCA_CONSULTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ADOQueryPaciente.Active := FALSE;
    ADOQueryPaciente.Active := TRUE;

    ADOQueryDentista.Active := FALSE;
    ADOQueryDentista.Active := TRUE;

    ADOQuery1.Active := FALSE ;
    ADOQuery1.Active := TRUE ;

    Button1Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        DBGrid3.DataSource.DataSet.RecNo := 1;
        LabelAtualizado(self);
    end;
end;

procedure TForm_MARCA_CONSULTA.FormShow(Sender: TObject);
begin

    ADOQueryPaciente.Active := FALSE;
    ADOQueryPaciente.Active := TRUE;

    ADOQueryDentista.Active := FALSE;
    ADOQueryDentista.Active := TRUE;

    ADOQuery1.Active := FALSE ;
    ADOQuery1.Active := TRUE ;

    ADOQueryTratamento.Active := false ;
    ADOQueryTratamento.Active := true  ;

    Button1Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
        DBGrid1.DataSource.DataSet.RecNo := 1;
        DBGrid2.DataSource.DataSet.RecNo := 1;
        DBGrid3.DataSource.DataSet.RecNo := 1;
        LabelAtualizado(self);
    end;
end;

procedure TForm_MARCA_CONSULTA.Image2MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TForm_MARCA_CONSULTA.Image3Click(Sender: TObject);
begin
Form_MARCA_CONSULTA.Close;
end;

procedure TForm_MARCA_CONSULTA.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible:=False;
end;

procedure TForm_MARCA_CONSULTA.Image5Click(Sender: TObject);
begin
UNIT_GRAVA_CONSULTA.FORM_GRAVA_CONSULTA.ShowModal;
end;

procedure TForm_MARCA_CONSULTA.Image6Click(Sender: TObject);
begin

  if ADOQuery1PREAGENDAMENTO_CONSULTA.AsVariant = null then
  begin
    Label8.Visible := FALSE;
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;
    Label12.Visible := FALSE;
    Label13.Visible := FALSE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;

    //CheckBox1.Enabled := true;

    Memo1.Visible := TRUE;

    MaskEdit1.Visible := TRUE;
    MaskEdit2.Visible := TRUE;

    DBLookupComboBox1.Visible := true;
    Image7.Enabled := true;
  end
  else if ADOQuery1PREAGENDAMENTO_CONSULTA.AsVariant <> null then
  begin
    Application.MessageBox('É impossível alterar uma consulta pré agendada. Tente excluir este registro e cadastrar novamente vinculando-a a um agendamento!'
      ,'ATENÇÃO!', MB_ICONINFORMATION);
  end;



end;

procedure TForm_MARCA_CONSULTA.Image7Click(Sender: TObject);
var
   dia_cons, ano_cons, mes_cons, hora_cons : STRING;
   Cod_Consulta_selecionada : integer;
begin

 dia_cons := Copy(MaskEdit1.Text,1,2);
 mes_cons := Copy(MaskEdit1.Text,4,2);
 ano_cons := Copy(MaskEdit1.Text,7,4);
 hora_cons := MaskEdit2.Text;

  with ADOQUERY_BUSCA_2 do
  begin
    Close;
    Active:= false ;
    Parameters.ParamByName('DTHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;
    Parameters.ParamByName('DENTISTA').Value :=  DBLookupComboBox1.KeyValue;
    Active := true ;
    open;
  end;

  //ShowMessage(ADOQUERY_BUSCA_2COD_CONSULTA.AsString + ' e ' + ADOQuery1COD_CONSULTA.AsString);

  if (ADOQUERY_BUSCA_2.RecordCount=1)and(ADOQUERY_BUSCA_2COD_CONSULTA.AsInteger=ADOQuery1COD_CONSULTA.AsInteger) then
  begin

    Cod_Consulta_selecionada := DBGrid1.DataSource.DataSet.RecNo;
    altera(self);

    ADOQuery1.Active := false ;
    ADOQuery1.Active := true ;

    DBGrid1.DataSource.DataSet.RecNo := Cod_Consulta_selecionada;
    LabelAtualizado(self);
  end
  else if ADOQUERY_BUSCA_2.RecordCount = 0 then
  begin

    Cod_Consulta_selecionada := DBGrid1.DataSource.DataSet.RecNo;
    altera(self);

    ADOQuery1.Active := false ;
    ADOQuery1.Active := true ;

    DBGrid1.DataSource.DataSet.RecNo := Cod_Consulta_selecionada;
    LabelAtualizado(self);
  end
  else if (ADOQUERY_BUSCA_2.RecordCount=1)and(ADOQUERY_BUSCA_2COD_CONSULTA<>ADOQuery1COD_CONSULTA) then
  begin
    Application.MessageBox('Já existe uma consulta para este horário!', 'AVISO!', MB_ICONINFORMATION);
    MaskEdit2.SetFocus;
    Exit;
  end;


end;


procedure TForm_MARCA_CONSULTA.Image8Click(Sender: TObject);
begin

  Application.MessageBox('Ligue a impressora!', 'ATENÇÃO!', MB_ICONINFORMATION);
  PJ_CONS.Execute;

end;

procedure TForm_MARCA_CONSULTA.altera(Sender: TObject);
var
   dia_c, mes_c, ano_c , hora_c : string;
   Cod_Consulta_selecionada : integer;
   dia_cons, ano_cons, mes_cons, hora_cons, segundo : STRING;

begin

 dia_cons := Copy(MaskEdit1.Text,1,2);
 mes_cons := Copy(MaskEdit1.Text,4,2);
 ano_cons := Copy(MaskEdit1.Text,7,4);
 hora_cons := MaskEdit2.Text;

 dia_c := Copy(lbl_data.Caption,1,2);
 mes_c := Copy(lbl_data.Caption,4,2);
 ano_c := Copy(lbl_data.Caption,7,4);
 hora_c := Copy(lbl_data.Caption,14,8);

  with ADOStoredProc1.Parameters do
  begin
    ParamByName('@CODIGO').Value := ADOQuery1COD_CONSULTA.AsInteger;
    ParamByName('@DATAHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons  ;

    if Edit2.Text <> ADOQueryPacienteNOME_PACIENTE.AsString then
    begin
        ParamByName('@PACIENTE').Value := ADOQuery1PACIENTE_CONSULTA.AsInteger;
    end
    else
      ParamByName('@PACIENTE').Value := ADOQueryPacienteCOD_PACIENTE.AsInteger;
    if Edit3.Text <> ADOQueryDentistaNOME_DENTISTA.AsString then
    begin
        ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_CONSULTA.AsInteger;
    end
    else
      ParamByName('@DENTISTA').Value := ADOQueryDentistaCOD_DENTISTA.AsInteger;


    ParamByName('@TRATAMENTO').Value := DBLookupComboBox1.KeyValue;
    //ParamByName('@PREAGENDAMENTO').Value := ADOQuery1PREAGENDAMENTO_CONSULTA.Asinteger;
    ParamByName('@OBS').Value := Memo1.Lines.Text;
  end;

  if Application.MessageBox('Tem certeza que deseja alterar a consulta?','ATENÇÃO!', mb_iconquestion + mb_yesno) = idYes then
  begin
        ADOStoredProc1.ExecProc;
            with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
            begin
              CLOSE;
              Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
              OPEN;
            end;
            with GRAVA_LOG do
            begin
              Parameters.ParamByName('@DESCRICAO').Value := 'Consulta nº' + ADOQuery1COD_CONSULTA.AsString + ' alterada.' ;
              Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
              Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
              ExecProc;
            end;

             Label8.Visible :=    TRUE;
             Label9.Visible :=    TRUE;
             Label10.Visible :=   TRUE;
             Label11.Visible :=   TRUE;
             Label12.Visible :=   TRUE;
             Label13.Visible :=   TRUE;
             Edit1.Visible :=     FALSE;
             Edit2.Visible :=     FALSE;
             Edit3.Visible :=     FALSE;
             DBLookupComboBox1.Visible := FALSE;
             Memo1.Visible :=     FALSE;
             MaskEdit1.Visible := FALSE;
             MaskEdit2.Visible := FALSE;
             //Image7.Enabled := false;

            ADOQuery1.Active := false ;
            ADOQuery1.Active := true ;
  end
  else
  begin
             exit ;
  end;



end;

procedure TForm_MARCA_CONSULTA.Button1Click(Sender: TObject);
begin
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := -1;
    Edit8.Clear ;
    Edit8.Enabled := false;
end;

procedure TForm_MARCA_CONSULTA.imfClick(Sender: TObject);
begin
//Panel1.Visible := FALSE;
end;

end.
