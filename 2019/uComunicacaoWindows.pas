unit uComunicacaoWindows;

interface

uses
  Windows, Messages;

type
  TTipoRequisicaoTexto = (trtClasse, trtTexto, trtCaminho);

  TComunicacaoWindows = class
    private
      function PostarMensagem(piHandle: THandle; pcMensagem: Cardinal;
        piParametro1: NativeUInt = 0; piParametro2: NativeInt = 0): boolean;
    public
      function PegarHandleCursor: THandle;
      function PegarTexto(piHandle: THandle; ptrtTipoRequisicao: TTipoRequisicaoTexto): string;
      function EnviarTecla(piHandle: THandle; pcTecla: Char): Boolean;
      function Fechar(piHandle: THandle): Boolean;
      procedure AlterarTransparencia(piHandle: THandle;
        piNivelOpacidade: Integer);
  end;

implementation

{ TComunicacaoWindows }

uses
  SysUtils, uObjeto, StrUtils;

function TComunicacaoWindows.PegarHandleCursor: THandle;
var
  pPosicaoMouse: TPoint;
begin
  GetCursorPos(pPosicaoMouse);
  Result := WindowFromPoint(pPosicaoMouse);
end;

function TComunicacaoWindows.PegarTexto(piHandle: THandle;
  ptrtTipoRequisicao: TTipoRequisicaoTexto): string;
var
  asResult: array [0..255] of char;
begin
  asResult := '';

  case ptrtTipoRequisicao of
    trtClasse: GetClassName(piHandle, asResult, SizeOf(asResult));
    trtTexto: GetWindowText(piHandle, asResult, SizeOf(asResult));
    trtCaminho: GetWindowModuleFileName(piHandle, asResult, SizeOf(asResult));
  end;

  Result := asResult;
end;

procedure TComunicacaoWindows.AlterarTransparencia(piHandle: THandle; piNivelOpacidade: Integer);
begin
  SetWindowLong(piHandle, GWL_EXSTYLE, GetWindowLong(piHandle, GWL_EXSTYLE) or WS_EX_LAYERED);
  SetLayeredWindowAttributes(piHandle, 0, piNivelOpacidade, LWA_ALPHA);
end;

function TComunicacaoWindows.PostarMensagem(piHandle: THandle; pcMensagem: Cardinal;
  piParametro1: NativeUInt = 0; piParametro2: NativeInt = 0): boolean;
begin
  Result := PostMessage(piHandle, pcMensagem, piParametro1, piParametro2);
end;

function TComunicacaoWindows.EnviarTecla(piHandle: THandle; pcTecla: Char): Boolean;
begin
  Result := PostarMensagem(piHandle, WM_CHAR, Ord(pcTecla));
end;

function TComunicacaoWindows.Fechar(piHandle: THandle): Boolean;
begin
  Result := PostarMensagem(piHandle, WM_CLOSE);
end;

end.
