unit UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, DBCtrls, DB, ADODB, Grids, DBGrids, Menus,
  Buttons, ComCtrls, jpeg, pngimage;

type
  TFORM_GRAVA_PAGAMENTO_AVISTA = class(TForm)
    Label1: TLabel;
    DBLOOKUPCOMBOBOX_DENTISTA: TDBLookupComboBox;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Timer1: TTimer;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    DATASOURCE_DENTISTA: TDataSource;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    RadioGroup2: TRadioGroup;
    Edit2: TEdit;
    Label4: TLabel;
    POPUP_PACIENTE: TPopupMenu;
    OQUEISSO3: TMenuItem;
    CADASTRARNOVOTRATAMENTO2: TMenuItem;
    POPUP_DENTISTA: TPopupMenu;
    OQUEISSO1: TMenuItem;
    CADASTRARNOVODENTISTA1: TMenuItem;
    POPUP_PAGAMENTO: TPopupMenu;
    OQUEISSO2: TMenuItem;
    GRAVA_PAGAMENTO_AVISTA: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    Image4: TImage;
    lbl_data: TLabel;
    GRAVA_LOG: TADOStoredProc;
    DS_PACIENTE: TDataSource;
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
    ADOQUERY_PACIENTENM_CIDADE: TStringField;
    ADOQUERY_PACIENTETEL1_PACIENTE: TStringField;
    ADOQUERY_PACIENTETEL2_PACIENTE: TStringField;
    ADOQUERY_PACIENTEMENORDE18ANOS: TBooleanField;
    ADOQUERY_PACIENTERESPONSAVEL_PACIENTE: TIntegerField;
    ADOQUERY_PACIENTEOBS_PACIENTE: TMemoField;
    ADOQUERY_PACIENTESTATUS_PACIENTE: TBooleanField;
    ADOQUERY_PACIENTEDTHORACADASTRO_PACIENTE: TDateTimeField;
    Edit3: TEdit;
    Label6: TLabel;
    Image3: TImage;
    Image2: TImage;
    Image7: TImage;
    Image10: TImage;
    Image9: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure OQUEISSO3Click(Sender: TObject);
    procedure CADASTRARNOVOTRATAMENTO2Click(Sender: TObject);
    procedure OQUEISSO1Click(Sender: TObject);
    procedure CADASTRARNOVODENTISTA1Click(Sender: TObject);
    procedure OQUEISSO2Click(Sender: TObject);
    procedure DBGrid1MouseEnter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_PAGAMENTO_AVISTA: TFORM_GRAVA_PAGAMENTO_AVISTA;

implementation

uses UNIT_GRAVA_PACIENTE, UNIT_GRAVA_DENTISTA, Unit_TELA_PRINCIPAL,
  Unit_CONS_PAGAM_AVISTA;

{$R *.dfm}

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.CADASTRARNOVODENTISTA1Click(
  Sender: TObject);
begin

  UNIT_GRAVA_DENTISTA.FORM_GRAVA_DENTISTA.ShowModal;

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.CADASTRARNOVOTRATAMENTO2Click(
  Sender: TObject);
begin

  UNIT_GRAVA_PACIENTE.FORM_GRAVA_PACIENTE.ShowModal;

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.DBGrid1MouseEnter(Sender: TObject);
begin
  {if (ADOQUERY_PACIENTE_MENOR.Active = false)and(ADOQUERY_PACIENTE_MAIOR.Active = false) then
  begin
    DBGrid1.Hint := 'SELECIONE O TIPO DE PACIENTE PARA QUE SEJAM LISTADOS'
  end
  else
  begin
    DBGrid1.Hint := '';
  end; }
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit1Change(Sender: TObject);
var
  s : string;
  v : double;
  I : integer;
begin
//1� Passo : se o edit estiver vazio, nada pode ser feito.
    If (edit1.Text = emptystr) then
      Begin
        Edit1.Text := '0,00';
        Exit;
      End;
    //2� Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
    s := '';
    for I := 1 to length(edit1.Text) do
        if (edit1.text[I] in ['0'..'9']) then
            s := s + edit1.text[I];

            //3� Passo : fazer com que o conte�do do edit apresente 2 casas decimais:
            v := strtofloat(s);
            v := (v /100); // para criar 2 casa decimais

            //4� Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
            edit1.text := FormatFloat('#####0.00',v);
            Edit1.SelStart := Length(Edit1.text) ;

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit1Click(Sender: TObject);
begin
  Edit1.SelStart := Length(Edit1.text) ;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;

  Edit1.SelStart := Length(Edit1.text);

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  KEY := UPCASE(Key);
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit3Change(Sender: TObject);
begin
  WITH ADOQUERY_PACIENTE DO
  BEGIN
    CLOSE;
    Active := FALSE;
    SQL.Clear;
    SQL.Add('SELECT COD_PACIENTE, NOME_PACIENTE, RG_PACIENTE, CPF_PACIENTE, SEXO_PACIENTE, NASCIMENTO_PACIENTE, ENDERECO_PACIENTE, EMAIL_PACIENTE,');
    SQL.Add(' CIDADE_PACIENTE, NM_CIDADE, TEL1_PACIENTE, TEL2_PACIENTE, MENORDE18ANOS, RESPONSAVEL_PACIENTE, OBS_PACIENTE, STATUS_PACIENTE, DTHORACADASTRO_PACIENTE');
    SQL.Add('FROM TB_PACIENTE, TB_CIDADE WHERE CD_CIDADE=CIDADE_PACIENTE AND STATUS_PACIENTE=1 AND NOME_PACIENTE LIKE '+ QuotedStr(Edit3.Text+'%'));
    Active := TRUE;
    OPEN;
  END;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Edit3Enter(Sender: TObject);
begin
  Edit3.Clear;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.FormShow(Sender: TObject);
var
  dia_c, mes_c, ano_c : string;
  dia, mes, ano : string;
begin
  //dia_c := Copy(lbl_data.Caption,1,10);
  //MaskEdit1.Text := dia_c ;
  with ADOQUERY_DENTISTA do
  begin
    close;
    open;
  end;
  with ADOQUERY_PACIENTE do
  begin
    close;
    open;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Image10MouseEnter(Sender: TObject);
begin
Image9.Visible := TRUE ;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Image2Click(Sender: TObject);
begin
  Edit1.Clear;
  RadioGroup2.ItemIndex := -1;
  //ADOQUERY_PACIENTE_MAIOR.Active := false;
  //ADOQUERY_PACIENTE_MENOR.Active := false;
  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1;
  MaskEdit1.Clear;
  Edit2.clear;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Image7Click(Sender: TObject);
var
    dia, mes, ano : string ;
      dia_c , mes_c, ano_c, hora_c: string;
begin

  {
  if (ADOQUERY_PACIENTE_MAIOR.Active = true)and(ADOQUERY_PACIENTE_MAIORCOD_PACIENTE.Value = 0) then
  begin
    Application.MessageBox('Selecione o paciente!', 'Aten��o!', MB_ICONWARNING);
    DBGrid1.SetFocus;
    Exit;
  end;

  if (ADOQUERY_PACIENTE_MENOR.Active = true)and(ADOQUERY_PACIENTE_MENORCOD_PACIENTE.Value = 0)  then
  begin
    Application.MessageBox('Selecione o paciente!', 'Aten��o!', MB_ICONWARNING);
    DBGrid1.SetFocus;
    Exit;
  end;

  if (ADOQUERY_PACIENTE_MAIOR.Active = false)and(ADOQUERY_PACIENTE_MENOR.Active = false) then
  begin
    Application.MessageBox('Selecione o paciente!', 'Aten��o!', MB_ICONWARNING);
    DBGrid1.SetFocus;
    Exit;
  end;}

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Selecione o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;


  if (MaskEdit1.Text='')or(MaskEdit1.Text='  /  /    ') then
  begin
    Application.MessageBox('Preencha a data do pagamento!', 'Aten��o!', MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if RadioGroup2.ItemIndex=-1 then
  begin
    Application.MessageBox('Selecione o tipo de pagamento!', 'Aten��o!', MB_ICONWARNING);
    Exit;
  end;

  if (RadioGroup2.ItemIndex=3)and(Edit2.Text='') then
  begin
    Application.MessageBox('Se o tipo de pagamento for "OUTROS" voc� deve preencher o campo "OUTROS"!', 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if (Edit1.Text='') or (Edit1.Text='0,00') then
  begin
    Application.MessageBox('Digite o valor do pagamento a vista!', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  dia := Copy(MaskEdit1.Text,1,2);
  mes := Copy(MaskEdit1.Text,4,2);
  ano := Copy(MaskEdit1.Text,7,4);

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);
  {
  if RadioGroup1.ItemIndex=0 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTE_MAIORCOD_PACIENTE.AsINTEGER;
  end
  else if RadioGroup1.ItemIndex=1 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTE_MENORCOD_PACIENTE.AsINTEGER;
  end;
  }

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTECOD_PACIENTE.AsInteger;
  if RadioGroup2.ItemIndex = 3 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@TIPO').Value := Edit2.Text;
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@TIPO').Value := 'CART�O';
  end;

  if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@TIPO').Value := 'CHEQUE';
  end;

  if RadioGroup2.ItemIndex = 2 then
  begin
    GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO';
  end;

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@VALOR').Value := Edit1.Text;

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@DATAPAGAMENTO').Value := ano+'-'+mes+'-'+dia;

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@STATUS').Value := 1;

  GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_PAGAMENTO_AVISTA.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;
        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pagamento � vista n� ' + INTTOSTR(GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

          with CAIXA_AUTOMATICO.Parameters do
          begin
            ParamByName('@DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
            ParamByName('@ENTRADA').Value := Edit1.Text ;
            ParamByName('@SAIDA').Value := '0.00';
            ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
          end;
          with CAIXA_AUTOMATICO.Parameters do
          begin
            ParamByName('@AVISTA').Value := GRAVA_PAGAMENTO_AVISTA.Parameters.ParamByName('@RETURN_VALUE').Value;
            ParamByName('@APRAZO').Value := null;
            ParamByName('@PARCELA').Value := null;
            ParamByName('@DESPESA').Value := null;
          end;
          CAIXA_AUTOMATICO.ExecProc;

    Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);
    Image2Click(self);

  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Image9Click(Sender: TObject);
begin
  UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA.FORM_GRAVA_PAGAMENTO_AVISTA.Close;
  Unit_CONS_PAGAM_AVISTA.Form_CONS_PAGAM_AVISTA.ADOQuery1.Active := FALSE;
  Unit_CONS_PAGAM_AVISTA.Form_CONS_PAGAM_AVISTA.ADOQuery1.Active := TRUE;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Image9MouseLeave(Sender: TObject);
begin
Image9.Visible := FALSE;
end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.MaskEdit1Exit(Sender: TObject);
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

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.OQUEISSO1Click(Sender: TObject);
begin

    Application.MessageBox('Aqui voc� pode selecionar o dentista que receber� o pagamento!', 'Aten��o!', MB_ICONINFORMATION);

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.OQUEISSO2Click(Sender: TObject);
begin

    Application.MessageBox('Aqui voc� pode selecionar a forma que ser� efetuado o pagamento! Caso seja "OUTROS", clique na op��o "OUTROS" e preencha o campo que abrir�!',
                           'Aten��o!', MB_ICONINFORMATION);

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.OQUEISSO3Click(Sender: TObject);
begin

    Application.MessageBox('Aqui voc� pode selecionar o paciente que pagar�!', 'Aten��o!', MB_ICONINFORMATION);

end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.RadioGroup2Click(Sender: TObject);
begin

  if RadioGroup2.ItemIndex = 3 then
  begin
    Edit2.Visible := true;
    Label4.Visible := true;
  end

  else
  begin
    Edit2.Visible := false;
    Label4.Visible := false;
  end;


end;

procedure TFORM_GRAVA_PAGAMENTO_AVISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
