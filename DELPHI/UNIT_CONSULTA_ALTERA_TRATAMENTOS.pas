unit UNIT_CONSULTA_ALTERA_TRATAMENTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ExtCtrls, StdCtrls, Grids, DBGrids, pngimage, jpeg, DB, ADODB;

type
  TFORM_CONSULTA_ALTERA_TRATAMENTO = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Edit8: TEdit;
    Memo1: TMemo;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ALTERA_TRATAMENTO: TADOStoredProc;
    ADOQuery1COD_TRATAMENTO: TAutoIncField;
    ADOQuery1NOME_TRATAMENTO: TStringField;
    ADOQuery1OBS_TRATAMENTO: TMemoField;
    ADOQuery1DTHORACADASTRO_TRATAMENTO: TDateTimeField;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Edit2: TEdit;
    Image4: TImage;
    Timer1: TTimer;
    lbl_data: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaLabel(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ADOQuery1OBS_TRATAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_CONSULTA_ALTERA_TRATAMENTO: TFORM_CONSULTA_ALTERA_TRATAMENTO;

implementation

uses UNIT_GRAVA_TRATAMENTO;

{$R *.dfm}

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.ADOQuery1OBS_TRATAMENTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Copy(ADOQuery1OBS_TRATAMENTO.AsString,1,200);
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.AtualizaLabel(Sender: TObject);
begin
   Label9.Caption:= IntToStr(ADOQuery1COD_TRATAMENTO.AsInteger);
   Edit1.Text:= IntToStr(ADOQuery1COD_TRATAMENTO.AsInteger);
   Label10.Caption:= ADOQuery1NOME_TRATAMENTO.AsString;
   Edit2.Text := ADOQuery1NOME_TRATAMENTO.AsString;
   Label11.Caption:= ADOQuery1OBS_TRATAMENTO.AsString;
   Memo1.Lines.Text:= ADOQuery1OBS_TRATAMENTO.AsString;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1 ;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Button2Click(Sender: TObject);
begin
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;

    Edit1.Visible := TRUE;

    Edit2.Visible := TRUE;

    Memo1.Visible := TRUE;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Button3Click(Sender: TObject);
begin
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;

    Edit1.Visible := FALSE;

    Edit2.Visible := FALSE;

    Memo1.Visible := FALSE;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if key<>#13 then
   begin
      Key := #0;
   end;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.DBGrid1CellClick(Column: TColumn);
begin
   AtualizaLabel(Self);
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin

  Key := UpCase(key);

end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Edit8Change(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_TRATAMENTO where COD_TRATAMENTO like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_TRATAMENTO where NOME_TRATAMENTO like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end;
end;


procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.FormShow(Sender: TObject);
begin
  ADOQuery1.Active:=false;
  ADOQuery1.Active:=true;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image3Click(Sender: TObject);
begin
  FORM_CONSULTA_ALTERA_TRATAMENTO.Close;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image5Click(Sender: TObject);
begin
   Form_GRAVA_TRATAMENTO.ShowModal;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image6Click(Sender: TObject);
begin
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;

    Edit1.Visible := TRUE;

    Edit2.Visible := TRUE;

    Image7.Enabled := TRUE;

    Memo1.Visible := TRUE;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Image7Click(Sender: TObject);
var
   cod_tra_alterado: integer;
begin
    begin
    if Edit1.Text = '' then
    begin
       Application.MessageBox('Preencha o campo do código!', 'Atenção!', MB_ICONWARNING);
       Edit1.SetFocus;
       Exit;
    end;

    ALTERA_TRATAMENTO.Parameters.ParamByName('@CODIGO').Value:= Edit1.Text;

    {if ComboBox1.ItemIndex = 0 then
    begin
       ALTERA_TRATAMENTO.Parameters.ParamByName('@NOME').Value:= 'ORTODONTIA';
    end

    else if ComboBox1.ItemIndex = 1 then
    begin
       ALTERA_TRATAMENTO.Parameters.ParamByName('@NOME').Value:= 'LIMPEZA';
    end

    else if ComboBox1.ItemIndex = 2 then
    begin
       ALTERA_TRATAMENTO.Parameters.ParamByName('@NOME').Value:= 'CANAL'
    end;}

    ALTERA_TRATAMENTO.Parameters.ParamByName('@NOME').Value := Edit2.Text;

    ALTERA_TRATAMENTO.Parameters.ParamByName('@OBS').Value:= Memo1.Lines.Text;

    if Application.MessageBox('Tem certeza que deseja alterar o tratamento?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
       cod_tra_alterado:= ADOQuery1COD_TRATAMENTO.AsInteger;
       ALTERA_TRATAMENTO.ExecProc;
       Application.MessageBox('Tratamento alterado!', 'AVISO', MB_OK)
    end

    else
    begin
       Exit;
    end;

    //ATUALIZANDO OS LABELS

    ADOQuery1.Active:= FALSE;
    ADOQuery1.Active:= TRUE;

    DBGrid1.DataSource.DataSet.RecNo := cod_tra_alterado;

    AtualizaLabel(Self);

    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;

    Edit1.Visible := FALSE;

    Edit2.Visible := FALSE;

    Memo1.Visible := FALSE;

    Image7.Enabled := FALSE;
end;

end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TFORM_CONSULTA_ALTERA_TRATAMENTO.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
