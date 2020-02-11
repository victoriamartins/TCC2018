unit UNIT_CONSULTA_ALTERA_DENTISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, jpeg, pngimage, DB, ADODB;

type
  TFORM_CONSULTA_ALTERA_DENTISTA = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Edit3: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ALTERA_DENTISTA: TADOStoredProc;
    DataSource1: TDataSource;
    Button1: TButton;
    Label1: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1COD_DENTISTA: TAutoIncField;
    ADOQuery1NOME_DENTISTA: TStringField;
    ADOQuery1SEXO_DENTISTA: TStringField;
    ADOQuery1CRO_DENTISTA: TStringField;
    ADOQuery1EMAIL_DENTISTA: TStringField;
    ADOQuery1STATUS_DENTISTA: TStringField;
    ADOQuery1DTHORACADASTRO_DENTISTA: TDateTimeField;
    ADOConnection1: TADOConnection;
    Image4: TImage;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image8: TImage;
    GRAVA_LOG: TADOStoredProc;
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure LabelAtualizado(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1STATUS_DENTISTAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_CONSULTA_ALTERA_DENTISTA: TFORM_CONSULTA_ALTERA_DENTISTA;

implementation

uses UNIT_GRAVA_DENTISTA, Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TFORM_CONSULTA_ALTERA_DENTISTA.LabelAtualizado(Sender: TObject);
begin
// Edit

    Edit1.Text := IntToStr(ADOQuery1COD_DENTISTA.AsInteger);
    Edit2.Text := ADOQuery1NOME_DENTISTA.AsString;
    Edit3.Text := IntToStr(ADOQuery1CRO_DENTISTA.AsInteger);
    Edit4.Text := ADOQuery1EMAIL_DENTISTA.AsString;

// Label

    Label9.Caption  := IntToStr(ADOQuery1COD_DENTISTA.AsInteger);
    Label10.Caption := ADOQuery1NOME_DENTISTA.AsString;
    Label12.Caption := IntToStr(ADOQuery1CRO_DENTISTA.AsInteger);
    Label8.Caption  := ADOQuery1EMAIL_DENTISTA.AsString;

// Radio Group

    if ADOQuery1SEXO_DENTISTA.AsString = 'M' then
    begin
        RadioGroup4.ItemIndex:= 0;
        Label11.Caption:= 'Masculino';
    end

    else if ADOQuery1SEXO_DENTISTA.AsString = 'F' then
    begin
        RadioGroup4.ItemIndex:= 1;
        Label11.Caption:= 'Feminino';
    end;

    if ADOQuery1STATUS_DENTISTA.AsBoolean = FALSE then  // SE FOR = 1, ATIVO
    begin
        RadioGroup3.ItemIndex:= 0;
        Label13.Caption:= 'Ativo';
    end

    else if ADOQuery1STATUS_DENTISTA.AsBoolean = TRUE then
    begin
        RadioGroup3.ItemIndex:= 1;
        Label13.Caption:= 'Inativo';
    end;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.RadioGroup1Click(Sender: TObject);
begin
    Edit8.Enabled := TRUE;
    Edit8.SetFocus;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.RadioGroup2Click(Sender: TObject);
var
NOME, CRO, EMAIL : STRING;
begin

    NOME :=  'NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
    CRO :=    'CRO_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
    EMAIL := 'EMAIL_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;

    if RadioGroup1.ItemIndex = -1 then //s� o MOSTRAR
    begin
              if RadioGroup2.ItemIndex = 0 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA' ;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 1';
                  ADOQuery1.Active := true;
                  ADOQuery1.open;


              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 0';
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 0 and '+NOME;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 1 and '+NOME;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where '+CRO;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 0 and '+CRO;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 1 and '+CRO;
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
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 1 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 0 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else if RadioGroup2.ItemIndex = 2 then
              begin
                  ADOQuery1.close;
                  ADOQuery1.Active := false;
                  ADOQuery1.SQL.Clear;
                  ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA = 1 and '+EMAIL;
                  ADOQuery1.Active := true;
                  ADOQuery1.open;

              end
              else
                exit;
         End;

    end;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.ADOQuery1STATUS_DENTISTAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ADOQuery1STATUS_DENTISTA.AsString =  '1' then
  begin
    Text := 'ATIVO';
  end
  else
  begin
    Text := 'INATIVO';
  end;


end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Button1Click(Sender: TObject);
begin
    Edit8.Enabled := false ;
    Edit8.Clear ;
    RadioGroup1.ItemIndex := -1;
    RadioGroup2.ItemIndex := 0;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.DBGrid1CellClick(Column: TColumn);
begin
    LabelAtualizado(Self);
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Edit8Change(Sender: TObject);
begin
   Edit8.Enabled := true ;

    if RadioGroup2.ItemIndex = -1 then // digitado o nome e se estiver desmarcado o MOSTRAR
    begin
        if RadioGroup1.ItemIndex = 0 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 1 then
        begin
           ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where CRO_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
            ADOQuery1.Active := true;
            ADOQuery1.open;
        end
        else if RadioGroup1.ItemIndex = 2 then
        begin
            ADOQuery1.close;
            ADOQuery1.Active := false;
            ADOQuery1.SQL.Clear;
            ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where EMAIL_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where CRO_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where EMAIL_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA=0 and NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA=0 and CRO_DENTISTA like '+ QuotedStr(Edit8.Text+'% ') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA=0 and EMAIL_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
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
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA=1 and NOME_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 1 then
                      begin
                         ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where STATUS_DENTISTA=1 and CRO_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end
                      else if RadioGroup1.ItemIndex = 2 then
                      begin
                          ADOQuery1.close;
                          ADOQuery1.Active := false;
                          ADOQuery1.SQL.Clear;
                          ADOQuery1.sql.Text := 'SELECT * FROM TB_DENTISTA where   STATUS_DENTISTA=1 and EMAIL_DENTISTA like '+ QuotedStr(Edit8.Text+'%') ;
                          ADOQuery1.Active := true;
                          ADOQuery1.open;
                      end;
          end;
    end;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      ADOQuery1.Active := false;
      ADOQuery1.Active := true;

      Button1Click(self);
      if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
      begin
        DBGrid1.DataSource.DataSet.RecNo := 1  ;
        LabelAtualizado(self);
      end;

end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.FormShow(Sender: TObject);
begin

      ADOQuery1.Active := false;
      ADOQuery1.Active := true;

      Button1Click(self);
      if DBGrid1.DataSource.DataSet.RecordCount <> 0 then
      begin
        DBGrid1.DataSource.DataSet.RecNo := 1  ;
        LabelAtualizado(self);
      end;


end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image2MouseEnter(Sender: TObject);
begin
    Image3.Visible:=True;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image3Click(Sender: TObject);
begin
  FORM_CONSULTA_ALTERA_DENTISTA.Close;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image3MouseLeave(Sender: TObject);
begin
    Image3.Visible:=False;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image5Click(Sender: TObject);
begin
 Form_GRAVA_DENTISTA.ShowModal;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image6Click(Sender: TObject);
begin
    Label8.Visible  := FALSE;
    Label9.Visible  := FALSE;
    Label10.Visible := FALSE;
    Label11.Visible := FALSE;
    Label12.Visible := FALSE;
    Label13.Visible := FALSE;

    Edit1.Visible := TRUE;
    Edit2.Visible := TRUE;
    Edit3.Visible := TRUE;
    Edit4.Visible := TRUE;

    RadioGroup3.Visible := TRUE;
    RadioGroup4.Visible := TRUE;
end;

procedure TFORM_CONSULTA_ALTERA_DENTISTA.Image7Click(Sender: TObject);
var   dia_c , mes_c, ano_c, hora_c: string;
begin
    if Edit1.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do c�digo!', 'Aten��o!', MB_ICONWARNING);
        Edit1.SetFocus;
        Exit;
    end

    else if Edit2.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do nome!', 'Aten��o!', MB_ICONWARNING);
        Edit2.SetFocus;
        Exit;
    end

    else if Edit3.Text = '' then
    begin
        Application.MessageBox('Preencha o campo do CRO!', 'Aten��o!', MB_ICONWARNING);
        Edit3.SetFocus;
        Exit;
    end

    else if RadioGroup4.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do sexo!', 'Aten��o!', MB_ICONWARNING);
        Exit;
    end

    else if RadioGroup3.ItemIndex = -1 then
    begin
        Application.MessageBox('Preencha o campo do status!', 'Aten��o!', MB_ICONWARNING);
        Exit;
    end;

    ALTERA_DENTISTA.Parameters.ParamByName('@CODIGO').Value := StrToInt(Edit1.Text);
    ALTERA_DENTISTA.Parameters.ParamByName('@NOME').Value := Edit2.Text;
    ALTERA_DENTISTA.Parameters.ParamByName('@CRO').Value := StrToInt(Edit3.Text);
    ALTERA_DENTISTA.Parameters.ParamByName('@EMAIL').Value := Edit4.Text;

    if RadioGroup4.ItemIndex = 0 then
    begin
        ALTERA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'M';
    end

    else if RadioGroup4.ItemIndex = 1 then
    begin
        ALTERA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'F';
    end;

    if RadioGroup3.ItemIndex = 0 then
    begin
        ALTERA_DENTISTA.Parameters.ParamByName('@STATUS').Value := 1 ;
    end

    else if RadioGroup3.ItemIndex = 1 then
    begin
        ALTERA_DENTISTA.Parameters.ParamByName('@STATUS').Value := 0;
    end;

    if Application.MessageBox('Tem certeza que deseja alterar o respons�vel?', 'ALTERAR', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
        ALTERA_DENTISTA.ExecProc;

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
      Parameters.ParamByName('@DESCRICAO').Value := 'Dentista n� ' + Edit1.Text + ' alterado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

        Application.MessageBox('Respons�vel alterado!', 'AVISO', MB_OK)
    end

    else
    begin
        Exit;
    end;

    //ATUALIZANDO OS LABELS

    ADOQuery1.Active:= FALSE;
    ADOQuery1.Active:= TRUE;

    LabelAtualizado(Self);

    Label8.Visible := TRUE;
    Label9.Visible := TRUE;
    Label10.Visible := TRUE;
    Label11.Visible := TRUE;
    Label12.Visible := TRUE;
    Label13.Visible := TRUE;

    Edit1.Visible := FALSE;
    Edit2.Visible := FALSE;
    Edit3.Visible := FALSE;
    Edit4.Visible := FALSE;

    RadioGroup3.Visible := FALSE;
    RadioGroup4.Visible := FALSE;
end;

end.
