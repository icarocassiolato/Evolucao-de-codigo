program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {TForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Janela Mágica';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
