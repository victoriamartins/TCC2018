unit UNIT_GRAVA_TRATAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, pngimage, jpeg;

type
  TFORM_GRAVA_TRATAMENTO = class(TForm)
    Edit1: TEdit;
    GRAVA_TRATAMENTO: TADOStoredProc;
    ADOConnection1: TADOConnection;
    Memo1: TMemo;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    lbl_data: TLabel;
    Image8: TImage;
    Image7: TImage;
    Label1: TLabel;
    Label11: TLabel;
    GRAVA_LOG: TADOStoredProc;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_TRATAMENTO: TFORM_GRAVA_TRATAMENTO;

implementation

uses Unit_TELA_PRINCIPAL, Unit_TRATAMENTOS;

{$R *.dfm}

procedure TFORM_GRAVA_TRATAMENTO.Button1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin
  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo com nome do tratamento', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  GRAVA_TRATAMENTO.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_TRATAMENTO.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_TRATAMENTO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;


  if Application.MessageBox('Tem certeza que deseja cadastrar o tratamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_TRATAMENTO.ExecProc;
    Application.MessageBox('Tratamento cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    Exit;
  end;

end;

procedure TFORM_GRAVA_TRATAMENTO.Button2Click(Sender: TObject);
begin
  Edit1.Text:='';
  Memo1.Lines.Text:='';
end;

procedure TFORM_GRAVA_TRATAMENTO.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

  if key in ['0'..'9'] then
  begin
     key := #0;
  end;

  KEY := UpCase(KEY);
end;

procedure TFORM_GRAVA_TRATAMENTO.FormCreate(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TFORM_GRAVA_TRATAMENTO.FormShow(Sender: TObject);
begin

  Image8Click(SELF);

end;

procedure TFORM_GRAVA_TRATAMENTO.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=True;
end;

procedure TFORM_GRAVA_TRATAMENTO.Image7Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin
if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo com nome do tratamento', 'Aten��o!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  GRAVA_TRATAMENTO.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_TRATAMENTO.Parameters.ParamByName('@OBS').Value := Memo1.Lines.Text;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

  GRAVA_TRATAMENTO.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;
  GRAVA_TRATAMENTO.Parameters.ParamByName('@STATUS').Value := '1' ;

  if Application.MessageBox('Tem certeza que deseja cadastrar o tratamento?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_TRATAMENTO.ExecProc;

    with Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Tratamento ' + Edit1.Text + ', c�digo n� ' + INTtOSTR(GRAVA_TRATAMENTO.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

    with Unit_TRATAMENTOS.Form_TRATAMENTOS.ADOQuery1 do
    begin
     Active := false;
     Active := true;
    end;

    Application.MessageBox('Tratamento cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    Exit;
  end;
end;

procedure TFORM_GRAVA_TRATAMENTO.Image3Click(Sender: TObject);
begin
 UNIT_GRAVA_TRATAMENTO.FORM_GRAVA_TRATAMENTO.Close;
end;

procedure TFORM_GRAVA_TRATAMENTO.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TFORM_GRAVA_TRATAMENTO.Image8Click(Sender: TObject);
begin
  Edit1.Text:='';
  Memo1.Lines.Text:='';
end;

procedure TFORM_GRAVA_TRATAMENTO.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;

    KEY := UpCase(KEY);
end;

procedure TFORM_GRAVA_TRATAMENTO.Timer1Timer(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

end.
