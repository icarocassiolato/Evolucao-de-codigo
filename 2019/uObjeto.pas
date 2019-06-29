unit uObjeto;

interface

uses
  Windows, uComunicacaoWindows, Vcl.Graphics;

type
  TObjeto = class
  private
    FHandle: THandle;
    FComunicacaoWindows: TComunicacaoWindows;
    function PegarClasse: string;
    function PegarTexto: string;
    function PegarCaminhoExecutavel: string;
    function PegarHandle: integer;
    function PegarIcone: TIcon;
  public
    constructor Create(piHandle: integer);
    destructor Destroy;
    function PegarInformacoes: string;
    function EnviarTecla(pcTecla: Char): boolean;
    function Fechar: Boolean;
    procedure AtribuirHandle(const Value: integer);
    procedure Transparecer(piPorcentagem: integer);
    procedure AlternarVisualizacao(piTipoVisualizacao: integer);
    property Handle: integer read PegarHandle write AtribuirHandle;
    property Texto: string read PegarTexto;
    property Classe: string read PegarClasse;
    property CaminhoExecutavel: string read PegarCaminhoExecutavel;
    property Icone: TIcon read PegarIcone;
  end;

implementation

{ TObjeto }

uses
  SysUtils, Vcl.Forms, Winapi.ShellAPI;

{$REGION 'construtor/destrutor'}
constructor TObjeto.Create(piHandle: integer);
begin
  FHandle := piHandle;
  FComunicacaoWindows := TComunicacaoWindows.Create;;
end;

destructor TObjeto.Destroy;
begin
  FreeAndNil(FComunicacaoWindows);
end;
{$ENDREGION}

{$REGION 'getters and setters'}
function TObjeto.PegarHandle: integer;
begin
  Result := FHandle;
end;

procedure TObjeto.AtribuirHandle(const Value: integer);
begin
  FHandle := Value;
end;
{$ENDREGION}

{$REGION 'Pegar informações do objeto'}
function TObjeto.PegarClasse: string;
begin
  Result := FComunicacaoWindows.PegarTexto(FHandle, trtClasse);
end;

function TObjeto.PegarTexto: string;
begin
  Result := FComunicacaoWindows.PegarTexto(FHandle, trtTexto);
end;

function TObjeto.PegarCaminhoExecutavel: string;
begin
  Result := FComunicacaoWindows.PegarTexto(FHandle, trtCaminho);
end;
{$ENDREGION}

function TObjeto.PegarInformacoes: string;
begin
  Result := 'Handle: '  + IntToStr(FHandle) + sLineBreak +
            'Classe: '  + Classe            + sLineBreak +
            'Texto: '   + Texto             + sLineBreak +
            'Caminho: ' + CaminhoExecutavel + sLineBreak;
end;

procedure TObjeto.Transparecer(piPorcentagem: integer);
begin
  FComunicacaoWindows.AlterarTransparencia(FHandle, piPorcentagem);
end;

procedure TObjeto.AlternarVisualizacao(piTipoVisualizacao: integer);
begin
  ShowWindow(FHandle, piTipoVisualizacao);
end;

function TObjeto.EnviarTecla(pcTecla: Char): boolean;
begin
  Result := FComunicacaoWindows.EnviarTecla(FHandle, pcTecla);
end;

function TObjeto.Fechar: Boolean;
begin
  Result := FComunicacaoWindows.Fechar(FHandle);
end;

function TObjeto.PegarIcone: TIcon;
begin
  if CaminhoExecutavel.Length = 0 then
    Exit(nil);

  Result := TIcon.Create;
  Result.Handle := ExtractIcon(Application.Handle, PChar(CaminhoExecutavel), 0);
end;

end.
