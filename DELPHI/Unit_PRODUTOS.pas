unit Unit_PRODUTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Mask, pngimage, jpeg, DB, ADODB,
  DBCtrls, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_PRODUTOS = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    RadioGroup1: TRadioGroup;
    Edit8: TEdit;
    Edit4: TEdit;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label14: TLabel;
    Edit5: TEdit;
    Label15: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label17: TLabel;
    Edit6: TEdit;
    Label1: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    ADOQuery1COD_PRODUTO: TAutoIncField;
    ADOQuery1NOME_PRODUTO: TStringField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1DENTISTA_PRODUTO: TIntegerField;
    ADOQuery1PRECOUNITARIO_PRODUTO: TBCDField;
    ADOQuery1TIPO_PRODUTO: TStringField;
    ADOQuery1VALIDADE_PRODUTO: TWideStringField;
    ADOQuery1DATAPAGAMENTO_PRODUTO: TWideStringField;
    ADOQuery1QUANTIA_PRODUTO: TIntegerField;
    ADOQuery1TOTAL_PRODUTO: TBCDField;
    ADOQuery1DTHORACADASTRO_PRODUTO: TDateTimeField;
    ADOQuery2: TADOQuery;
    ADOConnection1: TADOConnection;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    ADOQuery2COD_DENTISTA: TAutoIncField;
    ADOQuery2NOME_DENTISTA: TStringField;
    ADOQuery2SEXO_DENTISTA: TStringField;
    ADOQuery2CRO_DENTISTA: TStringField;
    ADOQuery2EMAIL_DENTISTA: TStringField;
    ADOQuery2STATUS_DENTISTA: TStringField;
    ADOQuery2DTHORACADASTRO_DENTISTA: TDateTimeField;
    ALTERA_PRODUTO: TADOStoredProc;
    ALTERA_PRODUTO_CX_DP: TADOStoredProc;
    RV_ESTOQUE: TRvDataSetConnection;
    PJ_ESTOQUE: TRvProject;
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure AtualizaLabel(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PRODUTOS: TForm_PRODUTOS;

implementation

uses UNIT_GRAVA_FINANCAS, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_PRODUTOS.AtualizaLabel(Sender: TObject);
var
   ano, mes, dia: string;
begin
   {
   if Edit2.Text = EmptyStr then
   begin
     Application.MessageBox('Adicione um produto!','ATENÇÃO!',MB_ICONEXCLAMATION)     ;
     exit;
   end;
   }




   if ADOQuery1VALIDADE_PRODUTO.AsVariant = NULL then
   BEGIN
     Label11.Caption := 'SEM VALIDADE';
     MaskEdit1.Text := '';
   END
   else
   BEGIN
    ano:= Copy(ADOQuery1VALIDADE_PRODUTO.AsVariant,1,4);
    mes:= Copy(ADOQuery1VALIDADE_PRODUTO.AsVariant,6,2);
    dia:= Copy(ADOQuery1VALIDADE_PRODUTO.AsVariant,9,2);
    Label11.Caption := dia+'/'+mes+'/'+ano;
    MaskEdit1.Text := dia+'/'+mes+'/'+ano;
   END;




    Label8.Caption := IntToStr(ADOQuery1COD_PRODUTO.AsInteger);
    Edit1.Text :=  IntToStr(ADOQuery1COD_PRODUTO.AsInteger);
    Label9.Caption := ADOQuery1NOME_PRODUTO.AsString;
    Edit2.Text := ADOQuery1NOME_PRODUTO.AsString;
    Label10.Caption := FloatToStr(ADOQuery1PRECOUNITARIO_PRODUTO.AsFloat);
    Edit3.Text := FloatToStr(ADOQuery1PRECOUNITARIO_PRODUTO.AsFloat);
    Label19.Caption := ADOQuery1NOME_DENTISTA.AsString;

    if ADOQuery1TIPO_PRODUTO.AsString = 'ALIMENTO' then
    begin
        ComboBox1.ItemIndex := 0;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'ANESTÉSICO' then
    begin
        ComboBox1.ItemIndex := 1;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'CLAREADOR' then
    begin
        ComboBox1.ItemIndex := 2;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'DESCARTÁVEIS' then
    begin
        ComboBox1.ItemIndex := 3;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'HIGIENE' then
    begin
        ComboBox1.ItemIndex := 4;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'INSTRUMENTO' then
    begin
        ComboBox1.ItemIndex := 5;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'LIMPEZA' then
    begin
        ComboBox1.ItemIndex := 6;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'MEDICAMENTO' then
    begin
        ComboBox1.ItemIndex := 7;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else if ADOQuery1TIPO_PRODUTO.AsString = 'RESINA' then
    begin
        ComboBox1.ItemIndex := 8;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end

    else
    begin
        ComboBox1.ItemIndex := 9;
        Edit6.Text := ADOQuery1TIPO_PRODUTO.AsString;
        Label12.Caption:= ADOQuery1TIPO_PRODUTO.AsString;
    end;


    //Label11.Caption := dia+'/'+mes+'/'+ano;
    //MaskEdit1.Text := dia+'/'+mes+'/'+ano;
    Label13.Caption := IntToStr(ADOQuery1QUANTIA_PRODUTO.AsInteger);
    Edit4.Text := IntToStr(ADOQuery1QUANTIA_PRODUTO.AsInteger);
    Label15.Caption := FloatToStr(ADOQuery1TOTAL_PRODUTO.AsFloat);
    Edit5.Text := FloatToStr(ADOQuery1TOTAL_PRODUTO.AsFloat);

    DBLookupComboBox1.KeyValue:= ADOQuery1DENTISTA_PRODUTO.AsInteger;

////////////////////////

    Label8.Visible := TRUE;
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;
    Label15.Visible := TRUE;
    Label17.Visible := FALSE;
    Label19.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;
    Edit6.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;
    ComboBox1.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    Image7.Enabled := false;

end;

procedure TForm_PRODUTOS.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1;
end;




procedure TForm_PRODUTOS.ComboBox1Change(Sender: TObject);
begin
   if ComboBox1.ItemIndex = 9 then
   begin
        Label17.Visible := TRUE;
        Edit6.Visible := TRUE;
   end
   else
   begin
        Label17.Visible := FALSE;
        Edit6.Visible := FALSE;
   end;
end;

procedure TForm_PRODUTOS.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key<>#13 then
    begin
        Key := #0;
    end;
end;

procedure TForm_PRODUTOS.DBGrid1CellClick(Column: TColumn);
begin
   AtualizaLabel(Self);


end;

procedure TForm_PRODUTOS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_PRODUTOS.Edit3Change(Sender: TObject);
var
   p, t: real;
   q: integer;
begin
    if (Edit3.Text <> '') and (Edit4.Text <> '') then
    begin
        p:= StrToFloat(Edit3.Text);
        q:= StrToInt(Edit4.Text);
    end

    else
    begin
       p:= 0;
       q:= 0;
    end;
    t:= p * q;

    Edit5.Text:= FloatToStr(t);
end;


procedure TForm_PRODUTOS.Edit4Change(Sender: TObject);
var
   p, t: Double;
   q: integer;
begin
    if (Edit3.Text <> '') and (Edit4.Text <> '') then
    begin
       p:= StrToFloat(Edit3.Text);
       q:= StrToInt(Edit4.Text);
    end

    else
    begin
       p:= 0;
       q:= 0;
    end;
    t:= p * q;

    Edit5.Text:= FloatToStr(t);
end;

procedure TForm_PRODUTOS.Edit8Change(Sender: TObject);
begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'SELECT COD_PRODUTO, NOME_PRODUTO, NOME_DENTISTA,DENTISTA_PRODUTO, PRECOUNITARIO_PRODUTO, TIPO_PRODUTO, ' +
                                  'VALIDADE_PRODUTO, DATAPAGAMENTO_PRODUTO, QUANTIA_PRODUTO, TOTAL_PRODUTO, DTHORACADASTRO_PRODUTO FROM TB_PRODUTO, ' +
                                  'TB_DENTISTA where DENTISTA_PRODUTO = COD_DENTISTA and NOME_PRODUTO like '+ QuotedStr(Edit8.Text+'%');
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end

        else if RadioGroup1.ItemIndex = 1 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'SELECT COD_PRODUTO, NOME_PRODUTO, NOME_DENTISTA, DENTISTA_PRODUTO, PRECOUNITARIO_PRODUTO, TIPO_PRODUTO, ' +
                                  'VALIDADE_PRODUTO, DATAPAGAMENTO_PRODUTO, QUANTIA_PRODUTO, TOTAL_PRODUTO, DTHORACADASTRO_PRODUTO FROM TB_PRODUTO, ' +
                                  'TB_DENTISTA where  DENTISTA_PRODUTO = COD_DENTISTA and NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'SELECT COD_PRODUTO, NOME_PRODUTO, NOME_DENTISTA,DENTISTA_PRODUTO, PRECOUNITARIO_PRODUTO, TIPO_PRODUTO, ' +
                                  'VALIDADE_PRODUTO, DATAPAGAMENTO_PRODUTO, QUANTIA_PRODUTO, TOTAL_PRODUTO, DTHORACADASTRO_PRODUTO FROM TB_PRODUTO, ' +
                                  'TB_DENTISTA where DENTISTA_PRODUTO = COD_DENTISTA and TIPO_PRODUTO like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
end;

procedure TForm_PRODUTOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Active := false ;
  ADOQuery1.Active := true ;

  ADOQuery2.Active := false ;
  ADOQuery2.Active := true ;



  if DBGrid1.DataSource.DataSet.RecordCount <>0 then
  begin
     DBGrid1.DataSource.DataSet.RecNo := 1 ;
     AtualizaLabel(SELF);
  end;
end;

procedure TForm_PRODUTOS.FormShow(Sender: TObject);
begin

  ADOQuery1.Active := false ;
  ADOQuery1.Active := true ;

  ADOQuery2.Active := false ;
  ADOQuery2.Active := true ;



  if DBGrid1.DataSource.DataSet.RecordCount <>0 then
  begin
     DBGrid1.DataSource.DataSet.RecNo := 1 ;
     AtualizaLabel(SELF);
  end;

end;

procedure TForm_PRODUTOS.Image2MouseEnter(Sender: TObject);
begin
    Image3.Visible := True;
end;

procedure TForm_PRODUTOS.Image3Click(Sender: TObject);
begin
    Form_PRODUTOS.Close;
end;

procedure TForm_PRODUTOS.Image3MouseLeave(Sender: TObject);
begin
    Image3.Visible := False;
end;

procedure TForm_PRODUTOS.Image5Click(Sender: TObject);
begin
    Form_GRAVA_FINANCAS.ShowModal;
end;

procedure TForm_PRODUTOS.Image6Click(Sender: TObject);
begin
   if Edit2.Text = EmptyStr then
   begin
     Application.MessageBox('Selecione um produto!','ATENÇÃO!',MB_ICONEXCLAMATION)     ;
     exit;
   end;

    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;
    Label12.Visible := FALSE;
    Label13.Visible := FALSE;
    Label15.Visible := FALSE;
    Label19.Visible := FALSE;

    MaskEdit1.Visible := TRUE;
    ComboBox1.Visible := TRUE;
    DBLookupComboBox1.Visible := TRUE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;
    Edit5.Visible := TRUE;

    Image7.Enabled := TRUE;

    if ComboBox1.ItemIndex > 8 then
    begin
        Edit6.Visible := TRUE;
        Label17.Visible := TRUE;
    end
    else
    begin
        Edit6.Visible := FALSE;
        Label17.Visible := FALSE;
    end;

end;

procedure TForm_PRODUTOS.Image7Click(Sender: TObject);
VAR
   dia_c, mes_c, ano_c, hora_c : string;
   dia, mes, ano : string;
   dia_p, mes_p, ano_p : string;
   cod_pro_alterado : integer;
begin
    dia_c := Copy(lbl_data.Caption,1,2);
    mes_c := Copy(lbl_data.Caption,4,2);
    ano_c := Copy(lbl_data.Caption,7,4);
    hora_c := Copy(lbl_data.Caption,14,8);

    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do código!', 'Atenção!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do nome!', 'Atenção!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if DBLookupComboBox1.KeyValue = null then
    begin
        Application.MessageBox('Preencha o campo do dentista!', 'Atenção!', MB_ICONWARNING);
        DBLookupComboBox1.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do preço!', 'Atenção!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if ComboBox1.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do tipo do produto!', 'Atenção!', MB_ICONWARNING);
        ComboBox1.SetFocus;
        Exit;
    end

    else if Edit4.Text = '' then
    begin
        Application.MessageBox('Preencha o campo da quantia!', 'Atenção!', MB_ICONWARNING);
        Edit4.SetFocus;
        Exit;
    end

    else if Edit5.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do total!', 'Atenção!', MB_ICONWARNING);
        Edit5.SetFocus;
        Exit;
    end;

if Application.MessageBox('Tem certeza que deseja alterar o produto?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
   begin
    ALTERA_PRODUTO.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_PRODUTO.AsInteger;
    ALTERA_PRODUTO.Parameters.ParamByName('@NOME').Value := Edit2.Text;

    ALTERA_PRODUTO.Parameters.ParamByName('@DENTISTA').Value := DBLookupComboBox1.KeyValue;
    ALTERA_PRODUTO.Parameters.ParamByName('@PRECO_UNITARIO').Value := StrToFloat(Edit3.Text);

    if ComboBox1.ItemIndex = 0 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'ALIMENTO';
    end

    else if ComboBox1.ItemIndex = 1 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'ANESTÉSICO';
    end

    else if ComboBox1.ItemIndex = 2 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'CLAREADOR';
    end

    else if ComboBox1.ItemIndex = 3 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'DESCARTÁVEIS';
    end

    else if ComboBox1.ItemIndex = 4 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'HIGIENE';
    end

    else if ComboBox1.ItemIndex = 5 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'INSTRUMENTO';
    end

    else if ComboBox1.ItemIndex = 6 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'LIMPEZA';
    end

    else if ComboBox1.ItemIndex = 7 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'MEDICAMENTO';
    end

    else if ComboBox1.ItemIndex = 8 then
    begin
        ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := 'RESINA';
    end

    else if ComboBox1.ItemIndex = 9 then
    begin
        if Edit6.Text = '' then
        begin
            Application.MessageBox('Preencha o campo do outros!', 'Atenção!', MB_ICONWARNING);
            Edit6.SetFocus;
            Exit;
        end

        else
        begin
            ALTERA_PRODUTO.Parameters.ParamByName('@TIPO').Value := Edit6.Text;
        end;
    end;

    dia := Copy(MaskEdit1.Text,1,2);
    mes := Copy(MaskEdit1.Text,4,2);
    ano := Copy(MaskEdit1.Text,7,4);

    ano_p:= Copy(ADOQuery1DATAPAGAMENTO_PRODUTO.AsVariant,1,4);
    mes_p:= Copy(ADOQuery1DATAPAGAMENTO_PRODUTO.AsVariant,6,2);
    dia_p:= Copy(ADOQuery1DATAPAGAMENTO_PRODUTO.AsVariant,9,2);

    ALTERA_PRODUTO.Parameters.ParamByName('@DATA_PAG').Value := ano_p + '-' + mes_p + '-' + dia_p;


    if (MaskEdit1.Text=EmptyStr) or (MaskEdit1.Text='  /  /    ') then
    begin
      ALTERA_PRODUTO.Parameters.ParamByName('@VALIDADE').Value := null ;
    end

    else
    begin
      ALTERA_PRODUTO.Parameters.ParamByName('@VALIDADE').Value := ano + '-' + mes + '-' + dia;
    end;



    ALTERA_PRODUTO.Parameters.ParamByName('@QUANTIA').Value := Edit4.Text;
    ALTERA_PRODUTO.Parameters.ParamByName('@TOTAL').Value := StrToFloat(Edit5.Text);
    ALTERA_PRODUTO.Parameters.ParamByName('@DTHORACADASTRO').Value := ADOQuery1DTHORACADASTRO_PRODUTO.AsDateTime;

    ALTERA_PRODUTO_CX_DP.Parameters.ParamByName('@CODIGO').Value := ADOQuery1COD_PRODUTO.AsInteger;

        cod_pro_alterado := ADOQuery1COD_PRODUTO.AsInteger;
        ALTERA_PRODUTO.ExecProc;
        ALTERA_PRODUTO_CX_DP.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Produto nº ' + Edit1.Text + ' alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

        ADOQuery1.Active := false;
        ADOQuery1.Active := true;

        {while ADOQuery1.RecNo <> cod_pro_alterado do
        BEGIN
           ADOQuery1.Next;
        END;}

        DBGrid1.DataSource.DataSet.RecNo := cod_pro_alterado;
        AtualizaLabel(Self);


   end

     else
     begin
         Exit;
     end;

    //ATUALIZANDO OS LABELS

    Label8.Visible := TRUE;
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;
    Label15.Visible := TRUE;
    Label19.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;
    ComboBox1.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    Image7.Enabled := false;
end;

procedure TForm_PRODUTOS.Image8Click(Sender: TObject);
begin

  Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
  PJ_ESTOQUE.Execute;

end;

procedure TForm_PRODUTOS.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_PRODUTOS.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
