unit Unit_FUNCIONARIOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ExtCtrls, StdCtrls, Grids, DBGrids, dblookup, DBCtrls,
  pngimage, jpeg, DB, ADODB, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_FUNCIONARIOS = class(TForm)
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
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Edit4: TEdit;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit11: TEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    RadioGroup4: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1COD_FUNCIONARIO: TAutoIncField;
    ADOQuery1NOME_FUNCIONARIO: TStringField;
    ADOQuery1SEXO_FUNCIONARIO: TStringField;
    ADOQuery1NASCIMENTO_FUNCIONARIO: TWideStringField;
    ADOQuery1RG_FUNCIONARIO: TStringField;
    ADOQuery1CPF_FUNCIONARIO: TStringField;
    ADOQuery1ENDERECO_FUNCIONARIO: TStringField;
    ADOQuery1EMAIL_FUNCIONARIO: TStringField;
    ADOQuery1CIDADE_FUNCION�RIO: TIntegerField;
    ADOQuery1TEL1_FUNCIONARIO: TStringField;
    ADOQuery1TEL2_FUNCIONARIO: TStringField;
    ADOQuery1STATUS_FUNCIONARIO: TBooleanField;
    ADOQuery1DTHORACADASTRO_FUNCIONARIO: TDateTimeField;
    DataSource1: TDataSource;
    ADOQueryCIDADE: TADOQuery;
    ADOQueryCIDADECD_CIDADE: TIntegerField;
    ADOQueryCIDADENM_CIDADE: TStringField;
    ADOQueryCIDADEES_CIDADE: TIntegerField;
    ADOQueryCIDADECP_CIDADE: TBooleanField;
    DataSource2: TDataSource;
    ADOStoredProc1: TADOStoredProc;
    Button1: TButton;
    Timer1: TTimer;
    lbl_data: TLabel;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    RV_FUNC: TRvDataSetConnection;
    PJ_FUNC: TRvProject;
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure LabelAtualizado(Sender : TObject);
    procedure Image7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FiltroTabela(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1STATUS_FUNCIONARIOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    i : integer ;
    Filtro : string ;
  end;

var
  Form_FUNCIONARIOS: TForm_FUNCIONARIOS;

implementation

uses UNIT_GRAVA_FUNCIONARIO, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_FUNCIONARIOS.FiltroTabela(Sender: TObject);   // usa la em baixo no RadioGroup2Click
begin

    if i=1 then // FILTRAR POR   NOME
    begin
       filtro := 'and NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    end;
    if i=2 then // FILTRAR POR   RG
    begin
       filtro := 'and RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    end;
    if i=3 then // FILTRAR POR   CPF
    begin
       filtro := 'and CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    end;
    if i=4 then // FILTRAR POR   EMAIL
    begin
       filtro := 'and EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    end;


end;

procedure TForm_FUNCIONARIOS.LabelAtualizado(Sender: TObject);
var    part1, part2, part3, part4: string;
    ano, mes, dia : string;
Begin
    Label13.Visible := TRUE;
    Label14.Visible := TRUE;
    Label15.Visible := TRUE;
    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;
    DBLookupComboBox1.Visible := false;
    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    Image7.Enabled := false;
    Edit1.Text := INTTOSTR(ADOQuery1COD_FUNCIONARIO.AsInteger);
        Label13.Caption := INTTOSTR(ADOQuery1COD_FUNCIONARIO.AsInteger);
    Edit2.Text := ADOQuery1NOME_FUNCIONARIO.AsString    ;
        label14.Caption :=  ADOQuery1NOME_FUNCIONARIO.AsString;
    part1 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,1,3);
    part2 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,4,3);
    part3 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,7,3);
    part4 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,10,2);
    MaskEdit3.Text := part1 + '.' + part2 + '.' + part3 + '-' + part4;
    Label18.Caption := part1 + '.' + part2 + '.' + part3 + '-' + part4;
      if ADOQuery1SEXO_FUNCIONARIO.AsString = 'M' then
      begin
         RadioGroup3.ItemIndex := 0  ;
         Label15.Caption := 'Maculino';
      end
      else if ADOQuery1SEXO_FUNCIONARIO.AsString = 'F' then
      BEGIN
         RadioGroup3.ItemIndex := 1;
         Label15.Caption := 'Feminino';
      END;

   ano := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,1,4   );
   mes := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,6,2   );
   dia := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,9,2   );
   MaskEdit1.Text := dia+'/'+mes+'/'+ano   ;
        label16.Caption := ADOQuery1NASCIMENTO_FUNCIONARIO.AsString;
   maskEdit2.Text := ADOQuery1RG_FUNCIONARIO.AsString  ;
        Label17.Caption := ADOQuery1RG_FUNCIONARIO.AsString;
   maskEdit3.Text := ADOQuery1CPF_FUNCIONARIO.AsString  ;
        Label18.Caption := ADOQuery1CPF_FUNCIONARIO.AsString;

   Edit3.Text := ADOQuery1ENDERECO_FUNCIONARIO.AsString  ;
        Label19.Caption := ADOQuery1ENDERECO_FUNCIONARIO.AsString;
   Edit4.Text := ADOQuery1EMAIL_FUNCIONARIO.AsString  ;
        Label21.Caption := ADOQuery1EMAIL_FUNCIONARIO.AsString;

   DBLookupComboBox1.KeyValue := ADOQuery1CIDADE_FUNCION�RIO.AsInteger;
        Label20.Caption := ADOQueryCIDADENM_CIDADE.AsString;

   MaskEdit4.Text := ADOQuery1TEL1_FUNCIONARIO.AsString;
        Label22.Caption := ADOQuery1TEL1_FUNCIONARIO.AsString;
   MaskEdit5.Text := ADOQuery1TEL2_FUNCIONARIO.AsString;
        Label23.Caption := ADOQuery1TEL2_FUNCIONARIO.AsString;

   if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = true then
   begin
     RadioGroup4.ItemIndex := 0;
     label24.Caption := 'Ativo';
   end
   else if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = false then
   begin
     RadioGroup4.ItemIndex := 1;
     label24.Caption := 'Inativo';
   end;
End;

procedure TForm_FUNCIONARIOS.MaskEdit1Exit(Sender: TObject);
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
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 10 then
  begin
     Application.MessageBox('Preencha todos os d�gitos da data!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit1.SetFocus;
  end;
end;

procedure TForm_FUNCIONARIOS.MaskEdit2Exit(Sender: TObject);
const
   caracteres = '0123456789/';
var
   i, cont: byte;
   digitos: string;

begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit2.Text));

  if digitos <> '' then
  begin
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 9 then
  begin
     Application.MessageBox('Preencha todos os d�gitos do RG!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit2.SetFocus;
  end;
end;

procedure TForm_FUNCIONARIOS.MaskEdit3Exit(Sender: TObject);
const
   caracteres = '0123456789/';
var
   i, cont: byte;
   digitos: string;

begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit3.Text));

  if digitos <> '' then
  begin
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 11 then
  begin
     Application.MessageBox('Preencha todos os d�gitos do CPF!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit3.SetFocus;
  end;

end;

procedure TForm_FUNCIONARIOS.MaskEdit4Exit(Sender: TObject);
const
   caracteres = '0123456789/';
var
   i, cont: byte;
   digitos: string;

begin
  cont := 0;
  digitos := LowerCase(Trim(MaskEdit4.Text));

  if digitos <> '' then
  begin
     for i := 0 to Length(digitos) do
     begin
        if Pos(digitos[i], caracteres) <> 0 then
        inc(cont); // cont := cont + 1
     end;
  end;

  if cont < 11 then
  begin
     Application.MessageBox('Preencha todos os d�gitos do Telefone!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit4.SetFocus;
  end;
end;

procedure TForm_FUNCIONARIOS.RadioGroup1Click(Sender: TObject);
begin
    Edit11.Enabled := true;
end;

procedure TForm_FUNCIONARIOS.RadioGroup2Click(Sender: TObject);
var
NOME, RG, CPF, EMAIL : STRING;
begin

    NOME :=  'NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    RG :=    'RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    CPF :=   'CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
    EMAIL := 'EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //s� o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 0';
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 0 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 1 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

         if RadioGroup1.ItemIndex = 1 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 0 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 1 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

         if RadioGroup1.ItemIndex = 2 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 0 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 1 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

         if RadioGroup1.ItemIndex = 3 then
         Begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 0 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO = 1 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

    end;



end;

procedure TForm_FUNCIONARIOS.Timer1Timer(Sender: TObject);
begin
  lbl_data.Caption := datetostr(date) + ' | ' + timetostr(time);
end;

procedure TForm_FUNCIONARIOS.ADOQuery1STATUS_FUNCIONARIOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = TRUE then
  begin
    Text := 'ATIVO';
  end;
  if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = FALSE then
  begin
    Text := 'INATIVO';
  end;

end;

procedure TForm_FUNCIONARIOS.Button1Click(Sender: TObject);
begin
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0 ;
    Edit11.Clear ;
    Edit11.Enabled := false ;
    Edit11Change(self);
    RadioGroup2Click(self);

end;

procedure TForm_FUNCIONARIOS.DBGrid1CellClick(Column: TColumn);
VAR
    dia, mes, ano, hora : string ;
   part1, part2, part3, part4: string;
begin


    Label13.Visible := TRUE;
    Label14.Visible := TRUE;
    Label15.Visible := TRUE;
    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;
    DBLookupComboBox1.Visible := false;
    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    Image7.Enabled := false;

    //ShowMessage( ADOQuery1CPF_FUNCIONARIO.AsString );
    part1 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,1,3);
    part2 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,4,3);
    part3 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,7,3);
    part4 := Copy(ADOQuery1CPF_FUNCIONARIO.AsVariant,10,2);
    MaskEdit3.Text := part1  + part2 + part3 + part4;
    Label18.Caption := part1 + '.' + part2 + '.' + part3 + '-' + part4;

    Edit1.Text := INTTOSTR(ADOQuery1COD_FUNCIONARIO.AsInteger);
        Label13.Caption := INTTOSTR(ADOQuery1COD_FUNCIONARIO.AsInteger);
    Edit2.Text := ADOQuery1NOME_FUNCIONARIO.AsString    ;
        label14.Caption :=  ADOQuery1NOME_FUNCIONARIO.AsString;

      if ADOQuery1SEXO_FUNCIONARIO.AsString = 'M' then
      begin
         RadioGroup3.ItemIndex := 0  ;
         Label15.Caption := 'MASCULINO';
      end
      else if ADOQuery1SEXO_FUNCIONARIO.AsString = 'F' then
      BEGIN
         RadioGroup3.ItemIndex := 1;
         Label15.Caption := 'FEMININO';
      END;

   ano := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,1,4   );
   mes := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,6,2   );
   dia := Copy(   ADOQuery1NASCIMENTO_FUNCIONARIO.AsString,9,2   );
   MaskEdit1.Text := dia+'/'+mes+'/'+ano   ;
        label16.Caption := ADOQuery1NASCIMENTO_FUNCIONARIO.AsString;
   maskEdit2.Text := ADOQuery1RG_FUNCIONARIO.AsString  ;
        Label17.Caption := ADOQuery1RG_FUNCIONARIO.AsString;
   Edit3.Text := ADOQuery1ENDERECO_FUNCIONARIO.AsString  ;
        Label19.Caption := ADOQuery1ENDERECO_FUNCIONARIO.AsString;
   Edit4.Text := ADOQuery1EMAIL_FUNCIONARIO.AsString  ;
        Label21.Caption := ADOQuery1EMAIL_FUNCIONARIO.AsString;
   DBLookupComboBox1.KeyValue := ADOQuery1CIDADE_FUNCION�RIO.AsInteger;
        Label20.Caption := ADOQueryCIDADENM_CIDADE.AsString;
   MaskEdit4.Text := ADOQuery1TEL1_FUNCIONARIO.AsString;
        Label22.Caption := ADOQuery1TEL1_FUNCIONARIO.AsString;
   MaskEdit5.Text := ADOQuery1TEL2_FUNCIONARIO.AsString;
        Label23.Caption := ADOQuery1TEL2_FUNCIONARIO.AsString;

   if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = true then
   begin
     RadioGroup4.ItemIndex := 0;
     label24.Caption := 'ATIVO';
   end
   else if ADOQuery1STATUS_FUNCIONARIO.AsBoolean = false then
   begin
     RadioGroup4.ItemIndex := 1;
     label24.Caption := 'INATIVO';
   end;

end;

procedure TForm_FUNCIONARIOS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_FUNCIONARIOS.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key<>#13 then
  begin
     Key := #0;
  end;

end;

procedure TForm_FUNCIONARIOS.Edit11Change(Sender: TObject);
begin

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 3 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=0 and NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=0 and RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=0 and CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=0 and EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=1 and NOME_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=1 and RG_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where STATUS_FUNCIONARIO=1 and CPF_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_FUNCIONARIO where   STATUS_FUNCIONARIO=1 and EMAIL_FUNCIONARIO like '+ QuotedStr(Edit11.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;

end;

procedure TForm_FUNCIONARIOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ADOQuery1.Active := false;
    ADOQuery1.Active := true;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
    DBGrid1.DataSource.DataSet.RecNo := 1; //ativar depois
    LabelAtualizado(self);
    end;
end;

procedure TForm_FUNCIONARIOS.FormCreate(Sender: TObject);
begin
  lbl_data.Caption := FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TForm_FUNCIONARIOS.FormShow(Sender: TObject);
begin
    ADOQuery1.Active := false;
    ADOQuery1.Active := true;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
    DBGrid1.DataSource.DataSet.RecNo := 1; //ativar depois
    LabelAtualizado(self);
    end;
end;

procedure TForm_FUNCIONARIOS.Image2MouseEnter(Sender: TObject);
begin
  Image3.Visible:=True;
end;

procedure TForm_FUNCIONARIOS.Image3Click(Sender: TObject);
begin
  Form_FUNCIONARIOS.Close;
end;

procedure TForm_FUNCIONARIOS.Image3MouseLeave(Sender: TObject);
begin
  Image3.Visible:=false;
end;

procedure TForm_FUNCIONARIOS.Image5Click(Sender: TObject);
begin
  FORM_GRAVA_FUNCIONARIO.ShowModal;
end;

procedure TForm_FUNCIONARIOS.Image6Click(Sender: TObject);
begin


    Label13.Visible := FALSE;
    Label14.Visible := FALSE;
    Label15.Visible := FALSE;
    Label16.Visible := FALSE;
    Label17.Visible := FALSE;
    Label18.Visible := FALSE;
    Label19.Visible := FALSE;
    Label20.Visible := FALSE;
    Label21.Visible := FALSE;
    Label22.Visible := FALSE;
    Label23.Visible := FALSE;
    Label24.Visible := FALSE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;

    MaskEdit1.Visible := true;
    MaskEdit2.Visible := true;
    MaskEdit3.Visible := true;
    MaskEdit4.Visible := true;
    MaskEdit5.Visible := true;

    DBLookupComboBox1.Visible := true;

    RadioGroup3.Visible := TRUE;
    RadioGroup4.Visible := TRUE;

    Image7.Enabled := true;
end;

procedure TForm_FUNCIONARIOS.Image7Click(Sender: TObject);
var
   dia_c , mes_c, ano_c, hora_c: string;
   MASK1, MASK2 : STRING;
   dia, mes, ano : string ;
   Cod_Funcionario_Alterado : integer;
   P1, P2, P3, P4 : STRING ;
begin

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

     if Edit1.Text = EmptyStr then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       exit;
     end;
     if Edit2.Text = EmptyStr then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       Edit2.SetFocus;
       exit;
     end;
     if Edit3.Text = EmptyStr then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       Edit3.SetFocus;
       exit;
     end;
     if Edit4.Text = EmptyStr then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       Edit4.SetFocus;
       exit;
     end;

     if MaskEdit1.Text = '__/__/____' then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       MaskEdit1.SetFocus;
       exit;
     end;
     if MaskEdit2.Text = '__.___.___-__' then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       MaskEdit1.SetFocus;
       exit;
     end;
     if MaskEdit3.Text = '___.___.___-__' then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       MaskEdit3.SetFocus;
       exit;
     end;
     if MaskEdit4.Text = '(__)_____-____' then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       MaskEdit4.SetFocus;
       exit;
     end;
     if MaskEdit5.Text = '(__)_____-____' then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       MaskEdit5.SetFocus;
       exit;
     end;

     if RadioGroup3.ItemIndex = -1 then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       RadioGroup3.SetFocus;
       exit;
     end;
     if RadioGroup4.ItemIndex = -1 then
     begin
       Application.MessageBox('Preencha Todos os Campos Para Poder Alterar!',
          'ATEN��O!',MB_ok + MB_ICONWARNING);
       RadioGroup4.SetFocus;
       exit;
     end;


    if Application.MessageBox('Tem certeza que deseja alterar o funcion�rio',
          'ATEN��O!',MB_YESNO+MB_ICONQUESTION) = IDYES then
    BEGIN

    ADOStoredProc1.Parameters.ParamByName('@CODIGO').Value :=  STRTOINT(Edit1.Text)   ;
    ADOStoredProc1.Parameters.ParamByName('@NOME').Value :=    Edit2.Text;

      if RadioGroup3.ItemIndex = 0 then
      BEGIN
       ADOStoredProc1.Parameters.ParamByName('@SEXO').Value :=   'M' ;
      END

      ELSE if RadioGroup3.ItemIndex = 1 then
      BEGIN
       ADOStoredProc1.Parameters.ParamByName('@SEXO').Value :=  'F'  ;
      END;


    dia := Copy(   MaskEdit1.Text,1,2  );
    mes := Copy(   MaskEdit1.Text,4,2   );
    ano := Copy(   MaskEdit1.Text,7,4   );
    ADOStoredProc1.Parameters.ParamByName('@NASCIMENTO').Value := ano+'-'+mes+'-'+dia    ;
    ADOStoredProc1.Parameters.ParamByName('@RG').Value := MaskEdit2.Text   ;
    ADOStoredProc1.Parameters.ParamByName('@CPF').Value := MaskEdit3.Text    ;
    ADOStoredProc1.Parameters.ParamByName('@ENDERECO').Value := Edit3.Text    ;
    ADOStoredProc1.Parameters.ParamByName('@EMAIL').Value := Edit4.Text  ;
    ADOStoredProc1.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue   ;
    ADOStoredProc1.Parameters.ParamByName('@TELEFONE').Value := MaskEdit4.Text   ;
    ADOStoredProc1.Parameters.ParamByName('@TELEFONE2').Value := MaskEdit5.Text   ;

       if RadioGroup4.ItemIndex = 0 then
       BEGIN
          ADOStoredProc1.Parameters.ParamByName('@STATUS').Value :=  1   ;
       END
       ELSE if RadioGroup4.ItemIndex = 1 then
       BEGIN
          ADOStoredProc1.Parameters.ParamByName('@STATUS').Value :=  0   ;
       END;

   Cod_Funcionario_Alterado := DBGrid1.DataSource.DataSet.RecNo  ;
    ADOStoredProc1.ExecProc;

    WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Funcion�rio n� ' + Edit1.Text + ' alterado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

    ADOQuery1.Active := FALSE;
    ADOQuery1.Active := TRUE;
    RadioGroup1.ItemIndex := -1 ;
    RadioGroup2.ItemIndex := 0  ;
    DBGrid1.DataSource.DataSet.RecNo :=  Cod_Funcionario_Alterado;
    LabelAtualizado(Self) ;


    ///// DBGrid1.SelectedIndex :=  SELCIONA COLUNA

    END

    ELSE
    BEGIN
      EXIT;
    END;


    Label13.Visible := TRUE;
    Label14.Visible := TRUE;
    Label15.Visible := TRUE;
    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;

    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;

    DBLookupComboBox1.Visible := false;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;

    Image7.Enabled := false;

    ADOQuery1.Active := FALSE ;
    ADOQuery1.Active := TRUE  ;
    RadioGroup2.ItemIndex := 0;
end;

procedure TForm_FUNCIONARIOS.Image8Click(Sender: TObject);
begin

    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_FUNC.Execute;

end;

end.
