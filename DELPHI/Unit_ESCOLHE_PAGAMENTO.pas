unit Unit_ESCOLHE_PAGAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, jpeg;

type
  TForm_ESCOLHE_PAGAMENTO = class(TForm)
    Image1: TImage;
    imd: TImage;
    Image3: TImage;
    procedure Image3Click(Sender: TObject);
    procedure IMG3Click(Sender: TObject);
    procedure IMG4Click(Sender: TObject);
    procedure IMG5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure imdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ESCOLHE_PAGAMENTO: TForm_ESCOLHE_PAGAMENTO;

implementation

uses UNIT_GRAVA_PAGAMENTO_DENTISTA, UNIT_PAGAMENTO_DENTISTA,
  Unit_CONS_PAGAM_AVISTA, Unit_CONS_PAGAM_APRAZO,
  FORM_GRAVA_PAGAMENTO_PACIENTE_PARCELADO, UNIT_GRAVA_PAGAMENTO_FUNCIONARIO,
  UNIT_CONS_PAGAM_PARCELADO, Unit_PAGAR_FUNCIONARIO;

{$R *.dfm}

procedure TForm_ESCOLHE_PAGAMENTO.Image1Click(Sender: TObject);
begin
Unit_PAGAR_FUNCIONARIO.Form_PAG_FUNCIONARIO.ShowModal;
WITH Unit_PAGAR_FUNCIONARIO.Form_PAG_FUNCIONARIO DO
BEGIN
    RadioGroup2.ItemIndex := -1 ;
END;
end;

procedure TForm_ESCOLHE_PAGAMENTO.Image3Click(Sender: TObject);
begin
 Form_ESCOLHE_PAGAMENTO.Close;
end;

procedure TForm_ESCOLHE_PAGAMENTO.imdClick(Sender: TObject);
begin
UNIT_PAGAMENTO_DENTISTA.FORM_PAGAMENTO_DENTISTA.ShowModal;
end;

procedure TForm_ESCOLHE_PAGAMENTO.IMG3Click(Sender: TObject);
begin
Unit_CONS_PAGAM_AVISTA.Form_CONS_PAGAM_AVISTA.ShowModal;
end;

procedure TForm_ESCOLHE_PAGAMENTO.IMG4Click(Sender: TObject);
begin
Unit_CONS_PAGAM_APRAZO.Form_CONS_PAGAM_APRAZO.ShowModal;
end;

procedure TForm_ESCOLHE_PAGAMENTO.IMG5Click(Sender: TObject);
begin
UNIT_CONS_PAGAM_PARCELADO.Form_CONS_PAGAM_PARCELADO.RadioGroup1.ItemIndex := -1 ;
  UNIT_CONS_PAGAM_PARCELADO.Form_CONS_PAGAM_PARCELADO.RadioGroup3.ItemIndex := -1 ;
UNIT_CONS_PAGAM_PARCELADO.Form_CONS_PAGAM_PARCELADO.ShowModal;
end;

end.
