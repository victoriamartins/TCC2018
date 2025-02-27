unit UNIT_PAGAMENTO_DENTISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, pngimage, Mask,
  DBCtrls, Menus, RpRave, RpDefine, RpCon, RpConDS;

type
  TFORM_PAGAMENTO_DENTISTA = class(TForm)
    Image6: TImage;
    Label2: TLabel;
    lbl_data: TLabel;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ALTERA_PAGAMENTO_DENTISTA: TADOStoredProc;
    ADOConnection1: TADOConnection;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    RadioGroup1: TRadioGroup;
    Image3: TImage;
    Image4: TImage;
    Image8: TImage;
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
    GRAVA_LOG: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    GRAVA_DESPESA: TADOStoredProc;
    PP_PAGAMENTO: TPopupMenu;
    REALIZARPAGAMENTO1: TMenuItem;
    IMTOP: TImage;
    RadioGroup2: TRadioGroup;
    Edit3: TEdit;
    Button1: TButton;
    im1: TImage;
    im2: TImage;
    EXCLUI_PAG_DENTISTA: TADOStoredProc;
    RadioGroup3: TRadioGroup;
    EXCLUI: TImage;
    ADOQuery1COD_PAGAMENTO: TAutoIncField;
    ADOQuery1COD_DENTISTA: TIntegerField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1VALOR_PAGAMENTO: TBCDField;
    ADOQuery1DATA_PAGAMENTO: TWideStringField;
    ADOQuery1STATUS_PAGAMENTO: TStringField;
    ADOQuery1DTHORACADASTRO_PAGAMENTO: TDateTimeField;
    RV_PAGA_DENT: TRvDataSetConnection;
    PJ_PAGA_DENT: TRvProject;
    procedure ADOQuery1STATUS_PAGAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure REALIZARPAGAMENTO1Click(Sender: TObject);
    procedure im1MouseEnter(Sender: TObject);
    procedure im2Click(Sender: TObject);
    procedure im2MouseLeave(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Image3Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure EXCLUIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_PAGAMENTO_DENTISTA: TFORM_PAGAMENTO_DENTISTA;

implementation

uses UNIT_GRAVA_PAGAMENTO_DENTISTA, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TFORM_PAGAMENTO_DENTISTA.LabelAtualizado(Sender: TObject);
var
  dia, mes, ano : string ;
BEGIN

  ano := Copy(ADOQuery1DATA_PAGAMENTO.AsString, 1, 4);
  mes := Copy(ADOQuery1DATA_PAGAMENTO.AsString, 6, 2);
  dia := Copy(ADOQuery1DATA_PAGAMENTO.AsString, 9, 2);
  Label3.Caption := ADOQuery1COD_PAGAMENTO.AsString;
    Edit1.Text := ADOQuery1COD_PAGAMENTO.AsString;
  Label5.Caption := ADOQuery1NOME_DENTISTA.AsString;
    DBLookupComboBox1.KeyValue := ADOQuery1COD_DENTISTA.AsInteger;
  Label8.Caption := dia + '/' + mes + '/' + ano ;
    MaskEdit1.Text :=  dia + '/' + mes + '/' + ano ;
  Label6.Caption := ADOQuery1VALOR_PAGAMENTO.AsString;
    Edit2.Text := ADOQuery1VALOR_PAGAMENTO.AsString;


  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = TRUE then
  begin
    RadioGroup1.ItemIndex := 0 ;
  end
  else if ADOQuery1STATUS_PAGAMENTO.AsBoolean = FALSE then
  begin
    RadioGroup1.ItemIndex := 1 ;
  end;

  Edit1.Visible := false ;
  Edit2.Visible := false ;
  MaskEdit1.Visible := false ;
  DBLookupComboBox1.Visible := false ;
  Label3.Visible := TRUE ;
  Label5.Visible := TRUE ;
  Label6.Visible := TRUE ;
  Label8.Visible := TRUE ;
    Image4.Enabled := false;

    RadioGroup1.Enabled := false ;

END;

procedure TFORM_PAGAMENTO_DENTISTA.RadioGroup2Click(Sender: TObject);
begin
    Edit3.Enabled := TRUE;
    Edit3.SetFocus;
    Button1.Enabled := TRUE;
end;

procedure TFORM_PAGAMENTO_DENTISTA.RadioGroup3Click(Sender: TObject);
var
   NOME, DATA : STRING;
begin
    NOME :=  'NOME_DENTISTA like '+ QuotedStr(Edit3.Text+'%') ;
    DATA :=  'DATA_PAGAMENTO like '+ QuotedStr(Edit3.Text+'%') ;

    if RadioGroup2.ItemIndex = -1 then //s� o MOSTRAR
    begin
              if RadioGroup3.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup3.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup3.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 0';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
              exit;
    end;

    if RadioGroup2.ItemIndex <> -1 then // o MOSTRAR e o FILTRAR
    begin
         if RadioGroup2.ItemIndex = 0 then
         Begin
              if RadioGroup3.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and ' + NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup3.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 1 and ' + NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup3.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 0 and ' + NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         end;

         if RadioGroup2.ItemIndex = 1 then
         Begin
              if RadioGroup3.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup3.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 1 and ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup3.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 0 and ' + DATA;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         end;
    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.REALIZARPAGAMENTO1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin

LabelAtualizado(self);

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
        with ALTERA_PAGAMENTO_DENTISTA.Parameters do
        begin
          ParamByName('@CODIGO_PAGAMENTO').Value := ADOQuery1COD_PAGAMENTO.AsInteger ;
          ParamByName('@CODIGO_DENT').Value := ADOQuery1COD_DENTISTA.AsInteger;
          ParamByName('@VALOR').Value := ADOQuery1VALOR_PAGAMENTO.AsFloat ;
          ParamByName('@DATA').Value := ADOQuery1DATA_PAGAMENTO.AsString;
          ParamByName('@STATUS').Value := '1';
        end;
        ALTERA_PAGAMENTO_DENTISTA.ExecProc;
            ADOQuery1.Active := false ;
            ADOQuery1.Active := true ;

                    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
                    begin
                      CLOSE;
                      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
                      OPEN;
                    end;

                    with GRAVA_LOG do
                    begin
                      Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento n� ' + Label3.Caption + ' pago.' ;
                      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                      ExecProc;
                    end;

            with GRAVA_DESPESA do
            begin
              Parameters.ParamByName('@TIPO').Value := 'PAG. DENTISTA' ;
              Parameters.ParamByName('@PRODUTO').Value := null ;
              Parameters.ParamByName('@PAG_FUNC').Value := null;
              Parameters.ParamByName('@PAG_DENT').Value := Label3.Caption;
              Parameters.ParamByName('@VALOR').Value := StrToFloat(label6.Caption);
              Parameters.ParamByName('@DATAPAGAMENTO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
              Parameters.ParamByName('@OBS').Value := '';
              Parameters.ParamByName('@DTHORACADASTRO_DESPESA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
              execProc;
            end;

                    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
                    begin
                      CLOSE;
                      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
                      OPEN;
                    end;

                    with GRAVA_LOG do
                    begin
                      Parameters.ParamByName('@DESCRICAO').Value := 'Despesa n� ' + IntToStr(GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrada.' ;
                      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
                      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
                      ExecProc;
                    end;

            with CAIXA_AUTOMATICO do
            begin
               Parameters.ParamByName('@DATA').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
               Parameters.ParamByName('@ENTRADA').Value := '0.00';
               Parameters.ParamByName('@SAIDA').Value := StrToFloat(label6.Caption) ;
               Parameters.ParamByName('@DTCADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c ;
               Parameters.ParamByName('@AVISTA').Value := NULL;
               Parameters.ParamByName('@APRAZO').Value := NULL;
               Parameters.ParamByName('@PARCELA').Value := NULL;
               Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value ;
               ExecProc;
            end;
            Application.MessageBox('Pagamento realizado!', 'ATEN��O!', MB_ICONINFORMATION);
    end;
  end;


end;

procedure TFORM_PAGAMENTO_DENTISTA.ADOQuery1STATUS_PAGAMENTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true then
  begin
    Text := 'PAGO';
  end;
  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false then
  begin
    Text := 'PENDENTE';
  end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.Button1Click(Sender: TObject);
begin
    Edit3.Enabled := FALSE;
    Edit3.Clear ;
    RadioGroup2.ItemIndex := -1;
    RadioGroup3.ItemIndex := 0;
    ADOQuery1.close;
    ADOQuery1.Active := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                          ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                          ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                          ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA  order by DATA_PAGAMENTO desc' ;
    ADOQuery1.Active := true;
    ADOQuery1.open;
end;

procedure TFORM_PAGAMENTO_DENTISTA.DBGrid1CellClick(Column: TColumn);
begin
  LabelAtualizado(SELF);
end;

procedure TFORM_PAGAMENTO_DENTISTA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_PAGAMENTO_DENTISTA.Edit3Change(Sender: TObject);
begin
Edit3.Enabled := true ;

    if RadioGroup3.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup2.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=   'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and NOME_DENTISTA like ' + QuotedStr(Edit3.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup2.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text :=   'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and DATA_PAGAMENTO like ' + QuotedStr(Edit3.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
    end

    else if RadioGroup3.ItemIndex <> -1 then// digitado o nome e se estiver MARCADOOOOO o MOSTRAR
    begin
          if RadioGroup3.ItemIndex=0 then //TODOS
          begin
                      if RadioGroup2.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and NOME_DENTISTA like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup2.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and DATA_PAGAMENTO like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup3.ItemIndex=1 then //PAGOS
          begin
                      if RadioGroup2.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 1 and ' +
                                                'NOME_DENTISTA like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup2.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 1 and ' +
                                                'DATA_PAGAMENTO like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup3.ItemIndex=2 then //PENDENTES
          begin
                      if RadioGroup2.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 0 and ' +
                                                'NOME_DENTISTA like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup2.ItemIndex = 1 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT COD_PAGAMENTO, TB_PAGAMENTO_DENTISTA.COD_DENTISTA, NOME_DENTISTA, VALOR_PAGAMENTO, DATA_PAGAMENTO,'+
                                        ' CASE STATUS_PAGAMENTO  WHEN 0 THEN '+QuotedStr('PENDENTE')+' WHEN 1 THEN '+QuotedStr('PAGO')+' END [STATUS_PAGAMENTO], DTHORACADASTRO_PAGAMENTO'+
                                        ' FROM TB_PAGAMENTO_DENTISTA, TB_DENTISTA '+
                                        ' WHERE TB_PAGAMENTO_DENTISTA.COD_DENTISTA=TB_DENTISTA.COD_DENTISTA and STATUS_PAGAMENTO = 0 and ' +
                                                'DATA_PAGAMENTO like ' + QuotedStr(Edit3.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.EXCLUIClick(Sender: TObject);
begin
    if Application.MessageBox('Tem certeza que deseja excluir o pagamento do dentista?','EXCLUIR', mb_iconquestion + mb_yesno) = idYes then
    begin
        EXCLUI_PAG_DENTISTA.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_PAGAMENTO.AsInteger;
        EXCLUI_PAG_DENTISTA.ExecProc;

        ADOQuery1.Active := FALSE;
        ADOQuery1.Active := TRUE;

        LabelAtualizado(Self);
    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ADOQuery1.Active := false;
   ADOQuery1.Active := true;

    Button1Click(self);
  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.FormShow(Sender: TObject);
begin

  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);

   ADOQuery1.Active := false;
   ADOQuery1.Active := true;

    Button1Click(self);
  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.im1MouseEnter(Sender: TObject);
begin
im2.Visible := true ;
end;

procedure TFORM_PAGAMENTO_DENTISTA.im2Click(Sender: TObject);
begin
UNIT_PAGAMENTO_DENTISTA.FORM_PAGAMENTO_DENTISTA.Close;
end;

procedure TFORM_PAGAMENTO_DENTISTA.im2MouseLeave(Sender: TObject);
begin
im2.Visible := false;
end;

procedure TFORM_PAGAMENTO_DENTISTA.Image2Click(Sender: TObject);
begin
  UNIT_GRAVA_PAGAMENTO_DENTISTA.FORM_GRAVA_PAGAMENTO_DENTISTA.ShowModal;
end;

procedure TFORM_PAGAMENTO_DENTISTA.Image3Click(Sender: TObject);
begin
     if (Edit1.Text = EmptyStr) then
    begin
        Application.MessageBox('Selecione um pagamento!', 'Aten��o!', MB_ICONEXCLAMATION);
        exit;
    end;




    if ADOQuery1STATUS_PAGAMENTO.AsSTRING = 'PAGO' then
    begin
        Application.MessageBox('N�o � poss�vel alterar um pagamento pago!', 'Aten��o!', MB_ICONWARNING);
    end

    else if ADOQuery1STATUS_PAGAMENTO.AsString = 'PENDENTE'  then
    begin
        LabelAtualizado(Self);

        Edit1.Visible := TRUE;
        Edit2.Visible := False;

        MaskEdit1.Visible := TRUE;

        DBLookupComboBox1.Visible := TRUE;

        //RadioGroup1.Enabled := TRUE;


        Label3.Visible := FALSE;
        Label8.Visible := FALSE;
        Label6.Visible := TRUE;
        Label5.Visible := FALSE;

        Image4.Enabled := true;
    end;
end;

procedure TFORM_PAGAMENTO_DENTISTA.Image4Click(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c : string;
  dia, mes, ano : string;
  Cod_pagamento_Selecionado : integer;
begin

  if (MaskEdit1.Text = '  /  /    ')or(MaskEdit1.Text = EmptyStr)then
  begin
    Application.MessageBox('Preencha o campo de data!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (MaskEdit1.Text = '0,00')or(MaskEdit1.Text = EmptyStr)then
  begin
    Application.MessageBox('Preencha o campo de valor!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;


 if Application.MessageBox('Tem certeza que deseja cadastrar a consulta?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
       dia := Copy(MaskEdit1.Text,1,2);
       mes := Copy(MaskEdit1.Text,4,2);
       ano := Copy(MaskEdit1.Text,7,4);

       dia_c := Copy(lbl_data.Caption,1,2);
       mes_c := Copy(lbl_data.Caption,4,2);
       ano_c := Copy(lbl_data.Caption,7,4);
       hora_c := Copy(lbl_data.Caption,14,8);

        with ALTERA_PAGAMENTO_DENTISTA.Parameters do
        begin
          ParamByName('@CODIGO_PAGAMENTO').Value := ADOQuery1COD_PAGAMENTO.AsInteger ;
          ParamByName('@CODIGO_DENT').Value := DBLookupComboBox1.KeyValue;
          ParamByName('@VALOR').Value := Edit2.Text ;
          ParamByName('@DATA').Value := ano + '-' + mes + '-' + dia ;
          ParamByName('@STATUS').Value := ADOQuery1STATUS_PAGAMENTO.AsBoolean;
        end;

         Cod_pagamento_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
         ALTERA_PAGAMENTO_DENTISTA.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento n� ' + ADOQuery1COD_PAGAMENTO.AsString + ' alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

    ADOQuery1.Active := false ;
    ADOQuery1.Active := true ;

    DBGrid1.DataSource.DataSet.RecNo := Cod_pagamento_Selecionado;
    LabelAtualizado(Self);

    Edit1.Visible := false ;
    Edit2.Visible := false ;
    MaskEdit1.Visible := false ;
    DBLookupComboBox1.Visible := false ;
    Image4.Enabled := false;
  end
  else
  begin
        Edit1.Visible := false;
        Edit2.Visible := False;

        MaskEdit1.Visible := false;

        DBLookupComboBox1.Visible := false;

        RadioGroup1.Enabled := false;

        Label3.Visible := TRUE;
        Label8.Visible := TRUE;
        Label6.Visible := TRUE;
        Label5.Visible := TRUE;

        Image4.Enabled := false;
  end;

end;

procedure TFORM_PAGAMENTO_DENTISTA.Image8Click(Sender: TObject);
begin

  ADOQuery1.Active:=FALSE;
  ADOQuery1.Active:=TRUE;
  Application.MessageBox('Ligue a impressora!', 'ATEN��O!', MB_ICONINFORMATION);
  PJ_PAGA_DENT.Execute;

end;

procedure TFORM_PAGAMENTO_DENTISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
