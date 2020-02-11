program Project2;

uses
  Forms,
  Unit_RESTAURA in 'Unit_RESTAURA.pas' {Form_RESTAURA};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_RESTAURA, Form_RESTAURA);
  Application.Run;
end.
