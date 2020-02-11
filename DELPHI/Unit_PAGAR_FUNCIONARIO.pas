unit Unit_PAGAR_FUNCIONARIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, pngimage, jpeg, ADODB, DB, Mask,
  DBCtrls, Menus, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_PAG_FUNCIONARIO = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    RadioGroup1: TRadioGroup;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid2: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ALTERA_PAGAMENTO_FUNCIONARIO: TADOStoredProc;
    ADOQuery1COD_PAGAMENTO: TAutoIncField;
    ADOQuery1COD_FUNCIONARIO_PAGAMENTO: TIntegerField;
    ADOQuery1NOME_FUNCIONARIO: TStringField;
    ADOQuery1VALORFIXO_PAGAMENTO: TBCDField;
    ADOQuery1VALOREXTRA_PAGAMENTO: TBCDField;
    ADOQuery1TOTAL_PAGAMENTO: TBCDField;
    ADOQuery1DATA_PAGAMENTO: TWideStringField;
    ADOQuery1STATUS_PAGAMENTO: TBooleanField;
    ADOQuery1DTHORACADASTRO_PAGAMENTO: TDateTimeField;
    RadioGroup2: TRadioGroup;
    ADOQuery2COD_FUNCIONARIO: TAutoIncField;
    ADOQuery2NOME_FUNCIONARIO: TStringField;
    ADOQuery2SEXO_FUNCIONARIO: TStringField;
    ADOQuery2NASCIMENTO_FUNCIONARIO: TWideStringField;
    ADOQuery2RG_FUNCIONARIO: TStringField;
    ADOQuery2CPF_FUNCIONARIO: TStringField;
    ADOQuery2ENDERECO_FUNCIONARIO: TStringField;
    ADOQuery2EMAIL_FUNCIONARIO: TStringField;
    ADOQuery2CIDADE_FUNCIONÁRIO: TIntegerField;
    ADOQuery2TEL1_FUNCIONARIO: TStringField;
    ADOQuery2TEL2_FUNCIONARIO: TStringField;
    ADOQuery2STATUS_FUNCIONARIO: TBooleanField;
    ADOQuery2DTHORACADASTRO_FUNCIONARIO: TDateTimeField;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label14: TLabel;
    Image5: TImage;
    Image8: TImage;
    lbl_data: TLabel;
    Timer1: TTimer;
    GRAVA_LOG: TADOStoredProc;
    PopupMenu1: TPopupMenu;
    PAGAR1: TMenuItem;
    PAGAR: TADOStoredProc;
    GRAVA_DESPESA: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    EXCLUI: TImage;
    EXCLUSAO: TADOStoredProc;
    PAGA_FUNCIONARIO: TADOStoredProc;
    RV_PAG_FUNC: TRvDataSetConnection;
    RV_PAG_FUNC_PEND: TRvDataSetConnection;
    PJ_PAG_FUNC_PEND: TRvProject;
    PENDENTES: TADOQuery;
    PJ_PAGA_FUNC: TRvProject;
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Image5Click(Sender: TObject);
    procedure PAGAR1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure EXCLUIClick(Sender: TObject);
    procedure ADOQuery1STATUS_PAGAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery2STATUS_FUNCIONARIOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PAG_FUNCIONARIO: TForm_PAG_FUNCIONARIO;

implementation

uses UNIT_GRAVA_PAGAMENTO_FUNCIONARIO, Unit_TELA_PRINCIPAL, UNIT_CAIXA;

{$R *.dfm}

procedure TForm_PAG_FUNCIONARIO.LabelAtualizado(Sender: TObject);
var
   dia, mes, ano: STRING;
begin

    ano := Copy(   ADOQuery1DATA_PAGAMENTO.AsString,1,4   );
    mes := Copy(   ADOQuery1DATA_PAGAMENTO.AsString,6,2   );
    dia := Copy(   ADOQuery1DATA_PAGAMENTO.AsString,9,2   );

    Label9.Caption := IntToStr(ADOQuery1COD_PAGAMENTO.AsInteger);
    Label10.Caption := ADOQuery1NOME_FUNCIONARIO.AsString;
    Label11.Caption := FloatToStr(ADOQuery1VALORFIXO_PAGAMENTO.AsFloat);
    Label12.Caption := FloatToStr(ADOQuery1VALOREXTRA_PAGAMENTO.AsFloat);
    Label13.Caption := FloatToStr(ADOQuery1TOTAL_PAGAMENTO.AsFloat);
    Label14.Caption := dia + '/' + mes + '/' + ano;

    Edit1.Text := IntToStr(ADOQuery1COD_PAGAMENTO.AsInteger);
    Edit2.Text := ADOQuery1NOME_FUNCIONARIO.AsString;
    Edit3.Text := FloatToStr(ADOQuery1VALORFIXO_PAGAMENTO.AsFloat);
    Edit4.Text := FloatToStr(ADOQuery1VALOREXTRA_PAGAMENTO.AsFloat);
    Edit5.Text := FloatToStr(ADOQuery1TOTAL_PAGAMENTO.AsFloat);
    MaskEdit1.Text := dia + '/' + mes + '/' + ano;

    Edit1.Visible := false ;
    Edit2.Visible := false ;
    Edit3.Visible := false ;
    Edit4.Visible := false ;
    Edit5.Visible := false ;
    MaskEdit1.Visible := false ;
    Label9.Visible := true ;
    Label10.Visible := true ;
    Label11.Visible := true ;
    Label12.Visible := true ;
    Label13.Visible := true ;
    Label14.Visible := TRUE ;
    Image7.Enabled := false ;
end;


procedure TForm_PAG_FUNCIONARIO.PAGAR1Click(Sender: TObject);
var
ano, mes, dia : string ;
ano_c, mes_c, dia_c, hora_c : string ;
begin

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean=FALSE then
  begin
    PAGAR.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_PAGAMENTO.AsInteger;
     if Application.MessageBox('Tem certeza que deseja pagar?','ATENÇÃO!', mb_iconquestion + mb_yesno) = idYes then
     begin
       pagar.ExecProc;
       Application.MessageBox('Pagamento realizado!', 'ATENÇÃO!', MB_ICONINFORMATION);
          with GRAVA_DESPESA do
          begin
            Parameters.ParamByName('@TIPO').Value := 'PAG. DE FUNCIONÁRIO';
            Parameters.ParamByName('@PRODUTO').Value := NULL;
            Parameters.ParamByName('@PAG_FUNC').Value := ADOQuery1COD_PAGAMENTO.AsInteger ;
            Parameters.ParamByName('@PAG_DENT').Value := NULL;
            Parameters.ParamByName('@VALOR').Value := ADOQuery1TOTAL_PAGAMENTO.AsFloat ;
            Parameters.ParamByName('@DATAPAGAMENTO').Value := ADOQuery1DATA_PAGAMENTO.AsString ;
            Parameters.ParamByName('@OBS').Value := '';
            Parameters.ParamByName('@DTHORACADASTRO_DESPESA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;
          with CAIXA_AUTOMATICO do
          begin
            Parameters.ParamByName('@DATA').Value :=  ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@ENTRADA').Value := '0.00';
            Parameters.ParamByName('@SAIDA').Value := ADOQuery1TOTAL_PAGAMENTO.AsFloat ;
            Parameters.ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            Parameters.ParamByName('@AVISTA').Value := null;
            Parameters.ParamByName('@APRAZO').Value := null;
            Parameters.ParamByName('@PARCELA').Value := null;
            Parameters.ParamByName('@DESPESA').Value := GRAVA_DESPESA.Parameters.ParamByName('@RETURN_VALUE').Value ;
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
            Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento de func. nº ' + Edit1.Text + ' pago.' ;
            Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
            Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;


          ADOQuery1.Active := FALSE ;
          ADOQuery1.Active := TRUE ;

     end;
  end
  else
  begin
    Application.MessageBox('Já está pago!', 'ATENÇÃO!', MB_ICONINFORMATION);
    exit;
  end;

  UNIT_CAIXA.FORM_CAIXA.ADOQUERY_CAIXA.Active := FALSE ;
  UNIT_CAIXA.FORM_CAIXA.ADOQUERY_CAIXA.Active := TRUE ;
  UNIT_CAIXA.FORM_CAIXA.ADOQUERY_CAIXA_DATA.Active := FALSE ;
  UNIT_CAIXA.FORM_CAIXA.ADOQUERY_CAIXA_DATA.Active := TRUE ;
end;

procedure TForm_PAG_FUNCIONARIO.ADOQuery1STATUS_PAGAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true then
  begin
    Text := 'PAGO';
  end;
  if ADOQuery1STATUS_PAGAMENTO.AsBoolean = FALSE then
  begin
    Text := 'PENDENTE';
  end;

end;

procedure TForm_PAG_FUNCIONARIO.ADOQuery2STATUS_FUNCIONARIOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQuery2STATUS_FUNCIONARIO.AsBoolean = true  then
  begin
    Text := 'ATIVO';
  end
  else
  begin
    Text := 'INATIVO';
  end;

end;

procedure TForm_PAG_FUNCIONARIO.Button2Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0;
     ADOQuery1.close;
    ADOQuery1.Active := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
                          'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                          'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO order by DATA_PAGAMENTO desc';
    ADOQuery1.Active := true;
    ADOQuery1.open;

    end;

procedure TForm_PAG_FUNCIONARIO.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(Self);
end;

procedure TForm_PAG_FUNCIONARIO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_PAG_FUNCIONARIO.DBGrid2CellClick(Column: TColumn);
begin
    Edit2.Text := ADOQuery2NOME_FUNCIONARIO.AsString;
end;

procedure TForm_PAG_FUNCIONARIO.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_PAG_FUNCIONARIO.Edit8Change(Sender: TObject);
begin
    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                  'and NOME_FUNCIONARIO like ' + QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                  'and TOTAL_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                  'and DATA_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%');
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
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and NOME_FUNCIONARIO like ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and TOTAL_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and DATA_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%');
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end

          else if RadioGroup2.ItemIndex=1 then //ATIVOS
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and NOME_FUNCIONARIO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 1';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and TOTAL_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 1 ';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and DATA_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 1 ';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end

          else if RadioGroup2.ItemIndex=2 then //INATIVOS
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and NOME_FUNCIONARIO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 0 ';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and TOTAL_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 0 ';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                            'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                                'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ' +
                                                'and DATA_PAGAMENTO like ' + QuotedStr(Edit8.Text+'%') + ' and STATUS_PAGAMENTO = 0 ';
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TForm_PAG_FUNCIONARIO.EXCLUIClick(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c : string ;
begin

  EXCLUSAO.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_PAGAMENTO.AsInteger ;

   dia_c := Copy(lbl_data.Caption,1,2);
   mes_c := Copy(lbl_data.Caption,4,2);
   ano_c := Copy(lbl_data.Caption,7,4);
   hora_c := Copy(lbl_data.Caption,14,8);

  if Application.MessageBox('Tem certeza que deseja excluir o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
     EXCLUSAO.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento de funcionário excluído.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;

        ADOQuery1.Active := false ;
        ADOQuery1.Active := true  ;
        end;

  end;

end;

procedure TForm_PAG_FUNCIONARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    ADOQuery1.Active := false;
    ADOQuery1.Active := true;
    ADOQuery2.Active := false;
    ADOQuery2.Active := true;

    Button2Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      DBGrid2.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;
end;

procedure TForm_PAG_FUNCIONARIO.FormShow(Sender: TObject);
begin

    ADOQuery1.Active := false;
    ADOQuery1.Active := true;
    ADOQuery2.Active := false;
    ADOQuery2.Active := true;

    Button2Click(self);

    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      DBGrid2.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;
end;

procedure TForm_PAG_FUNCIONARIO.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TForm_PAG_FUNCIONARIO.Image3Click(Sender: TObject);
begin
 Form_PAG_FUNCIONARIO.Close;
end;

procedure TForm_PAG_FUNCIONARIO.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TForm_PAG_FUNCIONARIO.Image5Click(Sender: TObject);
begin
UNIT_GRAVA_PAGAMENTO_FUNCIONARIO.FORM_GRAVA_PAGAMENTO_FUNCIONARIO.ShowModal;
end;

procedure TForm_PAG_FUNCIONARIO.Image6Click(Sender: TObject);
begin
    if Edit2.Text= EmptyStr then
    begin
      Application.MessageBox('Selecione um pagamento!', 'ATENÇÃO!', MB_ICONEXCLAMATION);
      exit;
    end;





    if ADOQuery1STATUS_PAGAMENTO.AsBoolean = true then
    begin
      Application.MessageBox('Não pode ser alterado, pois está pago!', 'AVISO!', MB_ICONINFORMATION);
      exit;
    end
    else if ADOQuery1STATUS_PAGAMENTO.AsBoolean = false then
    begin
      Label9.Visible := False;
      Label10.Visible := False;
      Label11.Visible := True;
      Label12.Visible := True;
      Label13.Visible := True;
      Label14.Visible := False;

      Edit1.Visible := True;
      Edit2.Visible := True;
      //Edit3.Visible := True;
      //Edit4.Visible := True;
      //Edit5.Visible := True;
      MaskEdit1.Visible := True;
      Image7.Enabled := TRUE ;
    end;
end;

procedure TForm_PAG_FUNCIONARIO.Image7Click(Sender: TObject);
var
   dia, mes, ano: string;
     dia_c , mes_c , ano_c , hora_c : STRING;
  Cod_Funcionario_Selecionado : integer;
begin
    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do código!', 'Atenção!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Selecione um funcionário na tabela de funcionários!', 'Atenção!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do salário!', 'Atenção!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if Edit4.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do extra', 'Atenção!', MB_ICONWARNING);
        Edit4.SetFocus;
        Exit;
    end

    else if Edit5.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do total!', 'Atenção!', MB_ICONWARNING);
        Edit5.SetFocus;
        Exit;
    end

    else if MaskEdit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo da data de pagamento!', 'Atenção!', MB_ICONWARNING);
        MaskEdit1.SetFocus;
        Exit;
    end;


     if Application.MessageBox('Tem certeza que deseja alterar o funcionário?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
     begin
        dia_c := Copy(lbl_data.Caption,1,2);
        mes_c := Copy(lbl_data.Caption,4,2);
        ano_c := Copy(lbl_data.Caption,7,4);
        hora_c := Copy(lbl_data.Caption,14,8);
        dia := Copy(MaskEdit1.Text,1,2);
        mes := Copy(MaskEdit1.Text,4,2);
        ano := Copy(MaskEdit1.Text,7,4);

        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@COD_FUNCIONARIO').Value := ADOQuery2COD_FUNCIONARIO.AsInteger;
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_FIXO').Value := StrToFloat(Edit3.Text);
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@VALOR_EXTRA').Value := StrToFloat(Edit4.Text);
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@TOTAL').Value := StrToFloat(Edit5.Text);
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@DATA').Value := ano +'-'+ mes +'-'+ dia;
        ALTERA_PAGAMENTO_FUNCIONARIO.Parameters.ParamByName('@STATUS').Value := ADOQuery1STATUS_PAGAMENTO.AsBoolean;

        Cod_Funcionario_Selecionado := DBGrid1.DataSource.DataSet.RecNo;
        ALTERA_PAGAMENTO_FUNCIONARIO.ExecProc;

                with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento nº ' + Edit1.Text + ' alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

        Application.MessageBox('Funcionário alterado!', 'AVISO', MB_OK)
    end

    else
    begin

        Label9.Visible := TRUE;
        Label10.Visible := TRUE;
        Label11.Visible := TRUE;
        Label12.Visible := TRUE;
        Label13.Visible := TRUE;
        Label14.Visible := TRUE;

        Edit1.Visible := FALSE;
        Edit2.Visible := FALSE;
        Edit3.Visible := FALSE;
        Edit4.Visible := FALSE;
        Edit5.Visible := FALSE;
        MaskEdit1.Visible := FALSE;

        Image7.Enabled := false ;
    end;



    //ATUALIZANDO OS LABELS

    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;
    LabelAtualizado(Self);
    DBGrid1.DataSource.DataSet.RecNo := Cod_Funcionario_Selecionado;

    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;
    Label14.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;
    MaskEdit1.Visible := FALSE;

    Image7.Enabled := false ;
end;

procedure TForm_PAG_FUNCIONARIO.Image8Click(Sender: TObject);
begin


    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    PJ_PAGA_FUNC.Execute;



end;

procedure TForm_PAG_FUNCIONARIO.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_PAG_FUNCIONARIO.RadioGroup2Click(Sender: TObject);
var
   FUNC, TOTAL, DATA: STRING;
begin
    FUNC :=  'NOME_FUNCIONARIO like '+ QuotedStr(Edit8.Text+'%') ;
    TOTAL :=  'TOTAL_PAGAMENTO like '+ QuotedStr(Edit8.Text+'%') ;
    DATA :=   'DATA_PAGAMENTO like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup2.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO ';
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end

        else if RadioGroup2.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO and STATUS_PAGAMENTO = 1 ';
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end

        else if RadioGroup2.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO  and STATUS_PAGAMENTO = 0 ';
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else
             exit;
    end

    else if RadioGroup1.ItemIndex <> -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin

        if RadioGroup1.ItemIndex = 0 then
        begin
            if RadioGroup2.ItemIndex = 0 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO and ' + FUNC;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 1 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                      'COD_FUNCIONARIO and STATUS_PAGAMENTO = 1 and ' + FUNC;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 2 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                      'COD_FUNCIONARIO and STATUS_PAGAMENTO = 0 and ' + FUNC;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end
            else
                exit;
        end;

        if RadioGroup1.ItemIndex = 1 then
        begin
            if RadioGroup2.ItemIndex = 0 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO and ' + TOTAL;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 1 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                      'COD_FUNCIONARIO and STATUS_PAGAMENTO = 1 and ' + TOTAL;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 2 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                                  'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                      'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                      'COD_FUNCIONARIO and STATUS_PAGAMENTO = 0 and ' + TOTAL;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end
            else
                exit;
        end;

        if RadioGroup1.ItemIndex = 2 then
        begin
            if RadioGroup2.ItemIndex = 0 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = COD_FUNCIONARIO and ' + DATA;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 1 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                  'COD_FUNCIONARIO and STATUS_PAGAMENTO = 1 and ' + DATA;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end

            else if RadioGroup2.ItemIndex = 2 then
            begin
                ADOQuery1.close;
                ADOQuery1.Active := false;
                ADOQuery1.SQL.Clear;
                ADOQuery1.sql.Text := 'select	COD_PAGAMENTO, COD_FUNCIONARIO_PAGAMENTO, NOME_FUNCIONARIO, VALORFIXO_PAGAMENTO, VALOREXTRA_PAGAMENTO, ' +
		                              'TOTAL_PAGAMENTO, DATA_PAGAMENTO, STATUS_PAGAMENTO, DTHORACADASTRO_PAGAMENTO ' +
                                  'from	TB_FUNCIONARIO, TB_PAGAMENTO_FUNCIONARIO where COD_FUNCIONARIO_PAGAMENTO = ' +
                                  'COD_FUNCIONARIO and STATUS_PAGAMENTO = 0 and ' + DATA;
                ADOQuery1.Active := true;
                ADOQuery1.open;
            end
            else
                exit;
        end;
    end;
    end;
procedure TForm_PAG_FUNCIONARIO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
