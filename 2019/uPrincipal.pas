unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uComunicacaoWindows, uObjeto, uHotKey;

type
  TTipoInformacao = (tiCursor, tiSelecionado);

  TFrmPrincipal = class(TForm)
    GbxCursor: TGroupBox;
    GbxSelecionado: TGroupBox;
    TmrAtualizacao: TTimer;
    MmoCursor: TMemo;
    MmoSelecionado: TMemo;
    GbxAcoes: TGroupBox;
    BtnOcultar: TSpeedButton;
    BtnMostrar: TSpeedButton;
    LblTransparencia: TLabel;
    TbrTransparencia: TTrackBar;
    BtnFechar: TSpeedButton;
    GbxEnviarTecla: TGroupBox;
    EdtTecla: TEdit;
    BtnEnviarTecla: TSpeedButton;
    ImgCursorIcone: TImage;
    ImgSelecionadoIcone: TImage;
    ChkSempreFrente: TCheckBox;
    LblSobre: TLabel;
    LblTutorial: TLabel;
    procedure OnKeyPressGenerico(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOcultarClick(Sender: TObject);
    procedure BtnMostrarClick(Sender: TObject);
    procedure TbrTransparenciaChange(Sender: TObject);
    procedure TmrAtualizacaoTimer(Sender: TObject);
    procedure EdtTeclaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEnviarTeclaClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure ChkSempreFrenteClick(Sender: TObject);
    procedure LblTutorialClick(Sender: TObject);
    procedure LblSobreClick(Sender: TObject);
  private
    FTeclaEnviar: char;
    FHotKey: THotKey;
    FComunicacaoWindows: TComunicacaoWindows;
    FObjetoCursor: TObjeto;
    FObjetoSelecionado: TObjeto;
    procedure PreencherInformacoes(peTipoInformacao: TTipoInformacao);
    procedure InstanciarObjeto(var poObjeto: TObjeto; piHandle: integer);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure AlterarTeclaEnviar(pKey: Char);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uMensagens;

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.WMHotKey(var Msg: TWMHotKey);
begin
  if integer(Msg.HotKey) = FHotKey.HK_Selecionar then
  begin
    InstanciarObjeto(FObjetoSelecionado, FComunicacaoWindows.PegarHandleCursor);
    PreencherInformacoes(tiSelecionado);
  end;

  if integer(Msg.HotKey) = FHotKey.HK_Ocultar then
    BtnOcultar.Click;

  if integer(Msg.HotKey) = FHotKey.HK_Mostrar then
    BtnMostrar.Click;
end;

procedure TFrmPrincipal.AlterarTeclaEnviar(pKey: Char);
begin
  FTeclaEnviar := pKey;
  EdtTecla.Text := pKey;
  GbxEnviarTecla.Caption := Format('Enviar tecla [%s]', [FTeclaEnviar]);
end;

procedure TFrmPrincipal.PreencherInformacoes(peTipoInformacao: TTipoInformacao);
begin
  if peTipoInformacao = tiCursor then
  begin
    MmoCursor.Text := FObjetoCursor.PegarInformacoes;
    ImgCursorIcone.Picture.Assign(FObjetoCursor.Icone);
  end
  else
  begin
    MmoSelecionado.Text := FObjetoSelecionado.PegarInformacoes;
    ImgSelecionadoIcone.Picture.Assign(FObjetoSelecionado.Icone);
  end;
end;

procedure TFrmPrincipal.BtnEnviarTeclaClick(Sender: TObject);
begin
  if not FObjetoSelecionado.EnviarTecla(FTeclaEnviar) then
    ShowMessage('Erro ao enviar tecla');
end;

procedure TFrmPrincipal.BtnFecharClick(Sender: TObject);
begin
  if not FObjetoSelecionado.Fechar then
    ShowMessage('Erro ao fechar objeto');
end;

procedure TFrmPrincipal.BtnMostrarClick(Sender: TObject);
begin
  FObjetoSelecionado.AlternarVisualizacao(SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.BtnOcultarClick(Sender: TObject);
begin
  FObjetoSelecionado.AlternarVisualizacao(SW_HIDE);
end;

procedure TFrmPrincipal.ChkSempreFrenteClick(Sender: TObject);
begin
  if ChkSempreFrente.Checked then
    FormStyle:= fsStayOnTop
  else
    FormStyle:= fsNormal;
end;

procedure TFrmPrincipal.EdtTeclaKeyPress(Sender: TObject; var Key: Char);
begin
  AlterarTeclaEnviar(Key);
end;

procedure TFrmPrincipal.TbrTransparenciaChange(Sender: TObject);
begin
  FObjetoSelecionado.Transparecer(TbrTransparencia.Position);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FComunicacaoWindows := TComunicacaoWindows.Create;
  FHotKey := THotKey.Create(Handle);
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FComunicacaoWindows);
  FreeAndNil(FHotKey);
end;

procedure TFrmPrincipal.OnKeyPressGenerico(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFrmPrincipal.InstanciarObjeto(var poObjeto: TObjeto; piHandle: integer);
begin
  if poObjeto = nil then
    poObjeto := TObjeto.Create(piHandle)
  else
    poObjeto.AtribuirHandle(piHandle);
end;

procedure TFrmPrincipal.LblSobreClick(Sender: TObject);
begin
  ShowMessage(cSOBRE);
end;

procedure TFrmPrincipal.LblTutorialClick(Sender: TObject);
begin
  ShowMessage(cTUTORIAL);
end;

procedure TFrmPrincipal.TmrAtualizacaoTimer(Sender: TObject);
begin
  if FComunicacaoWindows.PegarHandleCursor = MmoCursor.Handle then
    Exit;

  InstanciarObjeto(FObjetoCursor, FComunicacaoWindows.PegarHandleCursor);
  PreencherInformacoes(tiCursor);

  GbxAcoes.Enabled := FObjetoSelecionado <> nil;
end;

end.
