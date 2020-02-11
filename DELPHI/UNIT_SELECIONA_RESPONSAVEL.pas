unit UNIT_SELECIONA_RESPONSAVEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, pngimage;

type
  TFORM_SELECIONA_RESPONSAVEL = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQUERY_RESPONSAVEL: TADOQuery;
    DATASOURCE_RESPONSAVEL: TDataSource;
    Image6: TImage;
    ADOQUERY_RESPONSAVELCOD_RESPONSAVEL: TAutoIncField;
    ADOQUERY_RESPONSAVELNOME_RESPONSAVEL: TStringField;
    ADOQUERY_RESPONSAVELNASCIMENTO_RESPONSAVEL: TWideStringField;
    ADOQUERY_RESPONSAVELRG_RESPONSAVEL: TStringField;
    ADOQUERY_RESPONSAVELCPF_RESPONSAVEL: TStringField;
    ADOQUERY_RESPONSAVELTEL_RESPONSAVEL: TStringField;
    ADOQUERY_RESPONSAVELENDERECO_RESPONSAVEL: TStringField;
    Image2: TImage;
    Button1: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_SELECIONA_RESPONSAVEL: TFORM_SELECIONA_RESPONSAVEL;

implementation

uses UNIT_GRAVA_PACIENTE, UNIT_GRAVA_RESPONSAVEL;

{$R *.dfm}

procedure TFORM_SELECIONA_RESPONSAVEL.Button1Click(Sender: TObject);
begin

  with UNIT_GRAVA_RESPONSAVEL.FORM_GRAVA_RESPONSAVEL do
  begin
    ShowModal;
    ADOQUERY_RESPONSAVEL.Active := false;
    ADOQUERY_RESPONSAVEL.Active := true;
  end;

end;

procedure TFORM_SELECIONA_RESPONSAVEL.DBGrid1CellClick(Column: TColumn);
begin

  if Application.MessageBox('Tem certeza que deseja selecionar o responsável?','SELECIONAR', mb_iconquestion + mb_yesno) = idYes then
  begin

      WITH UNIT_GRAVA_PACIENTE.FORM_GRAVA_PACIENTE DO
      BEGIN

        if ADOQUERY_RESPONSAVEL.Active = true then
        begin
          DBLOOKUPCOMBOBOX_RESPONSAVEL.KeyValue := ADOQUERY_RESPONSAVELCOD_RESPONSAVEL.AsInteger;
          Edit2.Text := ADOQUERY_RESPONSAVELENDERECO_RESPONSAVEL.AsString;
        end;

      END;

    UNIT_SELECIONA_RESPONSAVEL.FORM_SELECIONA_RESPONSAVEL.Close;

  end

  else
  begin
    Application.MessageBox('Um responsável deve ser selecionado!', 'ATENÇÃO!', MB_ICONWARNING);
    Exit;
  end;
end;

procedure TFORM_SELECIONA_RESPONSAVEL.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_SELECIONA_RESPONSAVEL.Edit1Change(Sender: TObject);
begin

  with ADOQUERY_RESPONSAVEL do
  begin
    close;
    Active := false;
    SQL.Clear;
    sql.Add('SELECT COD_RESPONSAVEL, NOME_RESPONSAVEL, NASCIMENTO_RESPONSAVEL, ');
    SQL.Add('RG_RESPONSAVEL, CPF_RESPONSAVEL, TEL_RESPONSAVEL, ENDERECO_RESPONSAVEL ');
    SQL.Add('FROM TB_RESPONSAVEL  WHERE STATUS_RESPONSAVEL=1 and NOME_RESPONSAVEL LIKE ' + QuotedStr(Edit1.Text+'%'));
    Active := true;
    open;
  end;

end;

procedure TFORM_SELECIONA_RESPONSAVEL.Edit1Enter(Sender: TObject);
begin

  Edit1.Clear;

end;

procedure TFORM_SELECIONA_RESPONSAVEL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FORM_GRAVA_PACIENTE.ADOQUERY_RESPONSAVEL.Active := false;
    FORM_GRAVA_PACIENTE.ADOQUERY_RESPONSAVEL.Active := true;
end;

procedure TFORM_SELECIONA_RESPONSAVEL.FormCreate(Sender: TObject);
begin
  WITH ADOQUERY_RESPONSAVEL.SQL DO
  begin
    Add('SELECT COD_RESPONSAVEL, NOME_RESPONSAVEL, NASCIMENTO_RESPONSAVEL')  ;
    Add('RG_RESPONSAVEL, CPF_RESPONSAVEL, TEL_RESPONSAVEL, ENDERECO_RESPONSAVEL');
    Add('FROM TB_RESPONSAVEL WHERE STATUS_RESPONSAVEL=1');
  end;

  ADOQUERY_RESPONSAVEL.Active := FALSE;
  ADOQUERY_RESPONSAVEL.Active := TRUE;
end;

procedure TFORM_SELECIONA_RESPONSAVEL.FormShow(Sender: TObject);
begin
ADOQUERY_RESPONSAVEL.Active := FALSE;
ADOQUERY_RESPONSAVEL.Active := TRUE;
end;

procedure TFORM_SELECIONA_RESPONSAVEL.Image2Click(Sender: TObject);
begin
    UNIT_SELECIONA_RESPONSAVEL.FORM_SELECIONA_RESPONSAVEL.Close;
end;

end.
