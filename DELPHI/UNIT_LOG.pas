unit UNIT_LOG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, DB, ADODB, StdCtrls, Grids, DBGrids, Mask,
  RpRave, RpDefine, RpCon, RpConDS;

type
  TFORM_LOG = class(TForm)
    Image6: TImage;
    DBGrid1: TDBGrid;
    lbl_data: TLabel;
    ADOConnection1: TADOConnection;
    DS_SELECIONA_TUDO: TDataSource;
    Timer1: TTimer;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    QUERY_SELECIONA_DATA: TADOQuery;
    DS_SELECIONA_DATA: TDataSource;
    Button1: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    QUERY_SELECIONA_NOME: TADOQuery;
    DS_SELECIONA_NOME: TDataSource;
    Image1: TImage;
    Image8: TImage;
    im2: TImage;
    im1: TImage;
    LOG_DATA: TRvDataSetConnection;
    PJ_LOG_DATA: TRvProject;
    QUERY_SELECIONA_TUDO: TADOQuery;
    QUERY_SELECIONA_TUDOCOD_LOG: TAutoIncField;
    QUERY_SELECIONA_TUDOUSUARIO_LOG: TIntegerField;
    QUERY_SELECIONA_TUDONOME_USUARIO: TStringField;
    QUERY_SELECIONA_TUDODESCRICAO_LOG: TStringField;
    QUERY_SELECIONA_TUDODTHORA_LOG: TDateTimeField;
    QUERY_SELECIONA_DATACOD_LOG: TAutoIncField;
    QUERY_SELECIONA_DATACOD_USUARIO: TAutoIncField;
    QUERY_SELECIONA_DATANOME_USUARIO: TStringField;
    QUERY_SELECIONA_DATADESCRICAO_LOG: TStringField;
    QUERY_SELECIONA_DATADTHORA_LOG: TDateTimeField;
    QUERY_SELECIONA_NOMECOD_LOG: TAutoIncField;
    QUERY_SELECIONA_NOMECOD_USUARIO: TAutoIncField;
    QUERY_SELECIONA_NOMENOME_USUARIO: TStringField;
    QUERY_SELECIONA_NOMEDESCRICAO_LOG: TStringField;
    QUERY_SELECIONA_NOMEDTHORA_LOG: TDateTimeField;
    RV_TODOS: TRvDataSetConnection;
    PJ_LOG_TODOS: TRvProject;
    LOG_NOME: TRvDataSetConnection;
    PJ_LOG_NOME: TRvProject;
    procedure QUERY_SELECIONA_TUDODESCRICAO_LOGGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QUERY_SELECIONA_DATADESCRICAO_LOGGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure QUERY_SELECIONA_NOMEDESCRICAO_LOGGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure im1MouseEnter(Sender: TObject);
    procedure im2MouseLeave(Sender: TObject);
    procedure im2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Image8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_LOG: TFORM_LOG;

implementation

{$R *.dfm}

procedure TFORM_LOG.Button1Click(Sender: TObject);
var
 dia_p, mes_p, ano_p : string;
begin


    if RadioGroup1.ItemIndex = 1 then
    begin
      dia_p := Copy(MaskEdit1.Text,1,2);
      mes_p := Copy(MaskEdit1.Text,4,2);
      ano_p := Copy(MaskEdit1.Text,7,4);

      QUERY_SELECIONA_DATA.Close;
      QUERY_SELECIONA_DATA.Parameters.ParamByName('DATA').Value := ano_p + '-' + mes_p + '-' + dia_p ;
      QUERY_SELECIONA_DATA.Open;

      DBGrid1.DataSource := DS_SELECIONA_DATA;
      if QUERY_SELECIONA_DATA.RecordCount = 0 then
      BEGIN
        Application.MessageBox('Nenhum registro encontrado!', 'Aten��o!', MB_ICONERROR);
        MaskEdit1.Clear;
        RadioGroup1.ItemIndex := -1 ;
        DBGrid1.DataSource := ds_SELECIONA_TUDO;
        QUERY_SELECIONA_TUDO.Active := true ;
        Edit1.Visible := FALSE ;
        Label1.Visible := FALSE ;
        Label2.Visible := FALSE ;
        MaskEdit1.Visible := FALSE ;
        Button1.Visible := FALSE ;
      END;
    end

    else if RadioGroup1.ItemIndex = 2 then
    begin
      QUERY_SELECIONA_NOME.Close;
      QUERY_SELECIONA_NOME.Parameters.ParamByName('NOME').Value := Edit1.Text;
      QUERY_SELECIONA_NOME.Open;

      DBGrid1.DataSource := DS_SELECIONA_NOME;

      if QUERY_SELECIONA_NOME.RecordCount = 0 then
      BEGIN
        Application.MessageBox('Nenhum registro encontrado!', 'Aten��o!', MB_ICONERROR);
        Edit1.Clear;
        RadioGroup1.ItemIndex := -1 ;
        DBGrid1.DataSource := ds_SELECIONA_TUDO;
        QUERY_SELECIONA_TUDO.Active := true ;
        Edit1.Visible := FALSE ;
        Label1.Visible := FALSE ;
        Label2.Visible := FALSE ;
        MaskEdit1.Visible := FALSE ;
        Button1.Visible := FALSE ;
      END;
      
    end;

end;

procedure TFORM_LOG.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFORM_LOG.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_LOG.FormShow(Sender: TObject);
begin
  with QUERY_SELECIONA_TUDO DO
  BEGIN
    Active:=False;
    Active:=true;
  END;
end;

procedure TFORM_LOG.im2Click(Sender: TObject);
begin
UNIT_LOG.FORM_LOG.Close;
end;

procedure TFORM_LOG.im2MouseLeave(Sender: TObject);
begin
im2.Visible := FALSE;
end;

procedure TFORM_LOG.Image8Click(Sender: TObject);
begin

if (RadioGroup1.ItemIndex = 0)or(RadioGroup1.ItemIndex = -1)then
begin
    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_LOG_TODOS.Execute;
end;

if (RadioGroup1.ItemIndex = 1) then
begin
    QUERY_SELECIONA_TUDO.Active := FALSE ;
    QUERY_SELECIONA_DATA.Active := false ;
    QUERY_SELECIONA_DATA.Active := true ;
    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_LOG_DATA.Execute;
end;

if (RadioGroup1.ItemIndex = 2) then
begin

    QUERY_SELECIONA_DATA.Active := false ;
    QUERY_SELECIONA_NOME.Active := false ;
    QUERY_SELECIONA_NOME.Active := true ;
    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_LOG_NOME.Execute;
end;

end;

procedure TFORM_LOG.im1MouseEnter(Sender: TObject);
begin
im2.Visible := TRUE ;
end;

procedure TFORM_LOG.MaskEdit1Exit(Sender: TObject);
const
  caracteres = '0123456789/';
var
  i, cont: byte;
  digitos: string;
begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit1.Text));

  if digitos <> '' then
  begin
    for i := 0 to length(digitos) do
    begin
      if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
    end;
  end;

  if cont < 10 then
  begin
    Application.MessageBox('Preencha todos os d�gitos da data!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
end;

procedure TFORM_LOG.QUERY_SELECIONA_DATADESCRICAO_LOGGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(QUERY_SELECIONA_DATADESCRICAO_LOG.AsString,1,200);
end;

procedure TFORM_LOG.QUERY_SELECIONA_NOMEDESCRICAO_LOGGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(QUERY_SELECIONA_NOMEDESCRICAO_LOG.AsString,1,200);
  
end;

procedure TFORM_LOG.QUERY_SELECIONA_TUDODESCRICAO_LOGGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(QUERY_SELECIONA_TUDODESCRICAO_LOG.AsString,1,200);

end;

procedure TFORM_LOG.RadioGroup1Click(Sender: TObject);
begin

  IF RadioGroup1.ItemIndex = 0 THEN
  BEGIN
    Label1.Visible := FALSE ;
    Label2.Visible := FALSE ;
    Edit1.Visible := FALSE ;
    MaskEdit1.Visible := FALSE ;
    MaskEdit1.Clear ;
    Button1.Visible := FALSE ;
    DBGrid1.DataSource := DS_SELECIONA_TUDO ;
    QUERY_SELECIONA_TUDO.Active := FALSE ;
    QUERY_SELECIONA_TUDO.Active := TRUE  ;
  END
  ELSE if RadioGroup1.ItemIndex = 1 then
  BEGIN
    Label1.Visible := TRUE ;
    Label2.Visible := FALSE ;
    Edit1.Visible := FALSE;
    MaskEdit1.Visible := TRUE ;
    Button1.Visible := TRUE ;
    QUERY_SELECIONA_DATA.Active := FALSE ;
    QUERY_SELECIONA_DATA.Active := TRUE  ;
  END
  ELSE if RadioGroup1.ItemIndex = 2 then
  BEGIN
    Label1.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    Button1.Visible := TRUE;
    Label2.Visible := TRUE ;
    Edit1.Visible := TRUE;
    QUERY_SELECIONA_NOME.Active := FALSE ;
    QUERY_SELECIONA_NOME.Active := TRUE  ;
  END;

end;

procedure TFORM_LOG.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
