unit Unit_RESPONSAVEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dblookup, Mask, StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls,
  pngimage, jpeg, ADODB, DB, RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_RESPONSAVEL = class(TForm)
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
    Edit3: TEdit;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    RadioGroup3: TRadioGroup;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    RadioGroup4: TRadioGroup;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MaskEdit4: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image4: TImage;
    Image7: TImage;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ALTERA_RESPONSAVEL: TADOStoredProc;
    DataSource2: TDataSource;
    ADOQuery1COD_RESPONSAVEL: TAutoIncField;
    ADOQuery1NOME_RESPONSAVEL: TStringField;
    ADOQuery1RG_RESPONSAVEL: TStringField;
    ADOQuery1CPF_RESPONSAVEL: TStringField;
    ADOQuery1SEXO_RESPONSAVEL: TStringField;
    ADOQuery1TEL_RESPONSAVEL: TStringField;
    ADOQuery1ENDERECO_RESPONSAVEL: TStringField;
    ADOQuery1EMAIL_RESPONSAVEL: TStringField;
    ADOQuery1CIDADE_RESPONSAVEL: TIntegerField;
    ADOQuery1NASCIMENTO_RESPONSAVEL: TWideStringField;
    ADOQuery1STATUS_RESPONSAVEL: TBooleanField;
    ADOQuery1DTHORACADASTRO_RESPONSAVEL: TDateTimeField;
    Button1: TButton;
    ADOQuery2: TADOQuery;
    ADOQuery2CD_CIDADE: TIntegerField;
    ADOQuery2NM_CIDADE: TStringField;
    ADOQuery2ES_CIDADE: TIntegerField;
    ADOQuery2CP_CIDADE: TBooleanField;
    ADOConnection1: TADOConnection;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    TESTE: TRvDataSetConnection;
    TESTEPJ: TRvProject;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure LabelAtualizado(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ADOQuery1STATUS_RESPONSAVELGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RESPONSAVEL: TForm_RESPONSAVEL;

implementation

uses UNIT_GRAVA_RESPONSAVEL, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_RESPONSAVEL.LabelAtualizado(Sender: TObject);
var
   ano, mes, dia: string;
   part1, part2, part3, part4: string;
begin
    part1 := Copy(ADOQuery1CPF_RESPONSAVEL.AsVariant,1,3);
    part2 := Copy(ADOQuery1CPF_RESPONSAVEL.AsVariant,4,3);
    part3 := Copy(ADOQuery1CPF_RESPONSAVEL.AsVariant,7,3);
    part4 := Copy(ADOQuery1CPF_RESPONSAVEL.AsVariant,10,2);

    MaskEdit2.Text := part1 + part2 + part3 + part4;
    Label19.Caption := part1 + '.' + part2 + '.' + part3 + '-' + part4;

    ano:= Copy(ADOQuery1NASCIMENTO_RESPONSAVEL.AsVariant,1,4);
    mes:= Copy(ADOQuery1NASCIMENTO_RESPONSAVEL.AsVariant,6,2);
    dia:= Copy(ADOQuery1NASCIMENTO_RESPONSAVEL.AsVariant,9,2);

    Edit1.Text:= IntToStr(ADOQuery1COD_RESPONSAVEL.AsInteger);
    Edit2.Text:= ADOQuery1NOME_RESPONSAVEL.AsString;
    MaskEdit1.Text:= ADOQuery1RG_RESPONSAVEL.AsString;
    //skEdit2.Text:= ADOQuery1CPF_RESPONSAVEL.AsString;
    MaskEdit3.Text:= ADOQuery1TEL_RESPONSAVEL.AsString;
    DBLookupComboBox1.KeyValue:= ADOQuery1CIDADE_RESPONSAVEL.AsInteger;
    MaskEdit4.Text:= dia+'/'+mes+'/'+ano;
    Edit3.Text:= ADOQuery1ENDERECO_RESPONSAVEL.AsString;
    Edit4.Text:= ADOQuery1EMAIL_RESPONSAVEL.AsString;

    // Label

    Label16.Caption:= IntToStr(ADOQuery1COD_RESPONSAVEL.AsInteger);
    Label17.Caption:= ADOQuery1NOME_RESPONSAVEL.AsString;
    Label18.Caption:= ADOQuery1RG_RESPONSAVEL.AsString;
    //Label19.Caption:= ADOQuery1CPF_RESPONSAVEL.AsString;

    if ADOQuery1SEXO_RESPONSAVEL.AsString = 'M' then
       begin
          RadioGroup3.ItemIndex:= 0;
          Label20.Caption:= 'Masculino';
       end

       else if ADOQuery1SEXO_RESPONSAVEL.AsString = 'F' then
       begin
          RadioGroup3.ItemIndex:= 1;
          Label20.Caption:= 'Feminino';
       end;

    Label21.Caption:= ADOQuery1TEL_RESPONSAVEL.AsString;
    Label22.Caption:= ADOQuery1ENDERECO_RESPONSAVEL.AsString;
    Label23.Caption:= ADOQuery1EMAIL_RESPONSAVEL.AsString;

    Label24.Caption:= ADOQuery2NM_CIDADE.AsString;

    Label25.Caption:= dia+'/'+mes+'/'+ano;
    {
    if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = False then
       begin
          RadioGroup4.ItemIndex:= 1;
          Label26.Caption:= 'Ativo';
       end

       else if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = True then
       begin
          RadioGroup4.ItemIndex:= 0;
          Label26.Caption:= 'Inativo';
       end;
     }

       if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = true then
       begin
         RadioGroup4.ItemIndex := 0 ;
         Label26.Caption:= 'Ativo';
       end
       else if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = false then
       begin
          RadioGroup4.ItemIndex:= 1;
          Label26.Caption:= 'Inativo';
       end;

       Edit1.Visible := FALSE ;
       Edit2.Visible := FALSE ;
       Edit3.Visible := FALSE ;
       Edit4.Visible := FALSE ;
       MaskEdit1.Visible := FALSE ;
       MaskEdit2.Visible := FALSE ;
       MaskEdit3.Visible := FALSE ;
       MaskEdit4.Visible := FALSE ;
       RadioGroup3.Visible := FALSE;
       RadioGroup4.Visible := FALSE ;
       DBLookupComboBox1.Visible := FALSE ;
       lABEL16.Visible := TRUE ;
       lABEL18.Visible := TRUE ;
       lABEL19.Visible := TRUE ;
       lABEL23.Visible := TRUE ;
       lABEL21.Visible := TRUE ;
       lABEL25.Visible := TRUE ;
       lABEL22.Visible := TRUE ;
       lABEL24.Visible := TRUE ;
       lABEL26.Visible := TRUE ;
       lABEL20.Visible := TRUE ;
       lABEL23.Visible := TRUE ;

end;


procedure TForm_RESPONSAVEL.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_RESPONSAVEL.RadioGroup2Click(Sender: TObject);
var
NOME, RG, CPF, EMAIL : STRING;
begin

    NOME :=  'NOME_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
    RG :=    'RG_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
    CPF :=   'CPF_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
    EMAIL := 'EMAIL_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //só o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 0';
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 1 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 0 and '+NOME;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 1 and '+RG;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 0 and '+RG;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 1 and '+CPF;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 0 and '+CPF;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.Open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 1 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL = 0 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
              exit;
         End;

    end;
end;

procedure TForm_RESPONSAVEL.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_RESPONSAVEL.ADOQuery1STATUS_RESPONSAVELGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = TRUE then
    begin
      Text := 'ATIVO';
    end;
    if ADOQuery1STATUS_RESPONSAVEL.AsBoolean = FALSE then
    begin
      Text := 'INATIVO';
    end;
end;

procedure TForm_RESPONSAVEL.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1 ;
    RadioGroup2.ItemIndex := 0;
end;

procedure TForm_RESPONSAVEL.Button2Click(Sender: TObject);
begin
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


    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;

    DBLookupComboBox1.Visible := TRUE;

    MaskEdit1.Visible := TRUE;
    MaskEdit2.Visible := TRUE;
    MaskEdit3.Visible := TRUE;
    MaskEdit4.Visible := TRUE;

    RadioGroup3.Visible := TRUE;
    RadioGroup4.Visible := TRUE;

end;

procedure TForm_RESPONSAVEL.Button3Click(Sender: TObject);
begin
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

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;

    DBLookupComboBox1.Visible := FALSE;

    MaskEdit1.Visible := FALSE;
    MaskEdit2.Visible := FALSE;
    MaskEdit3.Visible := FALSE;
    MaskEdit4.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;

end;

procedure TForm_RESPONSAVEL.DBGrid1CellClick(Column: TColumn);
begin

    LabelAtualizado(Self);
end;

procedure TForm_RESPONSAVEL.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_RESPONSAVEL.Edit8Change(Sender: TObject);
begin
   Edit8.Enabled := true ;

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where NOME_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where RG_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where CPF_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 3 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where EMAIL_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where NOME_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where RG_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where CPF_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where EMAIL_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=0 and NOME_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=0 and RG_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=0 and CPF_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=0 and EMAIL_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=1 and NOME_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=1 and RG_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where STATUS_RESPONSAVEL=1 and CPF_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 3 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_RESPONSAVEL where   STATUS_RESPONSAVEL=1 and EMAIL_RESPONSAVEL like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TForm_RESPONSAVEL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOQuery1.Active := FALSE ;
  ADOQuery1.Active := TRUE ;

  Button1Click(self);
  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
  begin
    DBGrid1.DataSource.DataSet.RecNo := 1;
    LabelAtualizado(self);
  end;
end;

procedure TForm_RESPONSAVEL.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TForm_RESPONSAVEL.FormShow(Sender: TObject);
begin

  ADOQuery1.Active := FALSE ;
  ADOQuery1.Active := TRUE ;

  Button1Click(self);
  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
  begin
    DBGrid1.DataSource.DataSet.RecNo := 1;
    LabelAtualizado(self);
  end;

end;

procedure TForm_RESPONSAVEL.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TForm_RESPONSAVEL.Image3Click(Sender: TObject);
begin
  Form_RESPONSAVEL.Close;
end;

procedure TForm_RESPONSAVEL.Image3MouseLeave(Sender: TObject);
begin
Image3.Visible:=False;
end;

procedure TForm_RESPONSAVEL.Image5Click(Sender: TObject);
begin
   FORM_GRAVA_RESPONSAVEL.ShowModal;
end;

procedure TForm_RESPONSAVEL.Image6Click(Sender: TObject);
begin
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


    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;

    DBLookupComboBox1.Visible := TRUE;

    Image7.Enabled := TRUE;

    MaskEdit1.Visible := TRUE;
    MaskEdit2.Visible := TRUE;
    MaskEdit3.Visible := TRUE;
    MaskEdit4.Visible := TRUE;

    RadioGroup3.Visible := TRUE;
    RadioGroup4.Visible := TRUE;

end;

procedure TForm_RESPONSAVEL.Image7Click(Sender: TObject);
var
  dia_c, mes_c, ano_c, hora_c : string;
  dia, mes, ano : string;
  cod_atualizacao : integer;
begin
 dia_c := Copy(lbl_data.Caption,1,2);
 mes_c := Copy(lbl_data.Caption,4,2);
 ano_c := Copy(lbl_data.Caption,7,4);
 hora_c := Copy(lbl_data.Caption,14,8);
  if Edit1.Text = '' then
  begin
    Application.MessageBox('Preencha o campo do código!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end

  else if Edit2.Text = '' then
  begin
    Application.MessageBox('Preencha o campo do nome!', 'Atenção!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end

  else if Edit3.Text = '' then
  begin
    Application.MessageBox('Preencha o campo do endereço!', 'Atenção!', MB_ICONWARNING);
    Edit3.SetFocus;
    Exit;
  end

  else if DBLookupComboBox1.KeyValue = null then
  begin
    Application.MessageBox('Preencha o campo da cidade!', 'Atenção!', MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
    Exit;
  end

  else if RadioGroup3.ItemIndex = -1 then
  begin
     Application.MessageBox('Preencha o campo do sexo!', 'Atenção!', MB_ICONWARNING);
     Exit;
  end

  else if RadioGroup4.ItemIndex = -1 then
  begin
     Application.MessageBox('Preencha o campo do status!', 'Atenção!', MB_ICONWARNING);
     Exit;
  end;




  if Application.MessageBox('Tem certeza que deseja alterar o responsável?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin

  ALTERA_RESPONSAVEL.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);
  ALTERA_RESPONSAVEL.Parameters.ParamByName('@NOME').Value := Edit2.Text;

  dia := Copy(MaskEdit4.Text,1,2);
  mes := Copy(MaskEdit4.Text,4,2);
  ano := Copy(MaskEdit4.Text,7,4);

  ALTERA_RESPONSAVEL.Parameters.ParamByName('@NASCIMENTO').Value := ano +'-'+ mes +'-'+ dia ;
  ALTERA_RESPONSAVEL.Parameters.ParamByName('@RG').Value := MaskEdit1.Text;


  ALTERA_RESPONSAVEL.Parameters.ParamByName('@CPF').Value := MaskEdit2.Text ;


  ALTERA_RESPONSAVEL.Parameters.ParamByName('@ENDERECO').Value := Edit3.Text;
  ALTERA_RESPONSAVEL.Parameters.ParamByName('@TELEFONE').Value := MaskEdit3.Text;
  ALTERA_RESPONSAVEL.Parameters.ParamByName('@CIDADE').Value := DBLookupComboBox1.KeyValue;
  ALTERA_RESPONSAVEL.Parameters.ParamByName('@EMAIL').Value := Edit4.Text;

  if RadioGroup3.ItemIndex = 0 then
  begin
    ALTERA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'M';
  end

  else if RadioGroup3.ItemIndex = 1 then
  begin
    ALTERA_RESPONSAVEL.Parameters.ParamByName('@SEXO').Value := 'F';
  end;

  if RadioGroup4.ItemIndex = 0 then
  begin
    ALTERA_RESPONSAVEL.Parameters.ParamByName('@STATUS').Value := 1 ;
  end

  else if RadioGroup4.ItemIndex = 1 then
  begin
    ALTERA_RESPONSAVEL.Parameters.ParamByName('@STATUS').Value := 0;
  end;

     cod_atualizacao := DBGrid1.DataSource.DataSet.RecNo;
     ALTERA_RESPONSAVEL.ExecProc;

        with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
        begin
          CLOSE;
          Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
          OPEN;
        end;

        with GRAVA_LOG do
        begin
          Parameters.ParamByName('@DESCRICAO').Value := 'Responsável nº ' + Edit1.Text + ' alterado.' ;
          Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
          Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
          ExecProc;
        end;

     ADOQuery1.Active:= FALSE;
     ADOQuery1.Active:= TRUE;

     DBGrid1.DataSource.DataSet.RecNo := cod_atualizacao;
     LabelAtualizado(Self);
  end

  else
  begin
     Exit;
  end;

  //ATUALIZANDO OS LABELS



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

  Edit1.Visible := FALSE;
  Edit2.Visible := FALSE;
  Edit3.Visible := FALSE;
  Edit4.Visible := FALSE;

  DBLookupComboBox1.Visible := FALSE;
  ADOQuery1.Active := FALSE ;
  ADOQuery1.Active := TRUE ;
  Image7.Enabled := FALSE;

  MaskEdit1.Visible := FALSE;
  MaskEdit2.Visible := FALSE;
  MaskEdit3.Visible := FALSE;
  MaskEdit4.Visible := FALSE;

  RadioGroup3.Visible := FALSE;
  RadioGroup4.Visible := FALSE;

  Label16.Caption:= Edit1.Text;
  Label17.Caption:= Edit2.Text;
  Label18.Caption:= MaskEdit1.Text;
end;

procedure TForm_RESPONSAVEL.Image8Click(Sender: TObject);
begin
{
  if RadioGroup2.ItemIndex=-1 then
  begin
    Application.MessageBox('Selecione uma opção!', 'Atenção!', MB_ICONEXCLAMATION);
    //TODOS_RESP_PJ.Execute;
  end;
  if RadioGroup2.ItemIndex=0 then
  begin
    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    TODOS_RESP_PJ.Execute;
  end;
   if RadioGroup2.ItemIndex=1 then
  begin
    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    ATIVOS_RESP_PJ.Execute;
  end;
   if RadioGroup2.ItemIndex=2 then
  begin
    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    INATIVOS_RESP_PJ.Execute;
  end;
 }

    Application.MessageBox('Ligue a impressora!', 'Atenção!', MB_ICONEXCLAMATION);
    TESTEPJ.Execute;

end;

end.
