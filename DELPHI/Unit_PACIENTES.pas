unit Unit_PACIENTES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, dblookup, DBCtrls, jpeg,
  pngimage, DB, ADODB, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_PACIENTE = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit8: TEdit;
    Memo1: TMemo;
    Edit3: TEdit;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    RadioGroup3: TRadioGroup;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
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
    DataSource1: TDataSource;
    ADOQueryCIDADE: TADOQuery;
    ADOQueryCIDADECD_CIDADE: TIntegerField;
    ADOQueryCIDADENM_CIDADE: TStringField;
    ADOQueryCIDADEES_CIDADE: TIntegerField;
    ADOQueryCIDADECP_CIDADE: TBooleanField;
    DataSource2: TDataSource;
    ADOQueryRESPONSAVEL: TADOQuery;
    ADOQueryRESPONSAVELCOD_RESPONSAVEL: TAutoIncField;
    ADOQueryRESPONSAVELNOME_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELRG_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELCPF_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELSEXO_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELTEL_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELENDERECO_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELEMAIL_RESPONSAVEL: TStringField;
    ADOQueryRESPONSAVELCIDADE_RESPONSAVEL: TIntegerField;
    ADOQueryRESPONSAVELNASCIMENTO_RESPONSAVEL: TWideStringField;
    ADOQueryRESPONSAVELSTATUS_RESPONSAVEL: TBooleanField;
    ADOQueryRESPONSAVELDTHORACADASTRO_RESPONSAVEL: TDateTimeField;
    DataSource3: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    ADOStoredProc1: TADOStoredProc;
    Button1: TButton;
    ADOQuery1COD_PACIENTE: TAutoIncField;
    ADOQuery1NOME_PACIENTE: TStringField;
    ADOQuery1RG_PACIENTE: TStringField;
    ADOQuery1CPF_PACIENTE: TStringField;
    ADOQuery1SEXO_PACIENTE: TStringField;
    ADOQuery1NASCIMENTO_PACIENTE: TWideStringField;
    ADOQuery1ENDERECO_PACIENTE: TStringField;
    ADOQuery1EMAIL_PACIENTE: TStringField;
    ADOQuery1CIDADE_PACIENTE: TIntegerField;
    ADOQuery1TEL1_PACIENTE: TStringField;
    ADOQuery1TEL2_PACIENTE: TStringField;
    ADOQuery1MENORDE18ANOS: TBooleanField;
    ADOQuery1RESPONSAVEL_PACIENTE: TIntegerField;
    ADOQuery1OBS_PACIENTE: TMemoField;
    ADOQuery1STATUS_PACIENTE: TBooleanField;
    ADOQuery1DTHORACADASTRO_PACIENTE: TDateTimeField;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image8: TImage;
    Panel1: TPanel;
    QUERY_RESP: TADOQuery;
    DS_RESP: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    QUERY_RESPCOD_RESPONSAVEL: TAutoIncField;
    QUERY_RESPNOME_RESPONSAVEL: TStringField;
    QUERY_RESPRG_RESPONSAVEL: TStringField;
    QUERY_RESPCPF_RESPONSAVEL: TStringField;
    QUERY_RESPSEXO_RESPONSAVEL: TStringField;
    QUERY_RESPTEL_RESPONSAVEL: TStringField;
    QUERY_RESPENDERECO_RESPONSAVEL: TStringField;
    QUERY_RESPEMAIL_RESPONSAVEL: TStringField;
    QUERY_RESPCIDADE_RESPONSAVEL: TIntegerField;
    QUERY_RESPNASCIMENTO_RESPONSAVEL: TWideStringField;
    QUERY_RESPSTATUS_RESPONSAVEL: TBooleanField;
    QUERY_RESPDTHORACADASTRO_RESPONSAVEL: TDateTimeField;
    Edit5: TEdit;
    Label31: TLabel;
    imf: TImage;
    Label32: TLabel;
    GRAVA_LOG: TADOStoredProc;
    PACIENTES_RV: TRvDataSetConnection;
    PJ_PACIENTES: TRvProject;
    procedure Button1Click(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup4Click(Sender: TObject);
    procedure ADOQuery1OBS_PACIENTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1STATUS_PACIENTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1MENORDE18ANOSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Edit5Change(Sender: TObject);
    procedure Label32Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure imfClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure DBLookupComboBox2MouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PACIENTE: TForm_PACIENTE;

implementation

uses UNIT_GRAVA_PACIENTE, UNIT_SELECIONA_RESPONSAVEL, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_PACIENTE.ADOQuery1MENORDE18ANOSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1MENORDE18ANOS.ASBOOLEAN = TRUE then
  BEGIN
    Text := 'MENOR DE 18'
  END;
  if ADOQuery1MENORDE18ANOS.AsBoolean = FALSE then
  BEGIN
    Text := 'MAIOR DE 18'
  END;

end;

procedure TForm_PACIENTE.ADOQuery1OBS_PACIENTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(ADOQuery1OBS_PACIENTE.AsString,1,200);

end;

procedure TForm_PACIENTE.ADOQuery1STATUS_PACIENTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_PACIENTE.ASBOOLEAN = TRUE then
  begin
    TEXT := 'ATIVO';
  end;
  if ADOQuery1STATUS_PACIENTE.ASBOOLEAN = FALSE then
  begin
    TEXT := 'INATIVO';
  end;

end;

procedure TForm_PACIENTE.Button1Click(Sender: TObject);
begin

    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1 ;
    RadioGroup2.ItemIndex := 0

end;

procedure TForm_PACIENTE.Label32Click(Sender: TObject);
begin

  DBLookupComboBox2.KeyValue := -1 ;

end;

procedure TForm_PACIENTE.LabelAtualizado(Sender: TObject);
VAR
  ano, mes, dia : string;
  part1, part2, part3, part4: string;
begin

    if ADOQuery1CPF_PACIENTE.AsVariant <> NULL then
    begin

        part1 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,1,3);
        part2 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,4,3);
        part3 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,7,3);
        part4 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,10,2);
        MaskEdit2.Text := part1 + part2 + part3 + part4;
        Label19.Caption := part1 + '.' + part2 + '.' + part3 + '-' + part4;
    end
    else if ADOQuery1CPF_PACIENTE.AsString = EmptyStr then
    begin
      Label19.Caption := 'N�O POSSUI CPF!';
      MaskEdit2.Text := '___.___.___-__'  ;
    end;

    Edit1.Text := IntToStr(ADOQuery1COD_PACIENTE.AsInteger);
      Label16.Caption :=  IntToStr(ADOQuery1COD_PACIENTE.AsInteger);
    Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
      Label17.Caption := ADOQuery1NOME_PACIENTE.AsString;

    if ADOQuery1RG_PACIENTE.AsVariant <> NULL then
    begin
      if ADOQuery1RG_PACIENTE.AsString = '  .   .   - ' then
      begin
        MaskEdit1.Text := '__.___.___-_' ;
        Label18.Caption := 'N�O POSSUI RG!' ;
      end
      else
      begin
        MaskEdit1.Text := ADOQuery1RG_PACIENTE.AsString;
        Label18.Caption :=  ADOQuery1RG_PACIENTE.AsString;
      end;
    end
    else if ADOQuery1RG_PACIENTE.AsVariant = NULL then
    begin
      MaskEdit1.Text := '__.___.___-_' ;
      Label18.Caption := 'N�O POSSUI RG!' ;
    end;





    //MaskEdit2.Text := ADOQuery1CPF_PACIENTE.AsString;
      //bel19.Caption := ADOQuery1CPF_PACIENTE.AsString;

    if ADOQuery1SEXO_PACIENTE.AsString = 'M' then
    begin
      RadioGroup3.ItemIndex := 0;
      Label20.Caption := 'MASCULINO' ;
    end
    else if ADOQuery1SEXO_PACIENTE.AsString = 'F' then
    begin
      RadioGroup3.ItemIndex := 1;
      Label20.Caption := 'FEMININO' ;
    end
        else
          exit;
   ano := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,1,4   );
   mes := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,6,2   );
   dia := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,9,2   );
    MaskEdit3.Text :=  DIA+'/'+MES+'/'+ANO ;
      Label21.Caption := ADOQuery1NASCIMENTO_PACIENTE.AsString;
    Edit3.Text := ADOQuery1ENDERECO_PACIENTE.AsString;
      Label22.Caption := ADOQuery1ENDERECO_PACIENTE.AsString;
    Edit4.Text := ADOQuery1EMAIL_PACIENTE.AsString;
      Label23.Caption := ADOQuery1EMAIL_PACIENTE.AsString;
    DBLookupComboBox1.KeyValue := ADOQuery1CIDADE_PACIENTE.AsInteger ;
      Label24.Caption := ADOQueryCIDADENM_CIDADE.AsString;
    MaskEdit4.Text :=  ADOQuery1TEL1_PACIENTE.AsString;
      Label25.Caption := ADOQuery1TEL1_PACIENTE.AsString;
    MaskEdit5.Text :=  ADOQuery1TEL2_PACIENTE.AsString;
      Label26.Caption := ADOQuery1TEL2_PACIENTE.AsString;

    if ADOQuery1MENORDE18ANOS.AsBoolean = true then
    begin
      RadioGroup4.ItemIndex := 0;
      Label27.Caption := 'MENOR DE IDADE' ;
    end
    else if ADOQuery1MENORDE18ANOS.AsBoolean = false then
    begin
      RadioGroup4.ItemIndex := 1;
      Label27.Caption := 'MAIOR DE IDADE' ;
    end
        else
          exit;

    Memo1.Lines.Text := ADOQuery1OBS_PACIENTE.AsString;
      Label29.Caption := ADOQuery1OBS_PACIENTE.AsString;

    if ADOQuery1STATUS_PACIENTE.AsBoolean = FALSE then
    begin
      RadioGroup5.ItemIndex := 1;
      Label30.Caption := 'INATIVO' ;
    end
    else if ADOQuery1STATUS_PACIENTE.AsBoolean = TRUE then
    begin
      RadioGroup5.ItemIndex := 0;
      Label30.Caption := 'ATIVO' ;
    end
        else
          exit;


    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;
    Label25.Visible := TRUE;
    Label26.Visible := TRUE;
    Label27.Visible := TRUE;
    Label29.Visible := TRUE;
    Label30.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    DBLookupComboBox2.Visible := false;


    Memo1.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;

    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    RadioGroup5.Visible := FALSE;



    if ADOQuery1RESPONSAVEL_PACIENTE.AsString <> EmptyStr then
    BEGIN
      if Edit1.Visible = true then
      begin
          Label13.Visible := TRUE;
          DBLookupComboBox2.Visible := TRUE;
      end
      else if Label16.Visible = true then
      begin
          Label13.Visible := TRUE;
          Label28.Visible := TRUE;
      end;
      DBLookupComboBox2.KeyValue := ADOQuery1RESPONSAVEL_PACIENTE.AsString;
      Label28.Caption := ADOQueryRESPONSAVELNOME_RESPONSAVEL.AsString;
    END
    ELSE
    BEGIN
      DBLookupComboBox2.Visible := FALSE;
      Label13.Visible := FALSE;
      Label28.Visible := FALSE;
    END;
end;

procedure TForm_PACIENTE.MaskEdit1Exit(Sender: TObject);
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

  if cont < 8 then
  begin
     Application.MessageBox('Preencha todos os d�gitos do RG!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit1.SetFocus;
  end;

end;

procedure TForm_PACIENTE.MaskEdit2Exit(Sender: TObject);
const
   caracteres = '0123456789/';
var
   i, cont: byte;
   digitos: string;

begin
{  cont := 0;
  digitos := LowerCase(Trim(MaskEdit2.Text));

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
     MaskEdit2.SetFocus;
  end;}
end;

procedure TForm_PACIENTE.MaskEdit3Exit(Sender: TObject);
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

  if cont < 10 then
  begin
     Application.MessageBox('Preencha todos os d�gitos da Data!', 'Aten��o!', MB_ICONWARNING);
     MaskEdit3.SetFocus;
  end;

end;

procedure TForm_PACIENTE.MaskEdit4Exit(Sender: TObject);
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

procedure TForm_PACIENTE.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := true ;
end;

procedure TForm_PACIENTE.RadioGroup2Click(Sender: TObject);
var
NOME, RG, CPF, EMAIL : STRING;
begin

    NOME :=  'NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
    RG :=    'RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
    CPF :=   'CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
    EMAIL := 'EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //s� o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 0';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 0';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 1';
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 0 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 1 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 0 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 1 and '+NOME;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 0 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 1 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 0 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 1 and '+RG;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 0 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 1 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 0 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 1 and '+CPF;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 0 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE = 1 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 3 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 0 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 4 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS = 1 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

    end;
end;

procedure TForm_PACIENTE.RadioGroup4Click(Sender: TObject);
begin

    if RadioGroup4.ItemIndex = 0 then
    begin
      DBLookupComboBox2.Visible := true;
      Label13.Visible := true;
      Label28.Visible := true;
    end
    else if RadioGroup4.ItemIndex = 1 then
    begin
      DBLookupComboBox2.Visible := false;
      Label13.Visible := false;
      Label28.Visible := false;
    end
    else
      exit;

end;

procedure TForm_PACIENTE.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_PACIENTE.DBGrid1CellClick(Column: TColumn);
VAR
  ano, mes, dia : string;
  nasc, hoje: string ;
  dif : integer ;
   part1, part2, part3, part4: string;
begin

  LabelAtualizado(self);

{
    part1 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,1,3);
    part2 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,4,3);
    part3 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,7,3);
    part4 := Copy(ADOQuery1CPF_PACIENTE.AsVariant,10,2);

    MaskEdit2.Text := part1 + '.' + part2 + '.' + part3 + '-' + part4;
    Label19.Caption := part1 + '.' + part2 + '.' + part3 + '-' + part4;


    Edit1.Text := IntToStr(ADOQuery1COD_PACIENTE.AsInteger);
      Label16.Caption :=  IntToStr(ADOQuery1COD_PACIENTE.AsInteger);
    Edit2.Text := ADOQuery1NOME_PACIENTE.AsString;
      Label17.Caption := ADOQuery1NOME_PACIENTE.AsString;

    MaskEdit1.Text := ADOQuery1RG_PACIENTE.AsString;
      Label18.Caption :=  ADOQuery1RG_PACIENTE.AsString;
    MaskEdit2.Text := ADOQuery1CPF_PACIENTE.AsString;
      Label19.Caption := ADOQuery1CPF_PACIENTE.AsString;

    if ADOQuery1SEXO_PACIENTE.AsString = 'M' then
    begin
      RadioGroup3.ItemIndex := 0;
      Label20.Caption := 'Masculino' ;
    end
    else if ADOQuery1SEXO_PACIENTE.AsString = 'F' then
    begin
      RadioGroup3.ItemIndex := 1;
      Label20.Caption := 'Feminino' ;
    end
        else
          exit;
   ano := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,1,4   );
   mes := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,6,2   );
   dia := Copy(   ADOQuery1NASCIMENTO_PACIENTE.AsString,9,2   );
    MaskEdit3.Text :=  DIA+'/'+MES+'/'+ANO ;
      Label21.Caption := ADOQuery1NASCIMENTO_PACIENTE.AsString;
    Edit3.Text := ADOQuery1ENDERECO_PACIENTE.AsString;
      Label22.Caption := ADOQuery1ENDERECO_PACIENTE.AsString;
    Edit4.Text := ADOQuery1EMAIL_PACIENTE.AsString;
      Label23.Caption := ADOQuery1EMAIL_PACIENTE.AsString;
    DBLookupComboBox1.KeyValue := ADOQuery1CIDADE_PACIENTE.AsInteger ;
      Label24.Caption := ADOQueryCIDADENM_CIDADE.AsString;
    MaskEdit4.Text :=  ADOQuery1TEL1_PACIENTE.AsString;
      Label25.Caption := ADOQuery1TEL1_PACIENTE.AsString;
    MaskEdit5.Text :=  ADOQuery1TEL2_PACIENTE.AsString;
      Label26.Caption := ADOQuery1TEL2_PACIENTE.AsString;

    if ADOQuery1MENORDE18ANOS.AsBoolean = true then
    begin
      RadioGroup4.ItemIndex := 0;
      Label27.Caption := 'MENOR de idade' ;
    end
    else if ADOQuery1MENORDE18ANOS.AsBoolean = false then
    begin
      RadioGroup4.ItemIndex := 1;
      Label27.Caption := 'MAIOR de idade' ;
    end
        else
          exit;

    Memo1.Lines.Text := ADOQuery1OBS_PACIENTE.AsString;
      Label29.Caption := ADOQuery1OBS_PACIENTE.AsString;

    if ADOQuery1STATUS_PACIENTE.AsBoolean = FALSE then
    begin
      RadioGroup5.ItemIndex := 1;
      Label30.Caption := 'INATIVO' ;
    end
    else if ADOQuery1STATUS_PACIENTE.AsBoolean = TRUE then
    begin
      RadioGroup5.ItemIndex := 0;
      Label30.Caption := 'ATIVO' ;
    end
        else
          exit;


    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;
    Label25.Visible := TRUE;
    Label26.Visible := TRUE;
    Label27.Visible := TRUE;
    Label29.Visible := TRUE;
    Label30.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
    DBLookupComboBox2.Visible := false;


    Memo1.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;

    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    RadioGroup5.Visible := FALSE;


    nasc := Copy(ADOQuery1NASCIMENTO_PACIENTE.AsString,1,4);
    hoje := Copy(lbl_data.Caption, 7, 4);
    dif := StrToInt(hoje) - StrToInt(nasc);

    if ADOQuery1RESPONSAVEL_PACIENTE.AsString <> EmptyStr then
    BEGIN
      if Edit1.Visible = true then
      begin
          Label13.Visible := TRUE;
          DBLookupComboBox2.Visible := TRUE;
          if dif>=18 then
          begin
            Label32.Visible := true;
          end;
      end
      else if Label16.Visible = true then
      begin
          Label13.Visible := TRUE;
          Label28.Visible := TRUE;
          if dif>=18 then
          begin
            Label32.Visible := true;
          end;
      end;
      DBLookupComboBox2.KeyValue := ADOQuery1RESPONSAVEL_PACIENTE.AsString;
      Label28.Caption := ADOQueryRESPONSAVELNOME_RESPONSAVEL.AsString;
    END
    ELSE
    BEGIN
      DBLookupComboBox2.Visible := FALSE;
      Label13.Visible := FALSE;
      Label28.Visible := FALSE;
      Label32.Visible := false;
    END;



}
end;

procedure TForm_PACIENTE.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_PACIENTE.DBGrid2CellClick(Column: TColumn);
begin

  if Application.MessageBox('Tem certeza que deseja selecionar o respons�vel?','SELECIONAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    DBLookupComboBox2.KeyValue := QUERY_RESPCOD_RESPONSAVEL.AsInteger;
    Panel1.Visible := false ;
  end
  else
  begin
    Application.MessageBox('Um respons�vel deve ser selecionado', 'Aten��o!', MB_ICONWARNING);
  end;
end;

procedure TForm_PACIENTE.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key<>#13 then
  begin
     Key := #0;
  end;

end;

procedure TForm_PACIENTE.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key<>#13 then
  begin
     Key := #0;
  end;

end;

procedure TForm_PACIENTE.DBLookupComboBox2MouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
Panel1.Visible := true ;
end;

procedure TForm_PACIENTE.Edit5Change(Sender: TObject);
begin
  with QUERY_RESP do
  begin
    close;
    Active := false;
    SQL.Clear;
    sql.Add('SELECT * FROM TB_RESPONSAVEL  WHERE STATUS_RESPONSAVEL=1 and NOME_RESPONSAVEL LIKE ' + QuotedStr(Edit5.Text+'%'));
    Active := true;
    open;
  end;
end;

procedure TForm_PACIENTE.Edit8Change(Sender: TObject);
begin


    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 3 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=0 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where STATUS_PACIENTE=1 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   STATUS_PACIENTE=1 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
          if RadioGroup2.ItemIndex=3 then //Maiores
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=0 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   MENORDE18ANOS=0 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
          if RadioGroup2.ItemIndex=4 then //Menores
          begin
                      if RadioGroup1.ItemIndex = 0 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and NOME_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and RG_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where MENORDE18ANOS=1 and CPF_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_PACIENTE where   MENORDE18ANOS=1 and EMAIL_PACIENTE like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;

    end;

end;

procedure TForm_PACIENTE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    WITH ADOQuery1 DO
    BEGIN
      Active := FALSE ;
      Active := TRUE  ;
    END;
    WITH ADOQueryRESPONSAVEL DO
    BEGIN
      Active := FALSE ;
      Active := TRUE  ;
    END;

    QUERY_RESP.Active := false;
    QUERY_RESP.Active := true;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;
end;

procedure TForm_PACIENTE.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
  Panel1.Visible := false;
end;

procedure TForm_PACIENTE.FormShow(Sender: TObject);
begin
    WITH ADOQuery1 DO
    BEGIN
      Active := FALSE ;
      Active := TRUE  ;
    END;
    WITH ADOQueryRESPONSAVEL DO
    BEGIN
      Active := FALSE ;
      Active := TRUE  ;
    END;

    QUERY_RESP.Active := false;
    QUERY_RESP.Active := true;

    Button1Click(self);
    if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
    begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      LabelAtualizado(self);

    end;

end;

procedure TForm_PACIENTE.Image1MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TForm_PACIENTE.Image3Click(Sender: TObject);
begin
Unit_PACIENTES.Form_PACIENTE.Close;
end;

procedure TForm_PACIENTE.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible:=False;
end;

procedure TForm_PACIENTE.Image5Click(Sender: TObject);
begin
 with UNIT_GRAVA_PACIENTE.FORM_GRAVA_PACIENTE do
 begin
  ShowModal;
 end;

end;




procedure TForm_PACIENTE.Image6Click(Sender: TObject);
VAR
  ano, ano_d : string;
begin

    ano := Copy(lbl_data.Caption,7,4);
    ano_d := copy(ADOQuery1NASCIMENTO_PACIENTE.AsString,1,4);

    Image7.Enabled := true;
    Label16.Visible := FALSE;
    Label17.Visible := FALSE;
    Label18.Visible := FALSE;
    Label19.Visible := FALSE;
    Label20.Visible := FALSE;
    Label21.Visible := FALSE;
    Label22.Visible := FALSE;
    Label23.Visible := FALSE;
    Label24.Visible := FALSE;
    Label25.Visible := FALSE;
    Label26.Visible := FALSE;
    Label27.Visible := FALSE;
    Label28.Visible := FALSE;
    Label29.Visible := FALSE;
    Label30.Visible := FALSE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;
   {
    if ADOQuery1RESPONSAVEL_PACIENTE.AsVariant <> NULL then
    BEGIN
      Label13.Visible := TRUE;
      DBLookupComboBox2.Visible := TRUE;
      DBLookupComboBox2.KeyValue := ADOQuery1RESPONSAVEL_PACIENTE.AsString;
      Label28.Caption := ADOQueryRESPONSAVELNOME_RESPONSAVEL.AsString;
      Label32.Visible := TRUE ;
    END

    ELSE
    BEGIN
      DBLookupComboBox2.Visible := FALSE;
      Label13.Visible := FALSE;
      Label32.Visible := FALSE ;
      Label28.Visible := FALSE;
    END;
    }

    if ADOQuery1MENORDE18ANOS.AsBoolean = true then
    begin
      Label13.Visible := true ;
      Label28.Visible:= FALSE ;
      DBLookupComboBox2.Visible := true ;
      DBLookupComboBox2.KeyValue := ADOQuery1RESPONSAVEL_PACIENTE.AsInteger ;
        if StrToInt(ano)- StrToInt(ano_d) > 18 then
        begin
          Label32.Visible := true ;
        end;
    end
    else if ADOQuery1MENORDE18ANOS.AsBoolean = false  then
    begin
      Label13.Visible := false ;
      Label28.Visible:= false ;
      DBLookupComboBox2.Visible := false ;
      DBLookupComboBox2.KeyValue := -1 ;
      Label32.Visible := false ;
    end;


    Memo1.Visible := TRUE;

    DBLookupComboBox1.Visible := TRUE;

    MaskEdit1.Visible := TRUE;
    MaskEdit2.Visible := TRUE;
    MaskEdit3.Visible := TRUE;
    MaskEdit4.Visible := TRUE;
    MaskEdit5.Visible := TRUE;

    RadioGroup3.Visible := TRUE;
    RadioGroup4.Visible := TRUE;
    RadioGroup5.Visible := TRUE;




end;

procedure TForm_PACIENTE.Image7Click(Sender: TObject);
var
    dia_c , mes_c, ano_c, hora_c: string;
    ano, mes, dia: string;
    Cod_Paciente_Alterado : INTEGER;
    Cod_Paciente_selecionado : INTEGER;
begin

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

    if Application.MessageBox('Deseja alterar o paciente?','ATEN��O',MB_YESNO+MB_ICONQUESTION) = IDYES then
    BEGIN
          ADOStoredProc1.Parameters.ParamByName('@CODIGO').Value := Edit1.Text;
          ADOStoredProc1.Parameters.ParamByName('@NOME').Value := Edit2.Text;
          ADOStoredProc1.Parameters.ParamByName('@RG').Value := MaskEdit1.Text;
          ADOStoredProc1.Parameters.ParamByName('@CPF').Value := MaskEdit2.Text ;

          if RadioGroup3.ItemIndex = 0 then
          begin
            ADOStoredProc1.Parameters.ParamByName('@SEXO').Value := 'M'
          end
          else if RadioGroup3.ItemIndex = 1 then
          begin
            ADOStoredProc1.Parameters.ParamByName('@SEXO').Value :=  'F'
          end;
          ano := Copy(   MaskEdit3.Text,7,4   );
          mes := Copy(   MaskEdit3.Text,4,2   );
          dia := Copy(   MaskEdit3.Text,1,2   );
          ADOStoredProc1.Parameters.ParamByName('@NASCIMENTO').Value :=   ano+'-'+mes+'-'+dia;
          ADOStoredProc1.Parameters.ParamByName('@ENDERECO').Value :=     Edit3.Text;
          ADOStoredProc1.Parameters.ParamByName('@EMAIL').Value :=        Edit4.Text;
          ADOStoredProc1.Parameters.ParamByName('@CIDADE').Value :=       DBLookupComboBox1.KeyValue;
          ADOStoredProc1.Parameters.ParamByName('@TELEFONE').Value :=     MaskEdit4.Text;
          ADOStoredProc1.Parameters.ParamByName('@TELEFONE2').Value :=    MaskEdit5.Text;
          if RadioGroup4.ItemIndex = 0 then
          begin
           ADOStoredProc1.Parameters.ParamByName('@MENOR_DE_18').Value :=  1;
           ADOStoredProc1.Parameters.ParamByName('@RESPONSAVEL').Value :=  DBLookupComboBox2.KeyValue;
           Label13.Visible := false;
           DBLookupComboBox2.Visible := false ;
           Label28.Visible := false ;
          end
          else if RadioGroup4.ItemIndex = 1 then
          begin
           ADOStoredProc1.Parameters.ParamByName('@MENOR_DE_18').Value :=  0;
           ADOStoredProc1.Parameters.ParamByName('@RESPONSAVEL').Value :=  null;
           Label13.Visible := false;
           DBLookupComboBox2.Visible := false ;
           Label28.Visible := false ;
          end;

          ADOStoredProc1.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;
          if RadioGroup5.ItemIndex = 0 then
          begin
            ADOStoredProc1.Parameters.ParamByName('@STATUS').Value := 1;
          end
          else if RadioGroup5.ItemIndex = 1 then
          begin
            ADOStoredProc1.Parameters.ParamByName('@STATUS').Value := 0;
          end;

          Cod_Paciente_selecionado := DBGrid1.DataSource.DataSet.RecNo;
          ADOStoredProc1.ExecProc;


          WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
          begin
            CLOSE;
            Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
            OPEN;
          end;

          with GRAVA_LOG do
          begin
            Parameters.ParamByName('@DESCRICAO').Value := 'Paciente n� ' + Edit1.Text + ' alterado.' ;
            Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
            Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;

          ADOQuery1.Active := FALSE;
          ADOQuery1.Active := TRUE;
          DBGrid1.DataSource.DataSet.RecNo := Cod_Paciente_selecionado;
          LabelAtualizado(Self);



    END
    ELSE
      EXIT;

    Label16.Visible := TRUE;
    Label17.Visible := TRUE;
    Label18.Visible := TRUE;
    Label19.Visible := TRUE;
    Label20.Visible := TRUE;
    Label21.Visible := TRUE;
    Label22.Visible := TRUE;
    Label23.Visible := TRUE;
    Label24.Visible := TRUE;
    Label25.Visible := TRUE;
    Label26.Visible := TRUE;
    Label27.Visible := TRUE;
    if ADOQuery1RESPONSAVEL_PACIENTE.AsInteger<>0 then
    begin
      Label28.Visible := TRUE;
    end
    else
    begin
      Label28.Visible := false;
    end;
    Label29.Visible := TRUE;
    Label30.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;
     if ADOQuery1RESPONSAVEL_PACIENTE.AsString<>EmptyStr then
    BEGIN
      DBLookupComboBox2.KeyValue := ADOQuery1RESPONSAVEL_PACIENTE.AsString;
      Label28.Caption := ADOQueryRESPONSAVELNOME_RESPONSAVEL.AsString;
    END
    ELSE
    BEGIN
      DBLookupComboBox2.Visible := FALSE;
    END;


    Memo1.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;

    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;
    MaskEdit5.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
    RadioGroup5.Visible := FALSE;

    Image7.Enabled := false;
end;

procedure TForm_PACIENTE.Image8Click(Sender: TObject);
begin

    Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
    PJ_PACIENTES.Execute;

end;

procedure TForm_PACIENTE.imfClick(Sender: TObject);
begin
Panel1.Visible := false ;
end;

end.
