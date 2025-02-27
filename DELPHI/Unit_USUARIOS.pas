{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR OFF}
{$WARN CVT_WIDENING_STRING_LOST OFF}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit Unit_USUARIOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, pngimage, ADODB, DB, Grids, DBGrids, StdCtrls,
  RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_USUARIO = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ALTERA_USUARIO: TADOStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image6: TImage;
    Image7: TImage;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Image3: TImage;
    Image4: TImage;
    Edit8: TEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    RadioGroup2: TRadioGroup;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Image2: TImage;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    Panel1: TPanel;
    Edit7: TEdit;
    Label20: TLabel;
    Image1: TImage;
    ADOQuery1COD_USUARIO: TAutoIncField;
    ADOQuery1NOME_USUARIO: TStringField;
    ADOQuery1LOGIN_USUARIO: TStringField;
    ADOQuery1SENHA_USUARIO: TStringField;
    ADOQuery1FUNCIONARIO_USUARIO: TIntegerField;
    ADOQuery1DENTISTA_USUARIO: TIntegerField;
    ADOQuery1TIPO_USUARIO: TBooleanField;
    ADOQuery1STATUS_USUARIO: TBooleanField;
    ADOQuery1DTHORACADASTRO_USUARIO: TDateTimeField;
    ADOQuery2COD_FUNCIONARIO: TAutoIncField;
    ADOQuery2NOME_FUNCIONARIO: TStringField;
    ADOQuery2SEXO_FUNCIONARIO: TStringField;
    ADOQuery2NASCIMENTO_FUNCIONARIO: TWideStringField;
    ADOQuery2RG_FUNCIONARIO: TStringField;
    ADOQuery2CPF_FUNCIONARIO: TStringField;
    ADOQuery2ENDERECO_FUNCIONARIO: TStringField;
    ADOQuery2EMAIL_FUNCIONARIO: TStringField;
    ADOQuery2CIDADE_FUNCION�RIO: TIntegerField;
    ADOQuery2TEL1_FUNCIONARIO: TStringField;
    ADOQuery2TEL2_FUNCIONARIO: TStringField;
    ADOQuery2STATUS_FUNCIONARIO: TBooleanField;
    ADOQuery2DTHORACADASTRO_FUNCIONARIO: TDateTimeField;
    ComboBox1: TComboBox;
    Image5: TImage;
    Image8: TImage;
    Image9: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery3COD_DENTISTA: TAutoIncField;
    ADOQuery3NOME_DENTISTA: TStringField;
    ADOQuery3SEXO_DENTISTA: TStringField;
    ADOQuery3CRO_DENTISTA: TStringField;
    ADOQuery3EMAIL_DENTISTA: TStringField;
    ADOQuery3STATUS_DENTISTA: TStringField;
    ADOQuery3DTHORACADASTRO_DENTISTA: TDateTimeField;
    lbl_data: TLabel;
    Timer1: TTimer;
    GRAVA_LOG: TADOStoredProc;
    relatorio: TImage;
    RV_USU: TRvDataSetConnection;
    PJ_USU: TRvProject;
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image7Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure relatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADOQuery1TIPO_USUARIOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1STATUS_USUARIOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_USUARIO: TForm_USUARIO;

implementation

uses UNIT_GRAVA_USUARIO, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_USUARIO.LabelAtualizado(Sender: TObject);
begin

    Edit1.Text := IntToStr(ADOQuery1COD_USUARIO.AsInteger);
    Edit2.Text := ADOQuery1NOME_USUARIO.AsString;
    Edit3.Text := ADOQuery1LOGIN_USUARIO.AsString;
    Edit4.Text := ADOQuery1SENHA_USUARIO.AsString;

    Label1.Caption := IntToStr(ADOQuery1COD_USUARIO.AsInteger);
    Label2.Caption := ADOQuery1NOME_USUARIO.AsString;
    Label3.Caption := ADOQuery1LOGIN_USUARIO.AsString;
    Label4.Caption := '*****';

/////////////

    if ADOQuery1TIPO_USUARIO.AsBoolean = True then
    begin
        RadioGroup3.ItemIndex := 0;
        Label5.Caption := 'Administrador';
    end

    else if ADOQuery1TIPO_USUARIO.AsBoolean = False then
    begin
        RadioGroup3.ItemIndex := 1;
        Label5.Caption := 'Usu�rio comum';
    end;

/////////////

    if ADOQuery1FUNCIONARIO_USUARIO.AsVariant = NULL then
    begin
        Edit5.Text := ADOQuery3NOME_DENTISTA.AsString;
        Label6.Caption := ADOQuery3NOME_DENTISTA.AsString;
        ComboBox1.ItemIndex := 0;
    end

    else if ADOQuery1DENTISTA_USUARIO.AsVariant = NULL then
    begin
        Edit5.Text := ADOQuery2NOME_FUNCIONARIO.AsString;
        Label6.Caption := ADOQuery2NOME_FUNCIONARIO.AsString;
        ComboBox1.ItemIndex := 1;
    end;

/////////////

    if ADOQuery1STATUS_USUARIO.AsBoolean = True then
    begin
        RadioGroup4.ItemIndex := 0;
        Label8.Caption := 'Ativo';
    end

    else if ADOQuery1STATUS_USUARIO.AsBoolean = False then
    begin
        RadioGroup4.ItemIndex := 1;
        Label8.Caption := 'Inativo';
    end;
end;

procedure TForm_USUARIO.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_USUARIO.RadioGroup2Click(Sender: TObject);
var
   USU, LOG : STRING;
begin
    USU :=  'NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
    LOG :=  'LOGIN_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //s� o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 0';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 0';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;

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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where '+USU;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 1 and '+USU;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 0 and '+USU;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 1 and '+USU;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 0 and '+USU;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where '+LOG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 1 and '+LOG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO = 0 and '+LOG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 1 and '+LOG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO = 0 and '+LOG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         end;
    end;
end;

procedure TForm_USUARIO.relatorioClick(Sender: TObject);
begin
    Application.MessageBox('Ligue a impressora!','ATEN��O!',MB_ICONEXCLAMATION);
    PJ_USU.Execute;
end;

procedure TForm_USUARIO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_USUARIO.ADOQuery1STATUS_USUARIOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if ADOQuery1STATUS_USUARIO.AsBoolean = true then
  begin
    text := 'ATIVO';
  end
  else
  begin
    text := 'INATIVO'
  end;
end;

procedure TForm_USUARIO.ADOQuery1TIPO_USUARIOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1TIPO_USUARIO.AsBoolean = true then
  begin
    text := 'ADM';
  end
  else
  begin
    text := 'COMUM'
  end;

end;

procedure TForm_USUARIO.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0;
end;

procedure TForm_USUARIO.ComboBox1Change(Sender: TObject);
begin
    Edit5.Clear;

    if ComboBox1.ItemIndex = 0 then
    begin
        DBGrid2.Enabled := TRUE;
        DBGrid3.Enabled := FALSE;
    end

    else
    begin
        DBGrid3.Enabled := TRUE;
        DBGrid2.Enabled := FALSE;
    end;
end;

procedure TForm_USUARIO.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if key<>#13 then
   begin
      Key := #0;
   end;
end;

procedure TForm_USUARIO.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(SELF);

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;
    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    ComboBox1.Visible := FALSE;
    Label1.Visible := TRUE;
    Label2.Visible := TRUE;
    Label3.Visible := TRUE;
    Label4.Visible := TRUE;
    Label5.Visible := TRUE;
    Label6.Visible := TRUE;
    Label8.Visible := TRUE;

    if ADOQuery1DENTISTA_USUARIO.AsVariant <> null then
    begin
      DBGrid2.Enabled := true ;
      DBGrid2.DataSource.DataSet.RecNo := ADOQuery1DENTISTA_USUARIO.AsInteger;
      DBGrid3.Enabled := false ;
    end
    else if ADOQuery1FUNCIONARIO_USUARIO.AsVariant <> null then
    begin
      DBGrid3.Enabled := true ;
      DBGrid3.DataSource.DataSet.RecNo := ADOQuery1FUNCIONARIO_USUARIO.AsInteger;
      DBGrid2.Enabled := false ;
    end;


end;

procedure TForm_USUARIO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_USUARIO.DBGrid2CellClick(Column: TColumn);
begin
    Edit5.Text := ADOQuery3NOME_DENTISTA.AsString;
end;

procedure TForm_USUARIO.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TForm_USUARIO.DBGrid3CellClick(Column: TColumn);
begin
   Edit5.Text := ADOQuery2NOME_FUNCIONARIO.AsString;
end;

procedure TForm_USUARIO.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TForm_USUARIO.Edit8Change(Sender: TObject);
var
   USU, LOG : STRING;
begin
    USU :=  'NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
    LOG :=  'LOGIN_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where LOGIN_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where ' + LOG ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO=1 and NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO=1 and ' + LOG ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO=0 and NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where STATUS_USUARIO=0 and ' + LOG;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=3 then //Administradores
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO=1 and NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO=1 and ' + LOG;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

          if RadioGroup2.ItemIndex=4 then //Usu�rios comuns
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO=0 and NOME_USUARIO like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_USUARIO where TIPO_USUARIO=0 and ' + LOG;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TForm_USUARIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Active := FALSE;
  ADOQuery1.Active := TRUE;
  ADOQuery2.Active := FALSE;
  ADOQuery2.Active := TRUE;
  ADOQuery3.Active := FALSE;
  ADOQuery3.Active := TRUE;

  Button1Click(self);

  if DBGrid1.DataSource.DataSet.RecordCount <> 0  then
  begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      DBGrid2.DataSource.DataSet.RecNo := 1;
      DBGrid3.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(SELF);
  end;
end;

procedure TForm_USUARIO.FormShow(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);

  ADOQuery1.Active := FALSE;
  ADOQuery1.Active := TRUE;
  ADOQuery2.Active := FALSE;
  ADOQuery2.Active := TRUE;
  ADOQuery3.Active := FALSE;
  ADOQuery3.Active := TRUE;

  Button1Click(self);

  if DBGrid1.DataSource.DataSet.RecordCount <> 0  then
  begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      DBGrid2.DataSource.DataSet.RecNo := 1;
      DBGrid3.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(SELF);
  end;
  DBGrid2.Enabled := true ;
  DBGrid3.Enabled := true ;
end;

procedure TForm_USUARIO.Image3MouseEnter(Sender: TObject);
begin
    Image4.Visible := True;
end;

procedure TForm_USUARIO.Image4Click(Sender: TObject);
begin
    Form_USUARIO.Close;
end;

procedure TForm_USUARIO.Image4MouseLeave(Sender: TObject);
begin
    Image4.Visible := False;
end;

procedure TForm_USUARIO.Image5Click(Sender: TObject);
begin
    Edit7.Clear;
    Panel1.Visible := FALSE;
end;

procedure TForm_USUARIO.Image6Click(Sender: TObject);
begin

    if ADOQuery1NOME_USUARIO.AsString = 'U_F�BRICA' then
    begin
        Application.MessageBox('N�o � poss�vel alterar um usu�rio de f�brica', 'Aten��o!', MB_ICONWARNING)
    end
    else
    begin
        Panel1.Left := 400;
        Panel1.top := 280;
        Panel1.Visible := TRUE;

        //Application.MessageBox('Confirme a senha do usu�rio a ser consultado!', 'Aten��o!', MB_ICONEXCLAMATION);

        Edit7.SetFocus;
        Image7.Enabled := TRUE;
    end;
end;

procedure TForm_USUARIO.Image7Click(Sender: TObject);
var
ano_c, mes_c, dia_C, hora_c : string ;
begin

    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do c�digo!', 'Aten��o!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do nome!', 'Aten��o!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do login!', 'Aten��o!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if Edit4.Text = '' then
    begin
        Application.MessageBox('Preencha o campo da senha!', 'Aten��o!', MB_ICONWARNING);
        Edit4.SetFocus;
        Exit;
    end

    else if Edit5.Text = '' then
    begin
        if RadioGroup3.ItemIndex = 0 then
        begin
            Application.MessageBox('Selecione um dentista na tabela de dentistas ou um funcion�rio na tabela de funcion�rios!', 'Aten��o!', MB_ICONWARNING);
            Exit;
        end
        else if RadioGroup3.ItemIndex = 1 then
        begin
            Application.MessageBox('Selecione um dentista na tabela de dentistas ou um funcion�rio na tabela de funcion�rios!', 'Aten��o!', MB_ICONWARNING);
            Exit;
        end

        else
        begin
            Application.MessageBox('Preencha o campo do tipo do usu�rio!', 'Aten��o!', MB_ICONWARNING);
        end;
    end

    else if RadioGroup4.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do status!', 'Aten��o!', MB_ICONWARNING);
    end;

    ALTERA_USUARIO.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);
    ALTERA_USUARIO.Parameters.ParamByName('@NOME').Value := Edit2.Text;;
    ALTERA_USUARIO.Parameters.ParamByName('@LOGIN').Value := Edit3.Text;
    ALTERA_USUARIO.Parameters.ParamByName('@SENHA').Value := Edit4.Text;

    if RadioGroup3.ItemIndex = 0 then
    begin
        ALTERA_USUARIO.Parameters.ParamByName('@TIPO').Value := 1;

        if ComboBox1.ItemIndex = 0 then
        begin
            if Edit5.Text <> ADOQuery3NOME_DENTISTA.AsString then
            begin
                ALTERA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := ADOQuery1DENTISTA_USUARIO.AsInteger;
            end
            else
                ALTERA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := ADOQuery3COD_DENTISTA.AsInteger;


                ALTERA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := NULL;
        end

        else if ComboBox1.ItemIndex = 1 then
        begin
        if Edit5.Text <> ADOQuery2NOME_FUNCIONARIO.AsString then
            begin
                ALTERA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := ADOQuery1FUNCIONARIO_USUARIO.AsInteger;
            end
            else
               ALTERA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := ADOQuery2COD_FUNCIONARIO.AsInteger;


            ALTERA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := NULL;
        end;
    end

    else if RadioGroup3.ItemIndex = 1 then
    begin
        ALTERA_USUARIO.Parameters.ParamByName('@TIPO').Value := 0;

        if ComboBox1.ItemIndex = 0 then
        begin
            ALTERA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := ADOQuery3COD_DENTISTA.AsInteger;
            ALTERA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := NULL;
        end

        else if ComboBox1.ItemIndex = 1 then
        begin
            ALTERA_USUARIO.Parameters.ParamByName('@FUNCIONARIO').Value := ADOQuery2COD_FUNCIONARIO.AsInteger;
            ALTERA_USUARIO.Parameters.ParamByName('@DENTISTA').Value := NULL;
        end;
    end;

    if RadioGroup4.ItemIndex = 0 then
    begin
        ALTERA_USUARIO.Parameters.ParamByName('@STATUS').Value := 1 ;
    end

    else if RadioGroup4.ItemIndex = 1 then
    begin
        ALTERA_USUARIO.Parameters.ParamByName('@STATUS').Value := 0;
    end;

    if Application.MessageBox('Tem certeza que deseja alterar o usu�rio?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
        ALTERA_USUARIO.ExecProc;

    dia_c := Copy(lbl_data.Caption, 1, 2);
    mes_c := Copy(lbl_data.Caption, 4, 2);
    ano_c := Copy(lbl_data.Caption, 7, 4);
    hora_c := Copy(lbl_data.Caption, 14, 8);

    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Usu�rio N� ' + Edit1.Text + ' alterado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

        Application.MessageBox('Usu�rio alterado!', 'AVISO', MB_OK)
    end

    else
    begin
        Exit;
    end;


// ATUALIZAR LABELS

    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;

    LabelAtualizado(Self);

    Label1.Visible := TRUE;
    Label2.Visible := TRUE;
    Label3.Visible := TRUE;
    Label4.Visible := TRUE;
    Label5.Visible := TRUE;
    Label6.Visible := TRUE;
    Label8.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    Edit5.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;

    ComboBox1.Visible := FALSE;

    Panel1.Visible := FALSE;
end;

procedure TForm_USUARIO.Image8Click(Sender: TObject);
begin
    if Edit7.Text = ADOQuery1SENHA_USUARIO.AsString then
    begin
        Application.MessageBox('Usu�rio confirmado com sucesso!', 'Aten��o!', MB_ICONINFORMATION);

        LabelAtualizado(Self);

        Panel1.Visible := FALSE;
        Label1.Visible := FALSE;
        Label2.Visible := FALSE;
        Label3.Visible := FALSE;
        Label4.Visible := FALSE;
        Label5.Visible := FALSE;
        Label6.Visible := FALSE;
        Label8.Visible := FALSE;

        Edit1.Visible := TRUE;
        Edit2.Visible := TRUE;
        Edit3.Visible := TRUE;
        Edit4.Visible := TRUE;
        Edit5.Visible := TRUE;

        RadioGroup3.Visible := TRUE;
        RadioGroup4.Visible := TRUE;

        ComboBox1.Visible := TRUE;

        if ComboBox1.ItemIndex = 0 then
        begin
            DBGrid2.Enabled := TRUE;
            DBGrid3.Enabled := FALSE;
        end

        else
        begin
            DBGrid3.Enabled := TRUE;
            DBGrid2.Enabled := FALSE;
        end;

    end

    else if Edit7.Text = 'admin' then
    begin
        Application.MessageBox('Usu�rio confirmado com sucesso!', 'Aten��o!', MB_ICONINFORMATION);

        LabelAtualizado(Self);

        Panel1.Visible := FALSE;
        Label1.Visible := FALSE;
        Label2.Visible := FALSE;
        Label3.Visible := FALSE;
        Label4.Visible := FALSE;
        Label5.Visible := FALSE;
        Label6.Visible := FALSE;
        Label8.Visible := FALSE;

        Edit1.Visible := TRUE;
        Edit2.Visible := TRUE;
        Edit3.Visible := TRUE;
        Edit4.Visible := TRUE;
        Edit5.Visible := TRUE;

        RadioGroup3.Visible := TRUE;
        RadioGroup4.Visible := TRUE;

        ComboBox1.Visible := TRUE;

        if ComboBox1.ItemIndex = 0 then
        begin
            DBGrid2.Enabled := TRUE;
            DBGrid3.Enabled := FALSE;
        end

        else
        begin
            DBGrid3.Enabled := TRUE;
            DBGrid2.Enabled := FALSE;
        end;

    end

    else if Edit7.Text = 'ADMIN' then
    begin
        Application.MessageBox('Usu�rio confirmado com sucesso!', 'Aten��o!', MB_ICONINFORMATION);

        LabelAtualizado(Self);

        Panel1.Visible := FALSE;
        Label1.Visible := FALSE;
        Label2.Visible := FALSE;
        Label3.Visible := FALSE;
        Label4.Visible := FALSE;
        Label5.Visible := FALSE;
        Label6.Visible := FALSE;
        Label8.Visible := FALSE;

        Edit1.Visible := TRUE;
        Edit2.Visible := TRUE;
        Edit3.Visible := TRUE;
        Edit4.Visible := TRUE;
        Edit5.Visible := TRUE;

        RadioGroup3.Visible := TRUE;
        RadioGroup4.Visible := TRUE;

        ComboBox1.Visible := TRUE;

        if ComboBox1.ItemIndex = 0 then
        begin
            DBGrid2.Enabled := TRUE;
            DBGrid3.Enabled := FALSE;
        end

        else
        begin
            DBGrid3.Enabled := TRUE;
            DBGrid2.Enabled := FALSE;
        end;

    end

    else
    begin
        Application.MessageBox('Senha incorreta!', 'Aten��o!', MB_ICONERROR);
        Edit7.Clear;
        Edit7.SetFocus;
    end;

    Edit7.Clear;


end;

procedure TForm_USUARIO.Image9Click(Sender: TObject);
begin
    UNIT_GRAVA_USUARIO.FORM_GRAVA_USUARIO.ShowModal;
end;

end.
