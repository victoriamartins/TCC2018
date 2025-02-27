unit UNIT_GRAVA_CONSULTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ADODB, ExtCtrls, StdCtrls, Mask, Grids, DBGrids, DBCtrls,
  jpeg, pngimage;

type
  TFORM_GRAVA_CONSULTA = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_agendamento: TLabel;
    Memo1: TMemo;
    DBLOOKUPCOMBOBOX_TRATAMENTO: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    DBLOOKUPCOMBOBOX_DENTISTA: TDBLookupComboBox;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Timer1: TTimer;
    ADOConnection1: TADOConnection;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    ADOQUERY_TRATAMENTO: TADOQuery;
    ADOQUERY_TRATAMENTOCOD_TRATAMENTO: TAutoIncField;
    ADOQUERY_TRATAMENTONOME_TRATAMENTO: TStringField;
    ADOQUERY_TRATAMENTOOBS_TRATAMENTO: TMemoField;
    ADOQUERY_TRATAMENTODTHORACADASTRO_TRATAMENTO: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    DATASOURCE_TRATAMENTO: TDataSource;
    GRAVA_CONSULTA: TADOStoredProc;
    POPUP_DENTISTA: TPopupMenu;
    OQUEISSO1: TMenuItem;
    CADASTRARNOVODENTISTA1: TMenuItem;
    POPUP_TRATAMENTO: TPopupMenu;
    OQUEISSO2: TMenuItem;
    CADASTRARNOVOTRATAMENTO1: TMenuItem;
    POPUP_PACIENTE: TPopupMenu;
    OQUEISSO3: TMenuItem;
    CADASTRARNOVOTRATAMENTO2: TMenuItem;
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
    ALTERA_BIT_AG: TADOStoredProc;
    ADOQUERY_BUSCA: TADOQuery;
    ADOQUERY_BUSCA_2: TADOQuery;
    Image1: TImage;
    lbl_data: TLabel;
    Image7: TImage;
    Image2: TImage;
    GRAVA_LOG: TADOStoredProc;
    Image6: TImage;
    Image9: TImage;
    Image10: TImage;
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLOOKUPCOMBOBOX_DENTISTAKeyPress(Sender: TObject; var Key: Char);
    procedure DBLOOKUPCOMBOBOX_TRATAMENTOKeyPress(Sender: TObject;
      var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_CONSULTA: TFORM_GRAVA_CONSULTA;

implementation

uses UNIT_SELECIONA_AGENDAMENTO, Unit_TELA_PRINCIPAL, Unit_MARCAR_CONSULTA;

{$R *.dfm}

procedure TFORM_GRAVA_CONSULTA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_GRAVA_CONSULTA.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.DBLOOKUPCOMBOBOX_DENTISTAKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.DBLOOKUPCOMBOBOX_TRATAMENTOKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with Unit_MARCAR_CONSULTA.Form_MARCA_CONSULTA.ADOQuery1 do
  begin
    Active := false ;
    Active := true  ;
  end;
end;

procedure TFORM_GRAVA_CONSULTA.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_CONSULTA.FormShow(Sender: TObject);
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

procedure TFORM_GRAVA_CONSULTA.Image10MouseEnter(Sender: TObject);
begin
Image9.Visible := TRUE;
end;

procedure TFORM_GRAVA_CONSULTA.Image2Click(Sender: TObject);
begin
  DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue := -1 ;
  RadioGroup2.ItemIndex := -1 ;
  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  Memo1.Lines.Clear;
  lbl_agendamento.Caption := '';
  DBLOOKUPCOMBOBOX_TRATAMENTO.Enabled := TRUE ;
  DBLOOKUPCOMBOBOX_DENTISTA.Enabled := TRUE;
  MaskEdit1.Enabled := TRUE ;
  MaskEdit2.Enabled := TRUE;
  DBGrid1.Enabled := TRUE ;
  Memo1.Enabled := TRUE ;
  RadioGroup2.SetFocus;
end;

procedure TFORM_GRAVA_CONSULTA.Image3Click(Sender: TObject);
begin
 FORM_GRAVA_CONSULTA.Close;
end;

procedure TFORM_GRAVA_CONSULTA.Image7Click(Sender: TObject);
var
  dia_c , mes_c , ano_c , hora_c : STRING;
  dia_cons, ano_cons, mes_cons, hora_cons : STRING;
begin
  if RadioGroup2.ItemIndex = -1 then
  BEGIN
    Application.MessageBox('Escolha se houve pr� agendamento!', 'Aten��o!', MB_ICONWARNING);
    RadioGroup2.SetFocus;
    Exit;
  END;

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Selecione o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;

  if VarIsNull(DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue) then
  begin
    Application.MessageBox('Selecione o tratamento!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_TRATAMENTO.SetFocus;
    Exit;
  end;

  if (RadioGroup2.ItemIndex = 0)and(lbl_agendamento.Caption='') then
  begin
    Application.MessageBox('Selecione o pr�-agendamento dessa consulta!', 'Aten��o!', MB_ICONWARNING);
    RadioGroup2.SetFocus;
    Exit;
  end;


  GRAVA_CONSULTA.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTECOD_PACIENTE.AsInteger ;

  GRAVA_CONSULTA.Parameters.ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;

  GRAVA_CONSULTA.Parameters.ParamByName('@TRATAMENTO').Value := DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue;

  GRAVA_CONSULTA.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

 GRAVA_CONSULTA.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

 dia_cons := Copy(MaskEdit1.Text,1,2);
 mes_cons := Copy(MaskEdit1.Text,4,2);
 ano_cons := Copy(MaskEdit1.Text,7,4);
 hora_cons := MaskEdit2.Text;

 GRAVA_CONSULTA.Parameters.ParamByName('@DATAHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;

 if RadioGroup2.ItemIndex = 0 then
 begin
   GRAVA_CONSULTA.Parameters.ParamByName('@PREAGENDADO').Value := Edit1.Text;
   ALTERA_BIT_AG.Parameters.ParamByName('@CODIGO').Value := Edit1.Text;
 end

 else if RadioGroup2.ItemIndex = 1 then
 begin
   GRAVA_CONSULTA.Parameters.ParamByName('@PREAGENDADO').Value := null;


  ADOQUERY_BUSCA.Close;
  ADOQUERY_BUSCA.Parameters.ParamByName('DTHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;
  ADOQUERY_BUSCA.Parameters.ParamByName('DENTISTA').Value :=  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;
  ADOQUERY_BUSCA.Open;


  if ADOQUERY_BUSCA.RecordCount>0 then
  begin
    Application.MessageBox('J� existe um agendamento para esse hor�rio', 'ATEN��O!', MB_ICONERROR);
    exit;
  end;


  ADOQUERY_BUSCA_2.Close;
  ADOQUERY_BUSCA_2.Parameters.ParamByName('DTHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;
  ADOQUERY_BUSCA_2.Parameters.ParamByName('DENTISTA').Value :=  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;
  ADOQUERY_BUSCA_2.Open;

  if ADOQUERY_BUSCA_2.RecordCount>0 then
  begin
    Application.MessageBox('J� existe uma consulta para esse hor�rio', 'ATEN��O!', MB_ICONERROR);
    MaskEdit2.Clear;
    MaskEdit2.SetFocus;
    exit;
  end;
 end;

 if Application.MessageBox('Tem certeza que deseja cadastrar a consulta?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_CONSULTA.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Consulta n� ' + INTTOSTR(GRAVA_CONSULTA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrada.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

    ALTERA_BIT_AG.ExecProc;
    Application.MessageBox('Consulta cadastrada!', 'AVISO', MB_OK);
    Image2Click(self);

          with UNIT_SELECIONA_AGENDAMENTO.FORM_SELECIONA_AGENDAMENTO.ADOQUERY_AG DO
          begin
            CLOSE;
            Active:= FALSE;
            Active:= TRUE ;
            OPEN;
          end;
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_CONSULTA.Image9Click(Sender: TObject);
begin
UNIT_GRAVA_CONSULTA.FORM_GRAVA_CONSULTA.Close;
end;

procedure TFORM_GRAVA_CONSULTA.Image9MouseLeave(Sender: TObject);
begin
IMAGE9.Visible := FALSE;
end;

procedure TFORM_GRAVA_CONSULTA.MaskEdit1Exit(Sender: TObject);
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

procedure TFORM_GRAVA_CONSULTA.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     Image7Click(SELF);
  end;
end;

procedure TFORM_GRAVA_CONSULTA.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  begin
    DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue := -1 ;
    DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1;
    MaskEdit1.Clear;
    MaskEdit2.Clear;
    Memo1.Lines.Clear;
    lbl_agendamento.Caption := '';
    UNIT_SELECIONA_AGENDAMENTO.FORM_SELECIONA_AGENDAMENTO.ShowModal;
  end

  else if RadioGroup2.ItemIndex = 1 then
  begin
    DBLOOKUPCOMBOBOX_TRATAMENTO.KeyValue := -1 ;
    DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1;
    MaskEdit1.Clear;
    MaskEdit2.Clear;
    Memo1.Lines.Clear;
    lbl_agendamento.Caption := '';
    DBGrid1.DataSource.DataSet.RecNo := 1;
    DBLOOKUPCOMBOBOX_DENTISTA.Enabled := TRUE ;
    DBLOOKUPCOMBOBOX_TRATAMENTO.Enabled := TRUE ;
    Memo1.Enabled := TRUE ;
    MaskEdit1.Enabled := TRUE ;
    MaskEdit2.Enabled := TRUE ;
    DBGrid1.Enabled := TRUE ;
    Edit1.Clear;
    exit;
  end
end;

procedure TFORM_GRAVA_CONSULTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
