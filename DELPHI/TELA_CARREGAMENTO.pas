unit TELA_CARREGAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GIFImg, jpeg, ExtCtrls, pngimage;

type
  TSplash_Screen = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Timer1: TTimer;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash_Screen: TSplash_Screen;

implementation

uses  Unit_LOGIN, FTGifAnimate, GifImage;

{$R *.dfm}

procedure TSplash_Screen.FormShow(Sender: TObject);
begin
Timer1.Enabled:=True;
end;

procedure TSplash_Screen.Timer1Timer(Sender: TObject);
begin
  Unit_LOGIN.Form1.Show;
end;

end.
