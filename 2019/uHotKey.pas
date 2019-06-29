unit uHotKey;

interface

type
  THotKey = class
    private
      FHandle,
      FSelecionar,
      FOcultar,
      FMostrar: integer;
      procedure RemoverRegistro(piHotKey: integer);
    public
      constructor Create(hHandle: THandle);
      destructor Destroy;

      property HK_Selecionar: integer read FSelecionar;
      property HK_Ocultar: integer read FOcultar;
      property HK_Mostrar: integer read FMostrar;
  end;

implementation

{ THotKey }

uses
  Windows;

procedure THotKey.RemoverRegistro(piHotKey: integer);
begin
  UnRegisterHotKey(FHandle, piHotKey);
  GlobalDeleteAtom(piHotKey);
end;

constructor THotKey.Create(hHandle: THandle);
const
  VK_A = $41;
  VK_B = $42;
  VK_C = $43;
begin
  FHandle := hHandle;

  FSelecionar := GlobalAddAtom('Hotkey1');
  FOcultar := GlobalAddAtom('Hotkey2');
  FMostrar := GlobalAddAtom('Hotkey3');

  RegisterHotKey(FHandle, FSelecionar, MOD_CONTROL + MOD_ALT, VK_A);
  RegisterHotKey(FHandle, FOcultar, MOD_CONTROL + MOD_ALT, VK_B);
  RegisterHotKey(FHandle, FMostrar, MOD_CONTROL + MOD_ALT, VK_C);
end;

destructor THotKey.Destroy;
begin
  RemoverRegistro(FSelecionar);
  RemoverRegistro(FOcultar);
  RemoverRegistro(FMostrar);
end;

end.
