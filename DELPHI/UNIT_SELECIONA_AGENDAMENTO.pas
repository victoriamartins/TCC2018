unit UNIT_SELECIONA_AGENDAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, pngimage;

type
  TFORM_SELECIONA_AGENDAMENTO = class(TForm)
    ADOQUERY_AG: TADOQuery;
    DATASOURCE_AG: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ADOConnection1: TADOConnection;
    Edit1: TEdit;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    ADOQUERY_AGCOD_AGENDAMENTO: TAutoIncField;
    ADOQUERY_AGDATAHORA_AGENDAMENTO: TDateTimeField;
    ADOQUERY_AGPACIENTE_AGENDAMENTO: TIntegerField;
    ADOQUERY_AGNOME_PACIENTE: TStringField;
    ADOQUERY_AGDENTISTA_AGENDAMENTO: TIntegerField;
    ADOQUERY_AGNOME_DENTISTA: TStringField;
    ADOQUERY_AGTRATAMENTO_AGENDAMENTO: TIntegerField;
    ADOQUERY_AGNOME_TRATAMENTO: TStringField;
    ADOQUERY_AGOBS_AGENDAMENTO: TMemoField;
    ADOQUERY_AGCONSULTA_AGENDAMENTO: TBooleanField;
    ADOQUERY_AGDTHORACADASTRO_AGENDAMENTO: TDateTimeField;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_SELECIONA_AGENDAMENTO: TFORM_SELECIONA_AGENDAMENTO;

implementation

uses UNIT_GRAVA_CONSULTA;

{$R *.dfm}

procedure TFORM_SELECIONA_AGENDAMENTO.DBGrid1CellClick(Column: TColumn);
var //2018-05-20 12:30:00.000
 data , hora : string ;
 paciente : integer ;
begin

  data := Copy(ADOQUERY_AGDATAHORA_AGENDAMENTO.Text, 1, 10);
  hora := Copy(ADOQUERY_AGDATAHORA_AGENDAMENTO.Text, 12,5);
  paciente := ADOQUERY_AGPACIENTE_AGENDAMENTO.AsInteger;

  if ADOQUERY_AGCOD_AGENDAMENTO.Value = 0 then
  begin
    Application.MessageBox('Pr�-agendamento inv�lido!', 'ATEN��O!', MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox('Tem certeza que deseja selecionar o pr�-agendamento?','SELECIONAR', mb_iconquestion + mb_yesno) = idYes then
  begin

    with UNIT_GRAVA_CONSULTA.FORM_GRAVA_CONSULTA do
    begin
      lbl_agendamento.Caption := ADOQUERY_AGCOD_AGENDAMENTO.AsString;
      DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := ADOQUERY_AGDENTISTA_AGENDAMENTO.AsSTRING;
      DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue := ADOQUERY_AGTRATAMENTO_AGENDAMENTO.AsString;
      Memo1.Lines.Text := ADOQUERY_AGOBS_AGENDAMENTO.AsString;
      Edit1.Text := ADOQUERY_AGCOD_AGENDAMENTO.AsString ;  ///////////////////////////
      MaskEdit1.Text :=  data;
      MaskEdit2.Text := hora ;
      DBGrid1.DataSource.DataSet.RecNo := paciente ;

      DBLOOKUPCOMBOBOX_DENTISTA.Enabled := FALSE ;
      DBLOOKUPCOMBOBOX_TRATAMENTO.Enabled := FALSE ;
      Memo1.Enabled := FALSE ;
      MaskEdit1.Enabled := FALSE ;
      MaskEdit2.Enabled := FALSE ;
      DBGrid1.Enabled := FALSE ;
    end;



    UNIT_SELECIONA_AGENDAMENTO.FORM_SELECIONA_AGENDAMENTO.Close;

  end

  else
  begin
    Application.MessageBox('Um pr�-agendamento deve ser selecionado!', 'ATEN��O!', MB_ICONWARNING);
  end;


end;

procedure TFORM_SELECIONA_AGENDAMENTO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_SELECIONA_AGENDAMENTO.Edit1Change(Sender: TObject);
begin

  with ADOQUERY_AG do
  begin
      Close;
      Active := false ;
      SQL.Clear;
      SQL.Add('SELECT COD_AGENDAMENTO, DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO, OBS_AGENDAMENTO, CONSULTA_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO');
      SQL.Add('FROM TB_AGENDAMENTO, TB_DENTISTA, TB_TRATAMENTO, TB_PACIENTE');
      SQL.Add('WHERE COD_DENTISTA=DENTISTA_AGENDAMENTO AND COD_TRATAMENTO=TRATAMENTO_AGENDAMENTO AND COD_PACIENTE=PACIENTE_AGENDAMENTO and CONSULTA_AGENDAMENTO=0');
      SQL.Add('AND NOME_PACIENTE LIKE '+ QuotedStr(Edit1.Text+'%'))  ;
      Active := true;
      open;
  end;

end;

procedure TFORM_SELECIONA_AGENDAMENTO.Edit1Enter(Sender: TObject);
begin
    Edit1.Clear;
end;

procedure TFORM_SELECIONA_AGENDAMENTO.Edit1Exit(Sender: TObject);
begin

  with ADOQUERY_AG do
  begin
    close;
    Active := false;
    SQL.Clear;
    SQL.Add('SELECT COD_AGENDAMENTO, DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO, NOME_PACIENTE, DENTISTA_AGENDAMENTO, NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO, OBS_AGENDAMENTO, CONSULTA_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO');
    SQL.Add('FROM TB_AGENDAMENTO, TB_DENTISTA, TB_TRATAMENTO, TB_PACIENTE');
    SQL.Add('WHERE COD_DENTISTA=DENTISTA_AGENDAMENTO AND COD_TRATAMENTO=TRATAMENTO_AGENDAMENTO AND COD_PACIENTE=PACIENTE_AGENDAMENTO and CONSULTA_AGENDAMENTO=0');
    Active := true;
    open;
  end;

end;

procedure TFORM_SELECIONA_AGENDAMENTO.FormCreate(Sender: TObject);
begin
  ADOQUERY_AG.Close;
  ADOQUERY_AG.Active := FALSE;
  ADOQUERY_AG.Active := TRUE;
  ADOQUERY_AG.Open;
end;

procedure TFORM_SELECIONA_AGENDAMENTO.FormShow(Sender: TObject);
begin

  ADOQUERY_AG.Active := FALSE ;
  ADOQUERY_AG.Active := TRUE  ;

end;

procedure TFORM_SELECIONA_AGENDAMENTO.Image2Click(Sender: TObject);
begin
    UNIT_SELECIONA_AGENDAMENTO.FORM_SELECIONA_AGENDAMENTO.Close;
end;

end.
