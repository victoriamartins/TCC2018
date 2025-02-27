unit UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, Mask, DBCtrls,
  pngimage;

type
  TFORM_GRAVA_PAGAMENTO_APRAZO = class(TForm)
    Timer1: TTimer;
    ADOQUERY_PACIENTE: TADOQuery;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    GRAVA_PAGAMENTO_APRAZO: TADOStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLOOKUPCOMBOBOX_DENTISTA: TDBLookupComboBox;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    RadioGroup2: TRadioGroup;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Edit2: TEdit;
    DATASOURCE_DENTISTA: TDataSource;
    ADOQUERY_DENTISTA: TADOQuery;
    ADOQUERY_DENTISTACOD_DENTISTA: TAutoIncField;
    ADOQUERY_DENTISTANOME_DENTISTA: TStringField;
    ADOQUERY_DENTISTASEXO_DENTISTA: TStringField;
    ADOQUERY_DENTISTACRO_DENTISTA: TStringField;
    ADOQUERY_DENTISTAEMAIL_DENTISTA: TStringField;
    ADOQUERY_DENTISTASTATUS_DENTISTA: TStringField;
    ADOQUERY_DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    Image1: TImage;
    Image7: TImage;
    Image2: TImage;
    DS_PACIENTE: TDataSource;
    Edit3: TEdit;
    Label6: TLabel;
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
    GRAVA_LOG: TADOStoredProc;
    CAIXA_AUTOMATICO: TADOStoredProc;
    Image3: TImage;
    Image10: TImage;
    Image9: TImage;
    lbl_data: TLabel;
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure ADOQUERY_PACIENTEMENORDE18ANOSGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ADOQUERY_PACIENTESTATUS_PACIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ADOQUERY_PACIENTEOBS_PACIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_PAGAMENTO_APRAZO: TFORM_GRAVA_PAGAMENTO_APRAZO;

implementation

uses Unit_TELA_PRINCIPAL, Unit_CONS_PAGAM_APRAZO;

{$R *.dfm}

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.ADOQUERY_PACIENTEMENORDE18ANOSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQUERY_PACIENTEMENORDE18ANOS.AsBoolean = TRUE then
  begin
    Text := 'MENOR DE 18';
  end
  else
  begin
    Text := 'MAIOR DE 18';
  end;

end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.ADOQUERY_PACIENTEOBS_PACIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  Text := Copy(ADOQUERY_PACIENTEOBS_PACIENTE.AsString,1,200);

end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.ADOQUERY_PACIENTESTATUS_PACIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQUERY_PACIENTESTATUS_PACIENTE.AsBoolean = TRUE then
  begin
    Text := 'ATIVO' ;
  end
  else
  begin
    Text := 'INATIVO' ;
  end;


end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit1Change(Sender: TObject);
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

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit1DblClick(Sender: TObject);
begin
  Edit1.SelStart := Length(Edit1.text) ;
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if NOT (Key in ['0'..'9', #8, #9]) then
  begin
    key := #0;
  end;
    Edit1.SelStart := Length(Edit1.text);
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin

  Key := UpCase(KEY);

end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit3Change(Sender: TObject);
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

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Edit3Enter(Sender: TObject);
begin

  Edit3.Clear;

end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.FormShow(Sender: TObject);
begin

  ADOQUERY_PACIENTE.Active := FALSE ;
  ADOQUERY_PACIENTE.Active := TRUE  ;
  ADOQUERY_DENTISTA.Active := FALSE ;
  ADOQUERY_DENTISTA.Active := TRUE  ;
  Image2Click(SELF);

end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Image10MouseEnter(Sender: TObject);
begin
Image9.Visible := TRUE ;
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Image2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := -1;
  RadioGroup2.ItemIndex := -1;
  Edit1.Clear;
  Edit2.Clear;
  Edit2.Visible := false;
  //ADOQUERY_PACIENTE_MENOR.Active := false;
  //ADOQUERY_PACIENTE_MAIOR.Active := false;
  DBLOOKUPCOMBOBOX_DENTISTA.KeyValue := -1;
  MaskEdit1.Clear;
  Memo1.Lines.Text := '';
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Image7Click(Sender: TObject);
var
  dia, mes, ano: string;
  dia_c, mes_c, ano_c, hora_c: string;
  data_mask, data_lbl : string;
begin

  if VarIsNull(DBLOOKUPCOMBOBOX_DENTISTA.KeyValue) then
  begin
    Application.MessageBox('Selecione o dentista!', 'Aten��o!', MB_ICONWARNING);
    DBLOOKUPCOMBOBOX_DENTISTA.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text = '') or (MaskEdit1.Text = '  /  /    ') then
  begin
    Application.MessageBox('Preencha a data do pagamento!', 'Aten��o!',
      MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if RadioGroup2.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo de pagamento!', 'Aten��o!',
      MB_ICONWARNING);
    Exit;
  end;

  if (RadioGroup2.ItemIndex = 3) and (Edit2.Text = '') then
  begin
    Application.MessageBox(
      'Se o tipo de pagamento for "OUTROS" voc� deve preencher o campo "OUTROS"!'
        , 'Aten��o!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if (Edit1.Text = '') or (Edit1.Text = '0,00') then
  begin
    Application.MessageBox('Digite o valor do pagamento a vista!', 'Aten��o!',
      MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox('Escolha o status do pagamento!', 'Aten��o!',
      MB_ICONWARNING);
    RadioGroup1.SetFocus;
    Exit;
  end;

  dia := Copy(MaskEdit1.Text, 1, 2);
  mes := Copy(MaskEdit1.Text, 4, 2);
  ano := Copy(MaskEdit1.Text, 7, 4);
  data_mask := ano + mes + dia ;

  dia_c := Copy(lbl_data.Caption, 1, 2);
  mes_c := Copy(lbl_data.Caption, 4, 2);
  ano_c := Copy(lbl_data.Caption, 7, 4);
  hora_c := Copy(lbl_data.Caption, 14, 8);
  data_lbl := ano_c + mes_c + dia_c ;

  {if ADOQUERY_PACIENTE_MENOR.Active = true then
  begin
        with GRAVA_PAGAMENTO_APRAZO.Parameters do
        begin
          ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTE_MENORCOD_PACIENTE.AsInteger;
        end;
  end

  else if ADOQUERY_PACIENTE_MAIOR.Active = true then
  begin
        with GRAVA_PAGAMENTO_APRAZO.Parameters do
        begin
          ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTE_MAIORCOD_PACIENTE.AsInteger;
        end;
  end;}

  GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@PACIENTE').Value := ADOQUERY_PACIENTECOD_PACIENTE.AsInteger;

  with GRAVA_PAGAMENTO_APRAZO.Parameters do
  begin
    ParamByName('@DENTISTA').Value := DBLOOKUPCOMBOBOX_DENTISTA.KeyValue;
    ParamByName('@VALOR').Value := Edit1.Text;
    ParamByName('@DATAPAGAMENTO').Value := ano + '-' + mes + '-' + dia ;
    ParamByName('@OBS').Value := Memo1.Lines.Text;
    ParamByName('@DTHORA_CADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c ;
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@TIPO').Value := 'CART�O' ;
  end
  else if RadioGroup2.ItemIndex = 1 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@TIPO').Value := 'CHEQUE' ;
  end
  else if RadioGroup2.ItemIndex = 2 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@TIPO').Value := 'DINHEIRO' ;
  end
  else if RadioGroup2.ItemIndex = 3 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@TIPO').Value := Edit2.Text ;
  end;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@STATUS').Value := '1';
  end
  else if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@STATUS').Value := '0';
  end;



  if Application.MessageBox('Tem certeza que deseja cadastrar o pagamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_PAGAMENTO_APRAZO.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Pag. � prazo n� ' + INTTOSTR(GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

        if RadioGroup1.ItemIndex = 0 then
        begin
          with CAIXA_AUTOMATICO.Parameters do
          begin
            ParamByName('@DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
            ParamByName('@ENTRADA').Value := Edit1.Text;
            ParamByName('@SAIDA').Value := '0,00';
            ParamByName('@DTCADASTRO').Value := ano_c + '-' + mes_c + '-' + dia_c ;
            ParamByName('@AVISTA').Value := NULL;
            ParamByName('@APRAZO').Value := GRAVA_PAGAMENTO_APRAZO.Parameters.ParamByName('@RETURN_VALUE').Value;
            ParamByName('@PARCELA').Value := NULL;
            ParamByName('@DESPESA').Value := NULL;
          end;
          CAIXA_AUTOMATICO.ExecProc;
        end;


    Application.MessageBox('Pagamento cadastrado!', 'AVISO', MB_OK);
    Image2Click(SELF);
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Image9Click(Sender: TObject);
begin
    UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO.FORM_GRAVA_PAGAMENTO_APRAZO.Close;

    Unit_CONS_PAGAM_APRAZO.Form_CONS_PAGAM_APRAZO.ADOQuery1.Active := FALSE;
    Unit_CONS_PAGAM_APRAZO.Form_CONS_PAGAM_APRAZO.ADOQuery1.Active := TRUE;
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Image9MouseLeave(Sender: TObject);
begin
IMAGE9.Visible := FALSE
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Memo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(KEY);
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.RadioGroup1Click(Sender: TObject);
begin
  {[if RadioGroup1.ItemIndex = 0 then
  begin
    ADOQUERY_PACIENTE_MAIOR.Active := true;
    DBGrid1.DataSource := DATASOURCE_PACIENTE_MAIOR;
    ADOQUERY_PACIENTE_MENOR.Active := false;
  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
    ADOQUERY_PACIENTE_MENOR.Active := true;
    DBGrid1.DataSource := DATASOURCE_PACIENTE_MENOR;
    ADOQUERY_PACIENTE_MAIOR.Active := false;
  end;}
end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.RadioGroup2Click(Sender: TObject);
begin

  if RadioGroup2.ItemIndex = 3 then
  begin
    Edit2.Visible := true ;
    Label5.Visible := true ;
  end
  else
  begin
    Edit2.Visible := false ;
    Label5.Visible := false ;
  end;


end;

procedure TFORM_GRAVA_PAGAMENTO_APRAZO.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
