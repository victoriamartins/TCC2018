unit Unit_DESPESAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, pngimage, jpeg, DB, ADODB,
  DBCtrls, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_DESPESAS = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    Edit8: TEdit;
    Memo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1COD_DESPESA: TAutoIncField;
    ADOQuery1TIPO_DESPESA: TStringField;
    ADOQuery1PRODUTO_DESPESA: TIntegerField;
    ADOQuery1VALOR_DESPESA: TBCDField;
    ADOQuery1DATAPAGAMENTO_DESPESA: TWideStringField;
    ADOQuery1OBS_DESPESA: TMemoField;
    ADOQuery1DTHORACADASTRO_DESPESA: TDateTimeField;
    Label1: TLabel;
    Label12: TLabel;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Edit6: TEdit;
    Edit3: TEdit;
    DBGrid2: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    ADOQuery2COD_PRODUTO: TAutoIncField;
    ADOQuery2NOME_PRODUTO: TStringField;
    ADOQuery2NOME_DENTISTA: TStringField;
    ADOQuery2DENTISTA_PRODUTO: TIntegerField;
    ADOQuery2PRECOUNITARIO_PRODUTO: TBCDField;
    ADOQuery2TIPO_PRODUTO: TStringField;
    ADOQuery2VALIDADE_PRODUTO: TWideStringField;
    ADOQuery2DATAPAGAMENTO_PRODUTO: TWideStringField;
    ADOQuery2QUANTIA_PRODUTO: TIntegerField;
    ADOQuery2TOTAL_PRODUTO: TBCDField;
    ADOQuery2DTHORACADASTRO_PRODUTO: TDateTimeField;
    Image8: TImage;
    Timer1: TTimer;
    ADOQuery3: TADOQuery;
    ADOQuery3NOME_PRODUTO: TStringField;
    EXCLUI_DESPESA: TADOStoredProc;
    Image6: TImage;
    EXCLUI_CAIXA: TADOStoredProc;
    lbl_data: TLabel;
    GRAVA_LOG: TADOStoredProc;
    RV_DESPESA: TRvDataSetConnection;
    PJ_DESPESAS: TRvProject;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1OBS_DESPESAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Edit2MouseEnter(Sender: TObject);
    procedure Edit2MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_DESPESAS: TForm_DESPESAS;

implementation

uses UNIT_GRAVA_FINANCAS, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_DESPESAS.LabelAtualizado(Sender: TObject);
var
   ano, mes, dia: string;
begin
   ano:= Copy(ADOQuery1DATAPAGAMENTO_DESPESA.AsVariant,1,4);
   mes:= Copy(ADOQuery1DATAPAGAMENTO_DESPESA.AsVariant,6,2);
   dia:= Copy(ADOQuery1DATAPAGAMENTO_DESPESA.AsVariant,9,2);

   Label7.Caption:= IntToStr(ADOQuery1COD_DESPESA.AsInteger);
   Edit1.Text:= IntToStr(ADOQuery1COD_DESPESA.AsInteger);

   Label8.Caption:= ADOQuery1TIPO_DESPESA.AsString;

   if ADOQuery1PRODUTO_DESPESA.AsString <> '' then
   begin
       with ADOQuery3 do
       begin
         Close;
         Parameters.ParamByName('COD').Value := ADOQuery1PRODUTO_DESPESA.AsInteger;
         Open;
       end;
       Label12.Visible := TRUE ;
       Label1.Visible := TRUE ;
       Label12.Caption := ADOQuery3NOME_PRODUTO.AsString;
       Edit3.Text := ADOQuery3NOME_PRODUTO.AsString;
       DBGrid2.DataSource.DataSet.RecNo := ADOQuery3.Parameters.ParamByName('COD').Value ;
       //OK ShowMessage(ADOQuery3NOME_PRODUTO.AsString);
   end
   ELSE if ADOQuery1PRODUTO_DESPESA.AsString = '' then
   begin
     Edit3.Visible := false;
     Label12.Caption := 'N�O SE REFERE A PRODUTOS';
     Edit3.Clear;
   end;


   if ADOQuery1TIPO_DESPESA.AsString = 'ALUGUEL' then
   begin
      ComboBox1.ItemIndex:= 0;
   end

   else if ADOQuery1TIPO_DESPESA.AsString = '�GUA' then
   begin
      ComboBox1.ItemIndex:= 1;
   end

   else if ADOQuery1TIPO_DESPESA.AsString = 'LUZ' then
   begin
      ComboBox1.ItemIndex:= 2;
   end

   else if ADOQuery1TIPO_DESPESA.AsString = 'ENERGIA' then
   begin
      ComboBox1.ItemIndex:= 3;
   end

   else if ADOQuery1TIPO_DESPESA.AsString = 'PRODUTO' then
   begin
      ComboBox1.ItemIndex:= 4;
   end
   else
   begin
      ComboBox1.ItemIndex:= 5;
      Edit6.Text:= ADOQuery1TIPO_DESPESA.AsString;
   end;

   if (ComboBox1.ItemIndex = 5) and (Edit1.Visible = TRUE) then
   begin
       Edit6.Visible:= TRUE;
   end
   else
   begin
       Edit6.Visible:= FALSE;
   end;


   if (ComboBox1.ItemIndex = 4) and (Edit1.Visible = TRUE) then
   begin
       Edit3.Text:= ADOQuery2NOME_PRODUTO.AsString;
       Label1.Visible:= TRUE;
       Label12.Visible:= TRUE;
       Edit3.Visible:= TRUE;
       Label12.Caption:= ADOQuery2NOME_PRODUTO.AsString;
   end
   else if ComboBox1.ItemIndex = 4 then
   begin
       Edit3.Text:= ADOQuery2NOME_PRODUTO.AsString;
       Label1.Visible:= TRUE;
       Label12.Visible:= TRUE;
       Edit3.Visible:= FALSE;
       Label12.Caption:= ADOQuery2NOME_PRODUTO.AsString;
   end
   else
   begin
       Edit3.Visible:= FALSE;
       Label1.Visible:= FALSE;
       Label12.Visible:= FALSE;
   end;

   Label9.Caption := FloatToStr(ADOQuery1VALOR_DESPESA.AsFloat);
   Edit2.Text := FloatToStr(ADOQuery1VALOR_DESPESA.AsFloat);

   Label10.Caption := dia+'/'+mes+'/'+ano;
   MaskEdit1.Text := dia+'/'+mes+'/'+ano;

   Memo1.Lines.Text:= ADOQuery1OBS_DESPESA.AsString;

   if (Memo1.Lines.Text = '') and (Edit1.Visible = TRUE) then
   begin
       Label6.Visible := TRUE;
       Label11.Visible:= FALSE;
   end

   else if Memo1.Lines.Text = '' then
   begin
       Label6.Visible := FALSE;
       Label11.Visible:= FALSE;
   end

   else
   begin
      Label6.Visible := TRUE;
      Label11.Visible:= TRUE;
      Label11.Caption:= ADOQuery1OBS_DESPESA.AsString;
   end;
       Label1.Visible := TRUE;
    Label12.Visible := TRUE;

end;

procedure TForm_DESPESAS.ADOQuery1OBS_DESPESAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=Copy(ADOQuery1OBS_DESPESA.AsString,1,200);
end;

procedure TForm_DESPESAS.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := FALSE;
    Edit8.Clear;
    RadioGroup1.ItemIndex := - 1;
end;

procedure TForm_DESPESAS.Button2Click(Sender: TObject);
begin
    Label7.Visible := FALSE;
    Label8.Visible := FALSE;
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;

    ComboBox1.Visible := TRUE;

    MaskEdit1.Visible := true;

    Memo1.Visible := TRUE;
end;

procedure TForm_DESPESAS.Button3Click(Sender: TObject);
begin
    Label7.Visible := TRUE;
    Label8.Visible := TRUE;
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;

    ComboBox1.Visible := FALSE;

    MaskEdit1.Visible := false;

    Memo1.Visible := FALSE;
end;

procedure TForm_DESPESAS.ComboBox1Change(Sender: TObject);
begin
   if ComboBox1.ItemIndex = 5 then
   begin
       Edit6.Visible := TRUE;
   end

   else
   begin
       Edit6.Visible := FALSE;
   end;

   if ComboBox1.ItemIndex = 4 then
   begin
       Label1.Visible := TRUE;
       Edit3.Visible := TRUE;
   end

   else
   begin
       Label1.Visible := FALSE;
       Edit3.Visible := FALSE;
   end;

end;

procedure TForm_DESPESAS.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if key<>#13 then
   begin
      Key := #0;
   end;
end;

procedure TForm_DESPESAS.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(Self);
    Label1.Visible := TRUE;
    Label12.Visible := TRUE;
    if Label12.Caption = 'N�O SE REFERE A PRODUTOS' then
    begin
      ADOQuery3.Parameters.ParamByName('COD').Value := 0;
    end;

end;

procedure TForm_DESPESAS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_DESPESAS.DBGrid2CellClick(Column: TColumn);
begin
    Edit3.Text := ADOQuery2NOME_PRODUTO.AsString;
end;

procedure TForm_DESPESAS.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_DESPESAS.Edit2MouseEnter(Sender: TObject);
begin

  ShowHint := true ;

end;

procedure TForm_DESPESAS.Edit2MouseLeave(Sender: TObject);
begin

  ShowHint := false ;

end;

procedure TForm_DESPESAS.Edit8Change(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
    begin
        ADOQuery1.close;
        ADOQuery1.Active := false;
        ADOQuery1.SQL.Clear;
        ADOQuery1.sql.Text := 'SELECT * FROM TB_DESPESA where TIPO_DESPESA like '+ QuotedStr(Edit8.Text+'%') ;
        ADOQuery1.Active := true;
        ADOQuery1.open;
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
        ADOQuery1.close;
        ADOQuery1.Active := false;
        ADOQuery1.SQL.Clear;
        ADOQuery1.sql.Text := 'SELECT * FROM TB_DESPESA where DATAPAGAMENTO_DESPESA like '+ QuotedStr(Edit8.Text+'%');
        ADOQuery1.Active := true;
        ADOQuery1.open;
    end;
end;

procedure TForm_DESPESAS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;
    ADOQuery2.Active := FALSE;
    ADOQuery2.Active := TRUE;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0  then
    begin

        DBGrid1.DataSource.DataSet.RecNo := 1; // ativar depois

        if DBGrid2.DataSource.DataSet.RecordCount <> 0  then
        begin
          DBGrid2.DataSource.DataSet.RecNo := 1; //
        end;

        LabelAtualizado(self);
    end;
end;

procedure TForm_DESPESAS.FormCreate(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TForm_DESPESAS.FormShow(Sender: TObject);
begin

    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;
    ADOQuery2.Active := FALSE;
    ADOQuery2.Active := TRUE;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0  then
    begin

          DBGrid1.DataSource.DataSet.RecNo := 1; // ativar depois

        if DBGrid2.DataSource.DataSet.RecordCount <> 0  then
        begin
          DBGrid2.DataSource.DataSet.RecNo := 1; //
        end;
        LabelAtualizado(self);
    end;
end;

procedure TForm_DESPESAS.Image2MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TForm_DESPESAS.Image3Click(Sender: TObject);
begin
 Form_DESPESAS.Close;
end;

procedure TForm_DESPESAS.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible:=False;
end;

procedure TForm_DESPESAS.Image5Click(Sender: TObject);
begin

    Form_GRAVA_FINANCAS.ShowModal;

end;

procedure TForm_DESPESAS.Image6Click(Sender: TObject);
VAR
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if ADOQuery1PRODUTO_DESPESA.AsVariant <> null then
  begin
    Application.MessageBox('N�o � poss�vel excluir uma despesa que est� vinculada a um produto!', 'Aten��o!', MB_ICONMASK);
  end

  else if ADOQuery1PRODUTO_DESPESA.AsVariant = NULL then
  begin

    EXCLUI_DESPESA.Parameters.ParamByName('@CODIGO').Value := Edit1.Text ;
    EXCLUI_CAIXA.Parameters.ParamByName('@CODIGO').Value := Edit1.Text ;

    dia_c := Copy(lbl_data.Caption,1,2);
    mes_c := Copy(lbl_data.Caption,4,2);
    ano_c := Copy(lbl_data.Caption,7,4);
    hora_c := Copy(lbl_data.Caption,14,8);

      if Application.MessageBox('Tem certeza que deseja excluir a despesa?',
        'EXCLUIR', mb_iconquestion + mb_yesno) = idYes then
      begin
        EXCLUI_CAIXA.ExecProc;
        EXCLUI_DESPESA.ExecProc;
        Application.MessageBox('Despesa exclu�da!', 'EXCLUIR', MB_ICONEXCLAMATION);

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;
        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Despesa exclu�da.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

      end;

      ADOQuery1.Active := FALSE ;
      ADOQuery1.Active := TRUE  ;
      ADOQuery2.Active := FALSE ;
      ADOQuery2.Active := TRUE  ;

  end;



end;

procedure TForm_DESPESAS.Image7Click(Sender: TObject);
var
     dia, mes, ano : string;
begin
{
    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do c�digo!', 'Aten��o!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if ComboBox1.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do tipo de despesa!', 'Aten��o!', MB_ICONWARNING);
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do valor!', 'Aten��o!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if MaskEdit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo da data de pagamento!', 'Aten��o!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end;

//CADASTRO

    ALTERA_DESPESA.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);

    if ComboBox1.ItemIndex = 0 then
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ALUGUEL';
        ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
    end

    else if ComboBox1.ItemIndex = 1 then
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := '�GUA';
        ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
    end

    else if ComboBox1.ItemIndex = 2 then
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'LUZ';
        ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
    end

    else if ComboBox1.ItemIndex = 3 then
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'ENERGIA';
        ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
    end

    else if ComboBox1.ItemIndex = 4 then
    begin
        if Edit3.Text = '' then
        begin
            Application.MessageBox('Selecione um produto na tabela de produtos!', 'Aten��o!', MB_ICONWARNING);
            Exit;
        end
        else
        begin
            ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := 'PRODUTO';
            ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := ADOQuery2COD_PRODUTO.AsInteger;
        end;
    end

    else if ComboBox1.ItemIndex = 5 then
    begin
        if Edit6.Text = '' then
        begin
            Application.MessageBox('Preencha o campo do tipo de despesa!', 'Aten��o!', MB_ICONWARNING);
            Edit6.SetFocus;
            Exit;
        end

        else
        begin
            ALTERA_DESPESA.Parameters.ParamByName('@TIPO').Value := Edit6.Text;
            ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
        end;
    end;


    if Label12.Caption = 'N�O SE REFERE A PRODUTOS' then
    begin
            ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := NULL;
    end
    else
    begin
            ALTERA_DESPESA.Parameters.ParamByName('@PRODUTO').Value := ADOQuery2COD_PRODUTO.AsInteger;
    end;


    ALTERA_DESPESA.Parameters.ParamByName('@VALOR').Value := StrToFloat(Edit2.Text);

    dia := Copy(MaskEdit1.Text,1,2);
    mes := Copy(MaskEdit1.Text,4,2);
    ano := Copy(MaskEdit1.Text,7,4);

    ALTERA_DESPESA.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano +'-'+ mes +'-'+ dia;

    if Memo1.Lines.Text = '' then
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@OBS').Value:= NULL;
    end
    else
    begin
        ALTERA_DESPESA.Parameters.ParamByName('@OBS').Value:= Memo1.Lines.Text;
    end;


    if Application.MessageBox('Tem certeza que deseja alterar a despesa?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
        ALTERA_DESPESA.ExecProc;
        Application.MessageBox('Despesa alterada!', 'AVISO', MB_OK)
    end

    else
    begin
        Exit;
    end;

    //ATUALIZANDO OS LABELS

    ADOQuery1.Active:= FALSE;
    ADOQuery1.Active:= TRUE;

    LabelAtualizado(Self);

    Label1.Visible := FALSE;
    Label7.Visible := TRUE;
    Label8.Visible := TRUE;
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;
    Label12.Visible := FALSE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit6.Visible := FALSE;

    ComboBox1.Visible := FALSE;

    MaskEdit1.Visible := FALSE;

    Memo1.Visible := FALSE;
}
end;


procedure TForm_DESPESAS.Image8Click(Sender: TObject);
begin
PJ_DESPESAS.Execute;
end;

procedure TForm_DESPESAS.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;

end;

procedure TForm_DESPESAS.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
