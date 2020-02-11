unit UNIT_GRAVA_AGENDAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB, Menus, Mask, StdCtrls, DBCtrls, Grids, DBGrids,
  jpeg, pngimage;

type
  TFORM_GRAVA_AGENDAMENTO = class(TForm)
    DBGrid1: TDBGrid;
    POPUP_PACIENTE: TPopupMenu;
    OQUEISSO3: TMenuItem;
    CADASTRARNOVOTRATAMENTO2: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOQUERY_PACIENTE: TADOQuery;
    ADOQUERY_PACIENTECOD_PACIENTE: TAutoIncField;
    ADOQUERY_PACIENTENOME_PACIENTE: TStringField;
    ADOQUERY_PACIENTERG_PACIENTE: TStringField;
    ADOQUERY_PACIENTECPF_PACIENTE: TStringField;
    ADOQUERY_PACIENTESEXO_PACIENTE: TStringField;
    ADOQUERY_PACIENTENASCIMENTO_PACIENTE: TWideStringField;
    ADOQUERY_PACIENTEENDERECO_PACIENTE: TStringField;
    ADOQUERY_PACIENTEEMAIL_PACIENTE: TStringField;
    ADOQUERY_PACIENTECIDADE_PACIENTE: TIntegerField;
    ADOQUERY_PACIENTETEL1_PACIENTE: TStringField;
    ADOQUERY_PACIENTETEL2_PACIENTE: TStringField;
    ADOQUERY_PACIENTEMENORDE18ANOS: TBooleanField;
    ADOQUERY_PACIENTERESPONSAVEL_PACIENTE: TIntegerField;
    ADOQUERY_PACIENTEOBS_PACIENTE: TMemoField;
    ADOQUERY_PACIENTESTATUS_PACIENTE: TBooleanField;
    ADOQUERY_PACIENTEDTHORACADASTRO_PACIENTE: TDateTimeField;
    DATASOURCE_PACIENTE: TDataSource;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    POPUP_DENTISTA: TPopupMenu;
    OQUEISSO1: TMenuItem;
    CADASTRARNOVODENTISTA1: TMenuItem;
    ADOQUERY_TRATAMENTO: TADOQuery;
    ADOQUERY_TRATAMENTOCOD_TRATAMENTO: TAutoIncField;
    ADOQUERY_TRATAMENTONOME_TRATAMENTO: TStringField;
    ADOQUERY_TRATAMENTOOBS_TRATAMENTO: TMemoField;
    ADOQUERY_TRATAMENTODTHORACADASTRO_TRATAMENTO: TDateTimeField;
    DATASOURCE_TRATAMENTO: TDataSource;
    POPUP_TRATAMENTO: TPopupMenu;
    OQUEISSO2: TMenuItem;
    CADASTRARNOVOTRATAMENTO1: TMenuItem;
    GRAVA_AGENDAMENTO: TADOStoredProc;
    Timer1: TTimer;
    ADOQUERY_BUSCA: TADOQuery;
    Image6: TImage;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    DBLOOKUPCOMBOBOX_TRATAMENTO: TDBLookupComboBox;
    DBLOOKUPCOMBOBOX_DENTISTA: TDBLookupComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    lbl_data: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image7: TImage;
    GRAVA_LOG: TADOStoredProc;
    Image4: TImage;
    Image3: TImage;
    procedure Image7Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLOOKUPCOMBOBOX_DENTISTAKeyPress(Sender: TObject; var Key: Char);
    procedure DBLOOKUPCOMBOBOX_TRATAMENTOKeyPress(Sender: TObject;
      var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_AGENDAMENTO: TFORM_GRAVA_AGENDAMENTO;

implementation

uses UNIT_GRAVA_PACIENTE, Unit_TELA_PRINCIPAL, UNIT_CAIXA,
  Unit_CONS_AGENDAMENTO;

{$R *.dfm}

procedure TFORM_GRAVA_AGENDAMENTO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_GRAVA_AGENDAMENTO.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.DBLOOKUPCOMBOBOX_DENTISTAKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.DBLOOKUPCOMBOBOX_TRATAMENTOKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_CONS_AGENDAMENTO.Form_CONS_AGENDAMENTO do
  begin
    ADOQuery1.Active := false ;
    ADOQuery1.Active := true  ;
  end;

end;

procedure TFORM_GRAVA_AGENDAMENTO.FormCreate(Sender: TObject);
begin

  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
  with ADOQUERY_PACIENTE do
  begin
    Active := false ;
    Active := true ;
  end;
  with ADOQUERY_DENTISTA do
  begin
    Active := false ;
    Active := true ;
  end;
  with ADOQUERY_TRATAMENTO do
  begin
    Active := false ;
    Active := true ;
  end;

end;

procedure TFORM_GRAVA_AGENDAMENTO.FormShow(Sender: TObject);
begin
  with ADOQUERY_PACIENTE do
  begin
    Active := false ;
    Active := true ;
  end;
  with ADOQUERY_DENTISTA do
  begin
    Active := false ;
    Active := true ;
  end;
  with ADOQUERY_TRATAMENTO do
  begin
    Active := false ;
    Active := true ;
  end;
  Image2Click(self);
end;

procedure TFORM_GRAVA_AGENDAMENTO.Image2Click(Sender: TObject);
begin
  Memo1.Clear;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1 ;
  DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue := -1 ;
  ADOQUERY_PACIENTE.First;
  DBGrid1.SetFocus;
end;

procedure TFORM_GRAVA_AGENDAMENTO.Image3Click(Sender: TObject);
begin

  FORM_GRAVA_AGENDAMENTO.Close;

end;

procedure TFORM_GRAVA_AGENDAMENTO.Image3MouseLeave(Sender: TObject);
begin
  Image3.Visible := FALSE ;
end;

procedure TFORM_GRAVA_AGENDAMENTO.Image4MouseEnter(Sender: TObject);
begin
  Image3.Visible := TRUE ;
end;

procedure TFORM_GRAVA_AGENDAMENTO.Image7Click(Sender: TObject);
VAR
  dia_c , mes_c , ano_c , hora_c : STRING;
  dia_cons, ano_cons, mes_cons, hora_cons : STRING;
begin

  if ADOQUERY_PACIENTECOD_PACIENTE.Value = 0 then
  begin
    Application.MessageBox('Selecione um paciente!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue=0) then
  begin
    Application.MessageBox('Selecione um dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;

  if VarIsNull(DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue=0) then
  begin
    Application.MessageBox('Selecione um tratamento!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_TRATAMENTO.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text = EmptyStr) or (MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Digite uma data!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if (MaskEdit2.Text = EmptyStr) or (MaskEdit2.Text='  :  ') then
  begin
    Application.MessageBox('Digite uma hora!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_AGENDAMENTO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

  dia_cons := Copy(MaskEdit1.Text,1,2);
  mes_cons := Copy(MaskEdit1.Text,4,2);
  ano_cons := Copy(MaskEdit1.Text,7,4);
  hora_cons := MaskEdit2.Text;

  GRAVA_AGENDAMENTO.Parameters.ParamByName('@DATAHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;


  GRAVA_AGENDAMENTO.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTECOD_PACIENTE.AsInteger;
  GRAVA_AGENDAMENTO.Parameters.ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;
  GRAVA_AGENDAMENTO.Parameters.ParamByName('@TRATAMENTO').Value := DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue;
  GRAVA_AGENDAMENTO.Parameters.ParamByName('@CONSULTA').Value := '0';
  GRAVA_AGENDAMENTO.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;


  ADOQUERY_BUSCA.Close;
  ADOQUERY_BUSCA.Parameters.ParamByName('DTHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;
  ADOQUERY_BUSCA.Parameters.ParamByName('DENTISTA').Value :=  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;
  ADOQUERY_BUSCA.Open;

  if ADOQUERY_BUSCA.RecordCount>0 then
  begin
    Application.MessageBox('J� existe um agendamento para esse hor�rio', 'ATEN��O!', MB_ICONERROR);
    MaskEdit2.Clear;
    MaskEdit2.SetFocus;
    exit;
  end;


  if Application.MessageBox('Tem certeza que deseja cadastrar o pr�-agendamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_AGENDAMENTO.ExecProc;

    WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Agendamento n� ' + IntToStr(GRAVA_AGENDAMENTO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado';
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger ;
      Parameters.ParamByName('@DTHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;
      ExecProc;
    end;

    Application.MessageBox('Agendamento cadastrado!', 'AVISO', MB_OK);
    Image2Click(SELF);
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_AGENDAMENTO.Memo1KeyPress(Sender: TObject; var Key: Char);
begin

  KEY := UpCase(KEY);
  if key = #13 then
  begin

  Image7Click(SELF);

  end;

end;

procedure TFORM_GRAVA_AGENDAMENTO.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
