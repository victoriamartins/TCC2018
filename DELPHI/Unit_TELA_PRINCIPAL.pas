unit Unit_TELA_PRINCIPAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, jpeg, ExtCtrls, StdCtrls, DB, ADODB, ShellAPI, MMSystem,
  Menus, Grids, DBGrids, DBCtrls, ComCtrls;

type
  TForm_TELA_PRINCIPAL = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOQuery1COD_USUARIO: TAutoIncField;
    ADOQuery1NOME_USUARIO: TStringField;
    ADOQuery1LOGIN_USUARIO: TStringField;
    ADOQuery1SENHA_USUARIO: TStringField;
    ADOQuery1EMAIL_USUARIO: TStringField;
    ADOQuery1TIPO_USUARIO: TBooleanField;
    ADOQuery1STATUS_USUARIO: TBooleanField;
    Image8: TImage;
    Image9: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image37: TImage;
    Image38: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Label3: TLabel;
    Label4: TLabel;
    LBL_USUARIO: TLabel;
    LBL_TIPO: TLabel;
    QUERY_USUARIO: TADOQuery;
    QUERY_USUARIOCOD_USUARIO: TAutoIncField;
    QUERY_USUARIONOME_USUARIO: TStringField;
    QUERY_USUARIOLOGIN_USUARIO: TStringField;
    QUERY_USUARIOSENHA_USUARIO: TStringField;
    QUERY_USUARIOFUNCIONARIO_USUARIO: TIntegerField;
    QUERY_USUARIODENTISTA_USUARIO: TIntegerField;
    QUERY_USUARIOTIPO_USUARIO: TBooleanField;
    QUERY_USUARIOSTATUS_USUARIO: TBooleanField;
    QUERY_USUARIODTHORACADASTRO_USUARIO: TDateTimeField;
    lbl_data: TLabel;
    Timer1: TTimer;
    Image27: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    AG_HOJE: TADOQuery;
    DS_AG_HOJE: TDataSource;
    Label6: TLabel;
    AG_HOJEDATAHORA_AGENDAMENTO: TDateTimeField;
    AG_HOJEPACIENTE_AGENDAMENTO: TIntegerField;
    AG_HOJENOME_PACIENTE: TStringField;
    AG_HOJEDENTISTA_AGENDAMENTO: TIntegerField;
    AG_HOJENOME_DENTISTA: TStringField;
    AG_HOJETRATAMENTO_AGENDAMENTO: TIntegerField;
    AG_HOJENOME_TRATAMENTO: TStringField;
    AG_HOJECONSULTA_AGENDAMENTO: TBooleanField;
    AG_HOJEOBS_AGENDAMENTO: TMemoField;
    AG_HOJEDTHORACADASTRO_AGENDAMENTO: TDateTimeField;
    DBLookupComboBox1: TDBLookupComboBox;
    DENTISTA: TADOQuery;
    DS_DENTISTA: TDataSource;
    DENTISTACOD_DENTISTA: TAutoIncField;
    DENTISTANOME_DENTISTA: TStringField;
    DENTISTASEXO_DENTISTA: TStringField;
    DENTISTACRO_DENTISTA: TStringField;
    DENTISTAEMAIL_DENTISTA: TStringField;
    DENTISTASTATUS_DENTISTA: TStringField;
    DENTISTADTHORACADASTRO_DENTISTA: TDateTimeField;
    imf: TImage;
    DBGrid2: TDBGrid;
    CS_HOJE: TADOQuery;
    DS_CS_HOJE: TDataSource;
    Label5: TLabel;
    Label7: TLabel;
    CS_HOJECOD_CONSULTA: TAutoIncField;
    CS_HOJEDATAHORA_CONSULTA: TDateTimeField;
    CS_HOJEPACIENTE_CONSULTA: TIntegerField;
    CS_HOJENOME_PACIENTE: TStringField;
    CS_HOJEDENTISTA_CONSULTA: TIntegerField;
    CS_HOJENOME_DENTISTA: TStringField;
    CS_HOJETRATAMENTO_CONSULTA: TIntegerField;
    CS_HOJENOME_TRATAMENTO: TStringField;
    CS_HOJEPREAGENDAMENTO_CONSULTA: TIntegerField;
    CS_HOJEOBS_CONSULTA: TMemoField;
    CS_HOJEDTHORACADASTRO_CONSULTA: TDateTimeField;
    Label8: TLabel;
    Image28: TImage;
    Image29: TImage;
    pn_menu: TPanel;
    IMG3: TImage;
    IMG4: TImage;
    IMG5: TImage;
    DESPESAS: TImage;
    FECHAR: TImage;
    Image11: TImage;
    Image26: TImage;
    Image36: TImage;
    Image25: TImage;
    Image10: TImage;
    Image12: TImage;
    Image47: TImage;
    Image35: TImage;
    Image46: TImage;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    FECHA_MES: TImage;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    REALIZARCONSULTA1: TMenuItem;
    GRAVA_CONSULTA: TADOStoredProc;
    GRAVA_LOG: TADOStoredProc;
    AG_HOJECOD_AGENDAMENTO: TAutoIncField;
    ALTERA_BIT_AG: TADOStoredProc;
    TrayIcon1: TTrayIcon;
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image14MouseLeave(Sender: TObject);
    procedure Image13MouseEnter(Sender: TObject);
    procedure Image15MouseEnter(Sender: TObject);
    procedure Image16MouseLeave(Sender: TObject);
    procedure Image17MouseEnter(Sender: TObject);
    procedure Image18MouseLeave(Sender: TObject);
    procedure Image19MouseEnter(Sender: TObject);
    procedure Image20MouseLeave(Sender: TObject);
    procedure Image21MouseEnter(Sender: TObject);
    procedure Image22MouseLeave(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image8MouseEnter(Sender: TObject);
    procedure Image8MouseLeave(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image30MouseEnter(Sender: TObject);
    procedure Image31MouseLeave(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure Image24MouseEnter(Sender: TObject);
    procedure Image23MouseLeave(Sender: TObject);
    procedure Image11MouseEnter(Sender: TObject);
    procedure Image12MouseEnter(Sender: TObject);
    procedure Image25MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image32MouseLeave(Sender: TObject);
    procedure Image33MouseEnter(Sender: TObject);
    procedure Image34MouseLeave(Sender: TObject);
    procedure Image34Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image37MouseEnter(Sender: TObject);
    procedure Image38MouseLeave(Sender: TObject);
    procedure Image40MouseEnter(Sender: TObject);
    procedure Image41MouseLeave(Sender: TObject);
    procedure Image42MouseEnter(Sender: TObject);
    procedure Image43MouseLeave(Sender: TObject);
    procedure Image44MouseEnter(Sender: TObject);
    procedure Image45MouseLeave(Sender: TObject);
    procedure Image47Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Image45Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image43Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image41Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image38Click(Sender: TObject);
    procedure Image46Click(Sender: TObject);
    procedure Image27MouseEnter(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image32Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Image32MouseEnter(Sender: TObject);
    procedure CS_HOJEOBS_CONSULTAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure AG_HOJEOBS_AGENDAMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Image28MouseEnter(Sender: TObject);
    procedure Image29MouseLeave(Sender: TObject);
    procedure Image29MouseEnter(Sender: TObject);
    procedure Image34MouseEnter(Sender: TObject);
    procedure Image26MouseEnter(Sender: TObject);
    procedure Image47MouseEnter(Sender: TObject);
    procedure Image46MouseEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FECHARClick(Sender: TObject);
    procedure DESPESASClick(Sender: TObject);
    procedure IMG3Click(Sender: TObject);
    procedure IMG4Click(Sender: TObject);
    procedure IMG5Click(Sender: TObject);
    procedure FECHA_MESClick(Sender: TObject);
    procedure imfClick(Sender: TObject);
    procedure Image36Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure REALIZARCONSULTA1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_TELA_PRINCIPAL: TForm_TELA_PRINCIPAL;

implementation

uses  Unit_LOGIN, Unit_CONSULTA_DENTISTA, Unit_ESCOLHE_PAGAMENTO,
  UNIT_LOG, Unit_FUNCIONARIOS, Unit_PRODUTOS, UNIT_GRAVA_PAGAMENTO_FUNCIONARIO,
  UNIT_GRAVA_PAGAMENTO_PACIENTE_AVISTA, UNIT_GRAVA_PAGAMENTO_PACIENTE_APRAZO,
  Unit_TRATAMENTOS, Unit_MARCAR_CONSULTA, Unit_PACIENTES, Unit_RESPONSAVEL,
  UNIT_GRAVA_AGENDAMENTO, Unit_CONS_PAGAM_AVISTA, Unit_CONS_PAGAM_APRAZO,
  UNIT_GRAVA_USUARIO, UNIT_CAIXA, Unit_DESPESAS, UNIT_PAGAMENTO_DENTISTA,
  UNIT_ERRO, Unit_CONS_AGENDAMENTO, Unit_USUARIOS, Unit_BACKUP_TESTE,
  UNIT_CONS_PAGAM_PARCELADO, TELA_CARREGAMENTO;
  {function TrocaResolucao(X, Y, a , b: word): Boolean;
var lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then
  begin
    lpDevMode.dmFields := DM_PELSWIDTH Or DM_PELSHEIGHT;
    a:= lpDevMode.dmPelsWidth;  // pega a resolu��o atual (horizontal)
    b:= lpDevMode.dmPelsHeight; // pega a resolu��o atual  (vertical)
    lpDevMode.dmPelsWidth := x;  // altera a resolu��o para a que voce voce desejou
    lpDevMode.dmPelsHeight:= y;  // altera a resolu��o para a que voce voce desejou
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;

function VoltaResolucao(a , b: word): Boolean;
var lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then
  begin
    lpDevMode.dmFields := DM_PELSWIDTH Or DM_PELSHEIGHT;
    lpDevMode.dmPelsWidth := a;  // ao fechar o programa recupera a resolu��o que vinha sendo usada
    lpDevMode.dmPelsHeight:= b;  // ao fechar o programa recupera a resolu��o que vinha sendo usada
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end; }

{$R *.dfm}

procedure TForm_TELA_PRINCIPAL.AG_HOJEOBS_AGENDAMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  Text :=  Copy(AG_HOJEOBS_AGENDAMENTO.AsString,1,200);

end;

procedure TForm_TELA_PRINCIPAL.Button1Click(Sender: TObject);
VAR
  dia_c , mes_c, ano_c, hora_c : string;
begin
    Panel1.Left := 480;
    Panel1.Top := 250;
  DBLookupComboBox1.KeyValue := -1 ;


  with AG_HOJE do
  begin
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_AGENDAMENTO, DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO,NOME_PACIENTE, DENTISTA_AGENDAMENTO ,NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO, CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO');
    SQL.Add(' FROM TB_AGENDAMENTO, TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO ');
    SQL.Add(' WHERE COD_PACIENTE=PACIENTE_AGENDAMENTO AND COD_DENTISTA=DENTISTA_AGENDAMENTO AND COD_TRATAMENTO=TRATAMENTO_AGENDAMENTO AND CONSULTA_AGENDAMENTO <>1 and CAST(DATAHORA_AGENDAMENTO AS DATE) = :DATA order by DATAHORA_AGENDAMENTO  DESC');
    Active := true ;
    Open;
  end;

  WITH CS_HOJE DO
  BEGIN
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_CONSULTA, DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE, DENTISTA_CONSULTA, NOME_DENTISTA, TRATAMENTO_CONSULTA, NOME_TRATAMENTO, PREAGENDAMENTO_CONSULTA, OBS_CONSULTA, DTHORACADASTRO_CONSULTA');
    SQL.Add('FROM TB_CONSULTA , TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO ');
    SQL.Add('WHERE COD_PACIENTE=PACIENTE_CONSULTA AND COD_DENTISTA=DENTISTA_CONSULTA AND COD_TRATAMENTO=TRATAMENTO_CONSULTA AND CAST(DATAHORA_CONSULTA AS DATE) = :DATA order by DATAHORA_CONSULTA desc');
    Active := true ;
    Open;
  END;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);

  AG_HOJE.Close;
  AG_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
  AG_HOJE.Open;

  CS_HOJE.Close;
  CS_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
  CS_HOJE.Open;
  CS_HOJE.Active := FALSE ;
  CS_HOJE.Active := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.CS_HOJEOBS_CONSULTAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  TEXT := Copy(CS_HOJEOBS_CONSULTA.AsString,1,200);

end;

procedure TForm_TELA_PRINCIPAL.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
VAR
   Data_h, hora_h : string ;

begin
Data_h := Copy(lbl_data.Caption,1,10);
hora_h := Copy(lbl_data.Caption,14,5);

    if AG_HOJEDATAHORA_AGENDAMENTO.AsString > Data_h+' '+hora_h then
     begin
         ///////
     end
     else if AG_HOJEDATAHORA_AGENDAMENTO.AsString < Data_h+' '+hora_h then
     begin
         TDBGrid(Sender).Canvas.Brush.Color := $00EAEAFF   ;  ///atrasados
         (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
         {
         DBGrid1.Canvas.Font.Color := clRed;
         //(Sender as TDBGrid).Canvas.Font.Color := $00D5D5FF;
         //(Sender as TDBGrid).Canvas.Font.Style:= [fsbold];

         DBGrid1.Canvas.Font.Color:= clred;
         DBGrid1.Canvas.Font.Style := [fsBold];
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         }
     end;

      TDbGrid(Sender).Canvas.font.Color:= clBlack;
        if gdSelected in State then
          with (Sender as TDBGrid).Canvas do
            begin
              Brush.Color := $00ECFFFF;   //// LINHA SELECIONADA
              FillRect(Rect);
              Font.Style := [fsbold]
            end;

      TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);



            {
    if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
     begin
        TDBGrid(Sender).Canvas.Brush.Color:= clRed;    //// LINHAS IMPARES
     end
     else
     begin
         TDBGrid(Sender).Brush.Color:= clGreen;  ///??????
     end;

      TDbGrid(Sender).Canvas.font.Color:= clBlack;
        if gdSelected in State then
          with (Sender as TDBGrid).Canvas do
            begin
              Brush.Color := clYellow;   //// LINHA SELECIONADA
              FillRect(Rect);
              Font.Style := [fsbold]
            end;

      TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
             }
end;

procedure TForm_TELA_PRINCIPAL.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


 if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
 begin
    TDBGrid(Sender).Canvas.Brush.Color:= $00E0FCE1;
 end
 else
 begin
     TDBGrid(Sender).Canvas.Brush.Color:= $00ECFDEC;
 end;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;
    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
        begin
          Brush.Color := $00F2F2F2;
          FillRect(Rect);
          Font.Style := [fsbold]
        end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

procedure TForm_TELA_PRINCIPAL.DBLookupComboBox1Click(Sender: TObject);
VAR
  dia_c , mes_c, ano_c: string;
begin

  with AG_HOJE do
  begin
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_AGENDAMENTO,DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO,NOME_PACIENTE, DENTISTA_AGENDAMENTO ,NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO, CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO');
    SQL.Add(' FROM TB_AGENDAMENTO, TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO ');
    SQL.Add(' WHERE COD_PACIENTE=PACIENTE_AGENDAMENTO AND COD_DENTISTA=DENTISTA_AGENDAMENTO AND COD_TRATAMENTO=TRATAMENTO_AGENDAMENTO AND CONSULTA_AGENDAMENTO <> 1 AND DENTISTA_AGENDAMENTO = ' + INTTOSTR(DBLookupComboBox1.KeyValue)+' AND CAST(DATAHORA_AGENDAMENTO AS DATE) = :DATA order by DATAHORA_AGENDAMENTO  DESC');
    Active := true ;
    Open;
  end;

  WITH CS_HOJE DO
  BEGIN
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_CONSULTA, DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE, DENTISTA_CONSULTA, NOME_DENTISTA, TRATAMENTO_CONSULTA, NOME_TRATAMENTO, PREAGENDAMENTO_CONSULTA, OBS_CONSULTA, DTHORACADASTRO_CONSULTA');
    SQL.Add(' FROM TB_CONSULTA , TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO');
    SQL.Add(' WHERE COD_PACIENTE=PACIENTE_CONSULTA AND COD_DENTISTA=DENTISTA_CONSULTA');
    SQL.Add(' AND COD_TRATAMENTO=TRATAMENTO_CONSULTA AND CAST(DATAHORA_CONSULTA AS DATE) = :DATA and DENTISTA_CONSULTA = ' + INTTOSTR(DBLookupComboBox1.KeyValue));
    SQL.Add(' order by DATAHORA_CONSULTA desc');
    Active := true ;
    Open;
  END;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);

  AG_HOJE.Close;
  AG_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c ;
  AG_HOJE.Open;

  CS_HOJE.Close;
  CS_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c ;
  CS_HOJE.Open;

  Panel1.Visible := TRUE ;




end;

procedure TForm_TELA_PRINCIPAL.DESPESASClick(Sender: TObject);
begin
    Unit_DESPESAS.Form_DESPESAS.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.FECHARClick(Sender: TObject);
begin
pn_menu.Visible := false ;
end;

procedure TForm_TELA_PRINCIPAL.FECHA_MESClick(Sender: TObject);
begin
Panel2.Visible := false ;
end;

procedure TForm_TELA_PRINCIPAL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with Unit_LOGIN.Form1 do
  begin
    SHOW;
    Edit1.Clear;
    Edit2.Clear;
    Edit1.SetFocus;
  end;

end;

procedure TForm_TELA_PRINCIPAL.FormCreate(Sender: TObject);
begin
  lbl_data.Caption :=  FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now);
end;

procedure TForm_TELA_PRINCIPAL.FormShow(Sender: TObject);
begin


      Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.LBL_USUARIO.Caption := Unit_LOGIN.Form1.Edit1.Text ;
      QUERY_USUARIO.Close;
      QUERY_USUARIO.Parameters.ParamByName('U_LOGIN').Value := LBL_USUARIO.Caption;
      QUERY_USUARIO.Open;

      if QUERY_USUARIOTIPO_USUARIO.AsBoolean = FALSE then
      begin
        LBL_TIPO.Caption := 'USU�RIO COMUM';
          Image4.Visible := false;
          //Image5.Visible := false;
          Image2.Visible := false;
          //Image3.Visible := false;
          Image6.Visible := false;
          //Image7.Visible := false;
          Image44.Visible := false ;

      end;
      if QUERY_USUARIOTIPO_USUARIO.AsBoolean = TRUE then
      begin
        LBL_TIPO.Caption := 'USU�RIO ADMINISTRADOR';
          Image4.Visible := true;
          //Image5.Visible := true;
          Image2.Visible := true;
          //Image3.Visible := true;
          Image6.Visible := true;
          //Image7.Visible := true;
          image4.Visible := true ;
          Image44.Visible := TRUE ;
      end;

      Panel1.Visible := false ;
      Panel2.Visible := false ;
      pn_menu.Visible := false ;

end;

procedure TForm_TELA_PRINCIPAL.Image10Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('EXCEL.EXE'), nil, nil, SW_ShowNORMAL);
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image11Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('CALC.EXE'), nil, nil, SW_ShowNORMAL);
Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image11MouseEnter(Sender: TObject);
begin
    Image9.Visible := true;
    Image10.Visible:=True;
    Image11.Visible:=true;
    Image12.Visible:=true;
    Image25.Visible:=true;
    Image26.Visible:=true;
      ShowHint := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.Image10MouseEnter(Sender: TObject);
begin
    Image9.Visible := true;
    Image10.Visible:=True;
    Image11.Visible:=true;
    Image12.Visible:=true;
    Image25.Visible:=true;
    Image26.Visible:=true;
      ShowHint := TRUE ;
end;



procedure TForm_TELA_PRINCIPAL.Image12Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('WINWORD.EXE'), nil, nil, SW_ShowNORMAL);
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image12MouseEnter(Sender: TObject);
begin
  ShowHint := TRUE ;
Image9.Visible := true;
    Image10.Visible:=True;
    Image11.Visible:=true;
    Image12.Visible:=true;
    Image25.Visible:=true;
    Image26.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image13MouseEnter(Sender: TObject);
begin
 Image14.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image14Click(Sender: TObject);
begin
Unit_MARCAR_CONSULTA.Form_MARCA_CONSULTA.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image14MouseLeave(Sender: TObject);
begin
 Image14.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image15MouseEnter(Sender: TObject);
begin
Image16.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image16Click(Sender: TObject);
begin

  Unit_PACIENTES.Form_PACIENTE.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image16MouseLeave(Sender: TObject);
begin
 Image16.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image17MouseEnter(Sender: TObject);
begin
 Image18.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image18Click(Sender: TObject);
begin

  Unit_PRODUTOS.Form_PRODUTOS.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image18MouseLeave(Sender: TObject);
begin
Image18.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image19MouseEnter(Sender: TObject);
begin
  Image20.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image1MouseEnter(Sender: TObject);
begin
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
    Image46.Visible:=False;
    Image47.Visible:=False;
         Image35.Visible:=FALSE;
    IMAGE36.Visible:=FALSE;
end;

procedure TForm_TELA_PRINCIPAL.Image20Click(Sender: TObject);
begin

  Unit_FUNCIONARIOS.Form_FUNCIONARIOS.ShowModal;


end;

procedure TForm_TELA_PRINCIPAL.Image20MouseLeave(Sender: TObject);
begin
  Image20.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image21MouseEnter(Sender: TObject);
begin
 Image22.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image22Click(Sender: TObject);
begin
      pn_menu.Left := 570;
      pn_menu.Top := 380;

      pn_menu.Visible := true ;



end;

procedure TForm_TELA_PRINCIPAL.Image22MouseLeave(Sender: TObject);
begin
 Image22.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image23Click(Sender: TObject);
begin

  if Application.MessageBox('Tem certeza que deseja fechar a tela principal?','ATEN��O!', mb_iconquestion + mb_yesno) = idYes then
  begin
    Form_TELA_PRINCIPAL.Close;
  end
  else
  begin
    exit;
  end;

end;

procedure TForm_TELA_PRINCIPAL.Image23MouseLeave(Sender: TObject);
begin
Image23.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image24MouseEnter(Sender: TObject);
begin
 Image23.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image25Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('POWERPNT.EXE'), nil, nil, SW_ShowNORMAL);
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image25MouseEnter(Sender: TObject);
begin
  ShowHint := TRUE ;
      Image9.Visible := true;
    Image10.Visible:=True;
    Image11.Visible:=true;
    Image12.Visible:=true;
    Image25.Visible:=true;
    Image26.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image26Click(Sender: TObject);
begin
ShellExecute(0, nil, PChar('chrome.EXE'), nil, nil, SW_ShowNORMAL);
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image26MouseEnter(Sender: TObject);
begin
  ShowHint := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.Image27Click(Sender: TObject);
begin
UNIT_CAIXA.FORM_CAIXA.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image27MouseEnter(Sender: TObject);
begin
Image27.ShowHint:=TRUE;
end;

procedure TForm_TELA_PRINCIPAL.Image28MouseEnter(Sender: TObject);
begin
Image28.Visible := false;
Image29.Visible := true;
end;

procedure TForm_TELA_PRINCIPAL.Image29Click(Sender: TObject);
begin
//Form_TELA_PRINCIPAL.WindowState:=wsMaximized;
Unit_BACKUP_TESTE.Backup_TESTE.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image29MouseEnter(Sender: TObject);
begin

  ShowHint := TRUE ;

end;

procedure TForm_TELA_PRINCIPAL.Image29MouseLeave(Sender: TObject);
begin
    Image28.Visible := true;
    Image29.Visible := false;
end;

procedure TForm_TELA_PRINCIPAL.Image2MouseEnter(Sender: TObject);
begin
 Image3.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image30MouseEnter(Sender: TObject);
begin
 Image31.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image31Click(Sender: TObject);
begin
Form_TELA_PRINCIPAL.WindowState:=wsMinimized;
TrayIcon1.BalloonTitle:='Aviso';
TrayIcon1.BalloonHint:='O sistema est� sendo executado em segundo plano, clique para voltar.';
TrayIcon1.BalloonFlags:=bfInfo;
TrayIcon1.ShowBalloonHint;
Unit_LOGIN.Form1.Hide;
end;

procedure TForm_TELA_PRINCIPAL.Image31MouseLeave(Sender: TObject);
begin
Image31.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image32Click(Sender: TObject);
VAR
  dia_c , mes_c, ano_c, hora_c : string;
begin
    Panel1.Left := 480;
    Panel1.Top := 250;
  DBLookupComboBox1.KeyValue := -1 ;


  with AG_HOJE do
  begin
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_AGENDAMENTO, DATAHORA_AGENDAMENTO, PACIENTE_AGENDAMENTO,NOME_PACIENTE, DENTISTA_AGENDAMENTO ,NOME_DENTISTA, TRATAMENTO_AGENDAMENTO, NOME_TRATAMENTO, CONSULTA_AGENDAMENTO, OBS_AGENDAMENTO, DTHORACADASTRO_AGENDAMENTO');
    SQL.Add(' FROM TB_AGENDAMENTO, TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO ');
    SQL.Add(' WHERE COD_PACIENTE=PACIENTE_AGENDAMENTO AND COD_DENTISTA=DENTISTA_AGENDAMENTO AND COD_TRATAMENTO=TRATAMENTO_AGENDAMENTO AND CONSULTA_AGENDAMENTO <>1 and CAST(DATAHORA_AGENDAMENTO AS DATE) = :DATA order by DATAHORA_AGENDAMENTO  DESC');
    Active := true ;
    Open;
  end;

  WITH CS_HOJE DO
  BEGIN
    close ;
    Active := false ;
    sql.Clear;
    SQL.Add('SELECT COD_CONSULTA, DATAHORA_CONSULTA, PACIENTE_CONSULTA, NOME_PACIENTE, DENTISTA_CONSULTA, NOME_DENTISTA, TRATAMENTO_CONSULTA, NOME_TRATAMENTO, PREAGENDAMENTO_CONSULTA, OBS_CONSULTA, DTHORACADASTRO_CONSULTA');
    SQL.Add('FROM TB_CONSULTA , TB_PACIENTE, TB_DENTISTA, TB_TRATAMENTO ');
    SQL.Add('WHERE COD_PACIENTE=PACIENTE_CONSULTA AND COD_DENTISTA=DENTISTA_CONSULTA AND COD_TRATAMENTO=TRATAMENTO_CONSULTA AND CAST(DATAHORA_CONSULTA AS DATE) = :DATA order by DATAHORA_CONSULTA desc');
    Active := true ;
    Open;
  END;

  dia_c := Copy(lbl_data.Caption,1,2);
  mes_c := Copy(lbl_data.Caption,4,2);
  ano_c := Copy(lbl_data.Caption,7,4);

  AG_HOJE.Close;
  AG_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
  AG_HOJE.Open;

  CS_HOJE.Close;
  CS_HOJE.Parameters.ParamByName('DATA').Value := ano_c + '-' + mes_c + '-' + dia_c;
  CS_HOJE.Open;
  CS_HOJE.Active := FALSE ;
  CS_HOJE.Active := TRUE ;

  Panel1.Visible := TRUE ;

end;

procedure TForm_TELA_PRINCIPAL.Image32MouseEnter(Sender: TObject);
begin

  Image32.ShowHint := TRUE ;

end;

procedure TForm_TELA_PRINCIPAL.Image32MouseLeave(Sender: TObject);
begin
 Image32.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image33MouseEnter(Sender: TObject);
begin
Image34.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image34Click(Sender: TObject);
begin
// if Image9.Visible=False then
 // begin
    Image9.Visible:=True;
    Image10.Visible:=True;
    Image11.Visible:=True;
    Image12.Visible:=True;
    Image25.Visible:=True;
    Image26.Visible:=True;
    Image46.Visible:=True;
    Image47.Visible:=True;
    Image35.Visible:=TRUE;
    IMAGE36.Visible:=TRUE;

 // end;
 {if Image9.Visible=True then
  begin
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
  end;}
end;

procedure TForm_TELA_PRINCIPAL.Image34MouseEnter(Sender: TObject);
begin
ShowHint := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.Image34MouseLeave(Sender: TObject);
begin
 Image34.Visible:=False;

end;

procedure TForm_TELA_PRINCIPAL.Image36Click(Sender: TObject);
VAR
  dia, mes, ano : string ;
begin
   Panel2.Left := 660;
   Panel2.Top := 380;

  dia := Copy(lbl_data.Caption,1,2);
  mes := Copy(lbl_data.Caption,4,2);
  ano := Copy(lbl_data.Caption,7,4);
  Panel2.Visible := TRUE ;
    Image9.Visible:=False;
    Image10.Visible:=False;
    Image11.Visible:=False;
    Image12.Visible:=False;
    Image25.Visible:=False;
    Image26.Visible:=False;
    Image46.Visible:=False;
    Image47.Visible:=False;
    Image35.Visible:=FALSE;
    IMAGE36.Visible:=FALSE;
    MonthCalendar1.Date := STRTODATE(dia + '/' + mes + '/' + ano);
end;

procedure TForm_TELA_PRINCIPAL.Image37MouseEnter(Sender: TObject);
begin
 Image38.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image38Click(Sender: TObject);
begin
Unit_CONS_AGENDAMENTO.Form_CONS_AGENDAMENTO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image38MouseLeave(Sender: TObject);
begin
 Image38.Visible:=false;
end;

procedure TForm_TELA_PRINCIPAL.Image3Click(Sender: TObject);
begin
//UNIT_GRAVA_USUARIO.FORM_GRAVA_USUARIO.ShowModal;
Unit_USUARIOS.Form_USUARIO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image3MouseLeave(Sender: TObject);
begin
 Image3.Visible:=false;
end;

procedure TForm_TELA_PRINCIPAL.Image40MouseEnter(Sender: TObject);
begin
 Image41.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image41Click(Sender: TObject);
begin

  Unit_RESPONSAVEL.Form_RESPONSAVEL.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image41MouseLeave(Sender: TObject);
begin
Image41.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image42MouseEnter(Sender: TObject);
begin
 Image43.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image43Click(Sender: TObject);
begin

  Unit_TRATAMENTOS.Form_TRATAMENTOS.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image43MouseLeave(Sender: TObject);
begin
 Image43.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image44MouseEnter(Sender: TObject);
begin
Image45.Visible:=True;
end;

procedure TForm_TELA_PRINCIPAL.Image45Click(Sender: TObject);
begin

UNIT_LOG.FORM_LOG.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image45MouseLeave(Sender: TObject);
begin
 Image45.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image46Click(Sender: TObject);
begin
UNIT_ERRO.FORM_ERRO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image46MouseEnter(Sender: TObject);
begin
  ShowHint := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.Image47Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://Googlemaps.com', '', '', 1);
end;

procedure TForm_TELA_PRINCIPAL.Image47MouseEnter(Sender: TObject);
begin
  ShowHint := TRUE ;
end;

procedure TForm_TELA_PRINCIPAL.Image4MouseEnter(Sender: TObject);
begin
 Image5.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image5Click(Sender: TObject);
begin
  Unit_ESCOLHE_PAGAMENTO.Form_ESCOLHE_PAGAMENTO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Image5MouseLeave(Sender: TObject);
begin
 Image5.Visible:=false;
end;

procedure TForm_TELA_PRINCIPAL.Image6MouseEnter(Sender: TObject);
begin
    Image7.Visible:= TRUE;
end;

procedure TForm_TELA_PRINCIPAL.Image7Click(Sender: TObject);
begin

  Unit_CONSULTA_DENTISTA.Form_CONSULTA_DENTISTA.ShowModal;

end;

procedure TForm_TELA_PRINCIPAL.Image7MouseLeave(Sender: TObject);
begin
 Image7.Visible:=False;
end;

procedure TForm_TELA_PRINCIPAL.Image8MouseEnter(Sender: TObject);
begin
    Image32.Visible:=True;
   /// Image9.Visible := true;
    //Image10.Visible:=True;
    //Image11.Visible:=true;
   // Image12.Visible:=true;
   // Image25.Visible:=true;
   // Image26.Visible:=true;
end;

procedure TForm_TELA_PRINCIPAL.Image8MouseLeave(Sender: TObject);
begin

     {Image9.Visible := false;
     Image10.Visible:=false;
     Image11.Visible:=false;
     Image12.Visible:=false;
     Image25.Visible:=false;
     Image26.Visible:=false;}
end;

procedure TForm_TELA_PRINCIPAL.imfClick(Sender: TObject);
begin
Panel1.Visible := false ;
end;

procedure TForm_TELA_PRINCIPAL.IMG3Click(Sender: TObject);
begin
Unit_CONS_PAGAM_AVISTA.Form_CONS_PAGAM_AVISTA.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.IMG4Click(Sender: TObject);
begin
Unit_CONS_PAGAM_APRAZO.Form_CONS_PAGAM_APRAZO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.IMG5Click(Sender: TObject);
begin
UNIT_CONS_PAGAM_PARCELADO.Form_CONS_PAGAM_PARCELADO.ShowModal;
end;

procedure TForm_TELA_PRINCIPAL.Label5Click(Sender: TObject);
begin
Panel1.Visible := FALSE ;
end;

procedure TForm_TELA_PRINCIPAL.REALIZARCONSULTA1Click(Sender: TObject);
var
  dia_c , mes_c , ano_c , hora_c : STRING;
  dia_cons, ano_cons, mes_cons, hora_cons : STRING;
begin

     if (AG_HOJEPACIENTE_AGENDAMENTO.AsInteger = 0) or (AG_HOJENOME_PACIENTE.AsString = '') then
     begin
          Application.MessageBox('N�o h� nenhum agendamento registrado!','ATEN��O!',MB_ICONEXCLAMATION);
          exit;
     end;
      GRAVA_CONSULTA.Parameters.ParamByName('@PACIENTE').Value := AG_HOJEPACIENTE_AGENDAMENTO.AsInteger ;

      GRAVA_CONSULTA.Parameters.ParamByName('@DENTISTA').Value := AG_HOJEDENTISTA_AGENDAMENTO.AsInteger;

      GRAVA_CONSULTA.Parameters.ParamByName('@TRATAMENTO').Value := AG_HOJETRATAMENTO_AGENDAMENTO.AsInteger;

      GRAVA_CONSULTA.Parameters.ParamByName('@OBS').Value := AG_HOJEOBS_AGENDAMENTO.AsString;

      dia_c := Copy(lbl_data.Caption,1,2);
      mes_c := Copy(lbl_data.Caption,4,2);
      ano_c := Copy(lbl_data.Caption,7,4);
      hora_c := Copy(lbl_data.Caption,14,8);

     GRAVA_CONSULTA.Parameters.ParamByName('@DTHORA_CADASTRO').Value := ano_c+'-'+ mes_c +'-'+ dia_c + ' ' + hora_c ;

     dia_cons := Copy(AG_HOJEDATAHORA_AGENDAMENTO.AsString,1,2);
     mes_cons := Copy(AG_HOJEDATAHORA_AGENDAMENTO.AsString,4,2);
     ano_cons := Copy(AG_HOJEDATAHORA_AGENDAMENTO.AsString,7,4);
     hora_cons := Copy(AG_HOJEDATAHORA_AGENDAMENTO.AsString,12,5);

     GRAVA_CONSULTA.Parameters.ParamByName('@DATAHORA').Value := ano_cons + '-' + mes_cons + '-' + dia_cons + ' ' + hora_cons ;



   GRAVA_CONSULTA.Parameters.ParamByName('@PREAGENDADO').Value := AG_HOJECOD_AGENDAMENTO.AsInteger;
   ALTERA_BIT_AG.Parameters.ParamByName('@CODIGO').Value := AG_HOJECOD_AGENDAMENTO.AsInteger;



 if Application.MessageBox('Tem certeza que deseja cadastrar a consulta?','CADASTRAR', mb_iconquestion + mb_yesno) = idYes then
  begin
    GRAVA_CONSULTA.ExecProc;

        with QUERY_USUARIO DO
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

      {    with UNIT_SELECIONA_AGENDAMENTO.FORM_SELECIONA_AGENDAMENTO.ADOQUERY_AG DO
          begin
            CLOSE;
            Active:= FALSE;
            Active:= TRUE ;
            OPEN;
          end; }

      Button1Click(SELF);
  end

  else
  begin
    exit;
  end;
end;

procedure TForm_TELA_PRINCIPAL.Timer1Timer(Sender: TObject);
begin
  lbl_data.caption := datetostr(date)+ ' | ' + timetostr(time);
end;

procedure TForm_TELA_PRINCIPAL.TrayIcon1Click(Sender: TObject);
begin
 Unit_TELA_PRINCIPAL.Form_TELA_PRINCIPAL.WindowState:=wsMaximized;
end;

end.
