unit Unit_TRATAMENTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ExtCtrls, StdCtrls, Grids, DBGrids, pngimage, jpeg, DB, ADODB,
  RpRave, RpDefine, RpCon, RpConDS;

type
  TForm_TRATAMENTOS = class(TForm)
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
    Image4: TImage;
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
    Timer1: TTimer;
    Edit2: TEdit;
    lbl_data: TLabel;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    RV_TRATAMENTOS: TRvDataSetConnection;
    RV_TRAT: TRvProject;
    RadioGroup2: TRadioGroup;
    ADOQuery1STATUS_TRATAMENTO: TBooleanField;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
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
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery1STATUS_TRATAMENTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_TRATAMENTOS: TForm_TRATAMENTOS;

implementation

uses UNIT_GRAVA_TRATAMENTO, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TForm_TRATAMENTOS.ADOQuery1OBS_TRATAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text := Copy(ADOQuery1OBS_TRATAMENTO.AsString, 1, 200) ;

end;

procedure TForm_TRATAMENTOS.ADOQuery1STATUS_TRATAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_TRATAMENTO.AsBoolean = true then
  begin
    Text := 'ATIVO';
  end
  else
  begin
    Text := 'INATIVO' ;
  end;

end;

procedure TForm_TRATAMENTOS.AtualizaLabel(Sender: TObject);
begin

   Label9.Caption:= IntToStr(ADOQuery1COD_TRATAMENTO.AsInteger);
   Edit1.Text:= IntToStr(ADOQuery1COD_TRATAMENTO.AsInteger);
   Label10.Caption:= ADOQuery1NOME_TRATAMENTO.AsString;

   if ADOQuery1STATUS_TRATAMENTO.AsBoolean = true then
   begin
     RadioGroup2.ItemIndex := 0 ;
   end
   else if ADOQuery1STATUS_TRATAMENTO.AsBoolean = false then
   begin
     RadioGroup2.ItemIndex := 1 ;
   end;

   Edit2.Text := ADOQuery1NOME_TRATAMENTO.AsString;
   Label11.Caption:= ADOQuery1OBS_TRATAMENTO.AsString;
   Memo1.Lines.Text:= ADOQuery1OBS_TRATAMENTO.AsString;

   Edit1.Visible := false ;
   Edit2.Visible := false ;
   Memo1.Visible := false ;
   RadioGroup2.Enabled := false ;
   Label9.Visible := true ;
   label11.Visible := true;
   Label10.Visible := true;

end;

procedure TForm_TRATAMENTOS.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1 ;
end;

procedure TForm_TRATAMENTOS.Button2Click(Sender: TObject);
begin
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;

    Edit1.Visible := TRUE;

    Edit2.Visible := TRUE;

    Memo1.Visible := TRUE;
end;

procedure TForm_TRATAMENTOS.Button3Click(Sender: TObject);
begin
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;

    Edit1.Visible := FALSE;

    Edit2.Visible := FALSE;

    Memo1.Visible := FALSE;
end;

procedure TForm_TRATAMENTOS.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if key<>#13 then
   begin
      Key := #0;
   end;
end;

procedure TForm_TRATAMENTOS.DBGrid1CellClick(Column: TColumn);
begin
   AtualizaLabel(Self);
end;

procedure TForm_TRATAMENTOS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TForm_TRATAMENTOS.Edit8Change(Sender: TObject);
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


procedure TForm_TRATAMENTOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 with ADOQuery1 do
  begin
    close;open;
  end;

  Button1Click(self);

  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
  begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      AtualizaLabel(self);
  end;
end;

procedure TForm_TRATAMENTOS.FormCreate(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TForm_TRATAMENTOS.FormShow(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    close;open;
  end;

  Button1Click(self);

  if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
  begin
      DBGrid1.DataSource.DataSet.RecNo := 1;
      AtualizaLabel(self);
  end;
end;

procedure TForm_TRATAMENTOS.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TForm_TRATAMENTOS.Image3Click(Sender: TObject);
begin
 Form_TRATAMENTOS.Close;
end;

procedure TForm_TRATAMENTOS.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TForm_TRATAMENTOS.Image5Click(Sender: TObject);
begin
   Form_GRAVA_TRATAMENTO.ShowModal;
end;

procedure TForm_TRATAMENTOS.Image6Click(Sender: TObject);
begin
    Label9.Visible := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;
    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Image7.Enabled := TRUE;
    Memo1.Visible := TRUE;
    RadioGroup2.Enabled := TRUE ;
end;

procedure TForm_TRATAMENTOS.Image7Click(Sender: TObject);
var
   cod_tra_alterado: integer;
  dia_c, mes_c, ano_c, hora_c : string;
begin
    begin
    if Edit1.Text = '' then
    begin
       Application.MessageBox('Preencha o campo do c�digo!', 'Aten��o!', MB_ICONWARNING);
       Edit1.SetFocus;
       Exit;
    end;
 if Application.MessageBox('Tem certeza que deseja alterar o tratamento?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin

    ALTERA_TRATAMENTO.Parameters.ParamByName('@CODIGO').Value := Edit1.Text;
    ALTERA_TRATAMENTO.Parameters.ParamByName('@NOME').Value := Edit2.Text;
    ALTERA_TRATAMENTO.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

    if RadioGroup2.ItemIndex = 0 then
    begin
      ALTERA_TRATAMENTO.Parameters.ParamByName('@STATUS').Value := '1';
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      ALTERA_TRATAMENTO.Parameters.ParamByName('@STATUS').Value := '0';
    end;





       cod_tra_alterado:= DBGrid1.DataSource.DataSet.RecNo;
       ALTERA_TRATAMENTO.ExecProc;

         dia_c := Copy(lbl_data.Caption,1,2);
         mes_c := Copy(lbl_data.Caption,4,2);
         ano_c := Copy(lbl_data.Caption,7,4);
         hora_c := Copy(lbl_data.Caption,14,8);
          WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
          begin
            CLOSE;
            Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
            OPEN;
          end;

          with GRAVA_LOG do
          begin
            Parameters.ParamByName('@DESCRICAO').Value := 'Tratamento n� ' + Edit1.Text + ' alterado.' ;
            Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
            Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
            ExecProc;
          end;


       ADOQuery1.Active:= FALSE;
       ADOQuery1.Active:= TRUE;

       DBGrid1.DataSource.DataSet.RecNo := cod_tra_alterado;
       AtualizaLabel(Self);
    end
    else
    begin
       Exit;
    end;

    //ATUALIZANDO OS LABELS



    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;

    Edit1.Visible := FALSE;

    EDIT2.Visible := FALSE;

    Memo1.Visible := FALSE;

    Image7.Enabled := FALSE;

    RadioGroup2.Enabled := FALSE ;
end;

end;

procedure TForm_TRATAMENTOS.Image8Click(Sender: TObject);
begin

  Application.MessageBox('Ligue a impressora!', 'Aten��o!', MB_ICONEXCLAMATION);
  RV_TRAT.Execute;

end;

procedure TForm_TRATAMENTOS.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TForm_TRATAMENTOS.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
