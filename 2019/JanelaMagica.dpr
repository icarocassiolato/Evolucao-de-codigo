program JanelaMagica;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uComunicacaoWindows in 'uComunicacaoWindows.pas',
  uObjeto in 'uObjeto.pas',
  uHotKey in 'uHotKey.pas',
  uMensagens in 'uMensagens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
