unit UNIT_GRAVA_DENTISTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, pngimage, jpeg;

type
  TFORM_GRAVA_DENTISTA = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    GRAVA_DENTISTA: TADOStoredProc;
    ADOConnection1: TADOConnection;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    lbl_data: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GRAVA_LOG: TADOStoredProc;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_GRAVA_DENTISTA: TFORM_GRAVA_DENTISTA;

implementation

uses Unit_TELA_PRINCIPAL;

{$R *.dfm}

procedure TFORM_GRAVA_DENTISTA.Button1Click(Sender: TObject);
var
  dia_c , mes_c, ano_c, hora_c: string;
begin

  if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o CRO do dentista!', 'Atenção!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox(' Escolha o sexo!', 'Atenção!', MB_ICONWARNING);
    Exit;
  end;

  GRAVA_DENTISTA.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_DENTISTA.Parameters.ParamByName('@CRO').Value := Edit2.Text;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'F';
  end

  else if RadioGroup1.ItemIndex =1 then
  begin
    GRAVA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'M';
  end;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

 GRAVA_DENTISTA.Parameters.ParamByName('@DTHORACADASTRO_DENTISTA').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;


  if Application.MessageBox('Tem certeza que deseja cadastrar o dentista?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_DENTISTA.ExecProc;
    Application.MessageBox('Dentista cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    exit;
  end;

end;

procedure TFORM_GRAVA_DENTISTA.Button2Click(Sender: TObject);
begin

  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1.ItemIndex := -1;

end;

procedure TFORM_GRAVA_DENTISTA.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFORM_GRAVA_DENTISTA.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFORM_GRAVA_DENTISTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.DENTISTA.Active := FALSE ;
Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.DENTISTA.Active := TRUE ;
end;

procedure TFORM_GRAVA_DENTISTA.FormCreate(Sender: TObject);
begin
 lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TFORM_GRAVA_DENTISTA.FormShow(Sender: TObject);
begin

  Image6Click(SELF);

end;

procedure TFORM_GRAVA_DENTISTA.Image2MouseEnter(Sender: TObject);
begin
Image3.Visible:=True;
end;

procedure TFORM_GRAVA_DENTISTA.Image3Click(Sender: TObject);
begin
 FORM_GRAVA_DENTISTA.Close;
end;

procedure TFORM_GRAVA_DENTISTA.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=False;
end;

procedure TFORM_GRAVA_DENTISTA.Image5Click(Sender: TObject);
var
 dia_c , mes_c, ano_c, hora_c: string;
begin
if Edit1.Text='' then
  begin
    Application.MessageBox('Preencha o campo de nome!', 'Atenção!', MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    Application.MessageBox('Preencha o CRO do dentista!', 'Atenção!', MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    Application.MessageBox(' Escolha o sexo!', 'Atenção!', MB_ICONWARNING);
    Exit;
  end;


  GRAVA_DENTISTA.Parameters.ParamByName('@NOME').Value := Edit1.Text;
  GRAVA_DENTISTA.Parameters.ParamByName('@STATUS').Value := '1';
  GRAVA_DENTISTA.Parameters.ParamByName('@CRO').Value := Edit2.Text;

  if RadioGroup1.ItemIndex = 0 then
  begin
    GRAVA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'F';
  end

  else if RadioGroup1.ItemIndex =1 then
  begin
    GRAVA_DENTISTA.Parameters.ParamByName('@SEXO').Value := 'M';
  end;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);
  hora_c := Copy(lbl_data.Caption,14,8);

 GRAVA_DENTISTA.Parameters.ParamByName('@DTHORACADASTRO_DENTISTA').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;


  if Application.MessageBox('Tem certeza que deseja cadastrar o dentista?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_DENTISTA.ExecProc;

    WITH Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIO DO
    begin
      CLOSE;
      Parameters.ParamByName('U_LOGIN').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption;
      OPEN;
    end;

    with GRAVA_LOG do
    begin
      Parameters.ParamByName('@DESCRICAO').Value := 'Dentista ' + Edit1.Text + ', código nº ' + INTtOSTR(GRAVA_DENTISTA.Parameters.ParamByName('@RETURN_VALUE').Value) + ' cadastrado.' ;
      Parameters.ParamByName('@USUARIO').Value := Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.QUERY_USUARIOCOD_USUARIO.AsInteger;
      Parameters.ParamByName('@DTHORA').Value := ano_c + '-' + mes_c + '-' + dia_c + ' ' + hora_c;
      ExecProc;
    end;

    Application.MessageBox('Dentista cadastrado!', 'AVISO', MB_OK);
    Button2Click(self);
  end

  else
  begin
    exit;
  end;
end;

procedure TFORM_GRAVA_DENTISTA.Image6Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1.ItemIndex := -1;

end;

procedure TFORM_GRAVA_DENTISTA.RadioGroup1Click(Sender: TObject);
begin
    Image5Click(SELF);
end;

procedure TFORM_GRAVA_DENTISTA.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

end.
