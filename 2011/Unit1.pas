unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    SpeedButton3: TSpeedButton;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    SpeedButton4: TSpeedButton;
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowHwndAndClassName(CrPos: TPoint);
    procedure SelecionaHandle(Handle: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cTecla: Word;
  sTecla: String;

const
  Sobre = 'Programa desenvolvido por Ícaro A. M. Cassiolato'+#13+
          #13+
          'Modo de uso:'+#13+
          #13+
          'Ctrl+Cima: Pega o handle que está na posição do mouse'+#13+
          'Ctrl+Direita: Diminui a transparência da janela selecionada'+#13+
          'Ctrl+Esquerda: Aumenta a transparência da janela selecionada'+#13+
          'Ctrl+Alt+O: Oculta janela selecionada'+#13+
          'Ctrl+Alt+M: Mostra janela selecionada'+#13+
          #13+
          'Contato:'+#13+
          'E-Mail: ikru.piruk@gmail.com'+#13+
          'Twitter: @IcaroPiruka'+#13+
          'Mais programas: www.IcaroCassiolato.blog.com.br';

implementation

uses StrUtils, Math;

{$R *.dfm}

procedure TForm1.SelecionaHandle(Handle: String);
var
  hWnd: Integer;
  aName: array [0..255] of Char;
  Texto: array [0..255] of Char;
begin
  try
    hWnd := StrToInt(Handle);
    GetWindowText(hWnd, Texto, 256);

//    SendMessage(hWnd, WM_GETTEXT, 255, integer(@Texto));

    Label6.Caption := 'Handle: ' + IntToStr(hWnd);
    Label7.Caption:= 'Classe: '+
      IfThen(Boolean(GetClassName(hWnd, aName, 256)), string(aName), 'não encontrada');
    Label8.Caption:= 'Título: '+Texto;
  except
    Label6.Caption:= 'Handle:';
    Label7.Caption:= 'Classe:';
    Label8.Caption:= 'Título:';
  end;
end;

function TeclasPressionadas(Teclas: Array of Integer): Boolean;
var
  i: Integer;
begin
  Result:= True;
  for i:= 0 to Length(Teclas)-1 do
    Result:= Result and (GetAsyncKeyState(Teclas[i]) <> 0);
end;

procedure TForm1.ShowHwndAndClassName(CrPos: TPoint);
var
  hWnd: THandle;
  aName: array [0..255] of Char;
  Texto: array [0..255] of Char;
  HandleAntigo: String;
Label Vai;
begin
  hWnd := WindowFromPoint(CrPos);
  HandleAntigo:= Copy(Label3.Caption, 9, Length(Label3.Caption));
  if HandleAntigo = '' then
    Goto Vai;
  if (hWnd <> StrToInt(HandleAntigo)) then
  begin
    Vai:
    GetWindowText(hWnd, Texto, 256);
    Label3.Caption := 'Handle: ' + IntToStr(hWnd);
    Label4.Caption:= 'Classe: '+
      IfThen(Boolean(GetClassName(hWnd, aName, 256)), string(aName), 'não encontrada');
    Label5.Caption:= 'Título: '+Texto;
  end;
end;

procedure Transparece(h: HWND; Nivel: Integer);
begin
  SetWindowLong(h, GWL_EXSTYLE, GetWindowLong(h, GWL_EXSTYLE) or WS_EX_LAYERED);
  SetLayeredWindowAttributes(h, 0, Nivel, LWA_ALPHA);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  try
    Transparece(StrToInt(Edit1.Text), TrackBar1.Position);
  except
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  rPos: TPoint;
begin
  if Boolean(GetCursorPos(rPos)) then
    ShowHwndAndClassName(rPos);
  if TeclasPressionadas([VK_LCONTROL, VK_UP]) then
  begin
    Edit1.Text:= Copy(Label3.Caption, 9, Length(Label3.Caption));
    SelecionaHandle(Edit1.Text);
  end;
  if TeclasPressionadas([VK_LCONTROL, VK_LMENU, Ord('O')]) then
    SpeedButton1.Click;
  if TeclasPressionadas([VK_LCONTROL, VK_LMENU, Ord('M')]) then
    SpeedButton2.Click;
  if TrackBar1.Enabled then
  begin
    if TeclasPressionadas([VK_LCONTROL, VK_LEFT]) then
      TrackBar1.Position:= TrackBar1.Position-1;
    if TeclasPressionadas([VK_LCONTROL, VK_RIGHT]) then
      TrackBar1.Position:= TrackBar1.Position+1;
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key:= #0;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  try
    ShowWindow(StrToInt(Edit1.Text), SW_HIDE);
  except
    on EConvertError do
      ShowMessage('Handle inválido');
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  try
    ShowWindow(StrToInt(Edit1.Text), SW_SHOWNORMAL);
  except
    on EConvertError do
      ShowMessage('Handle inválido');
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  Habilita: Boolean;
  rPos: TPoint;
begin
  SelecionaHandle(Edit1.Text);
  if Boolean(GetCursorPos(rPos)) then
    ShowHwndAndClassName(rPos);
  Habilita:= (Edit1.Text <> '') and
             (Label7.Caption <> 'Classe:') and
             (Label7.Caption <> 'Classe: não encontrada');
  TrackBar1.Enabled:= Habilita;
  Edit2.Enabled:= Habilita;
  SpeedButton1.Enabled:= Habilita;
  SpeedButton2.Enabled:= Habilita;
  SpeedButton3.Enabled:= Habilita;
  SpeedButton4.Enabled:= Habilita;
  Edit2.Color:= IfThen(Habilita, clWindow, clSilver);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  try
    if sTecla = 'Inválida' then
    ShowMessage('Tecla inválida!'+#13+
                #13+
                'Teclas válidas:'+#13+
                'A a Z,'+#13+
                '0 a 9 (não usar NumPad),'+#13+
                'BACKSPACE,'+#13+
                'ENTER,'+#13+
                'ESPAÇO,'+#13+
                'DELETE');
    if not PostMessage(StrToInt(Edit1.Text), WM_CHAR, Ord(cTecla), 0) then
      ShowMessage('Erro ao enviar tecla');
  except
    on EConvertError do
      ShowMessage('Handle inválido');
  end;
end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Edit2.Text <> '' then
    Edit2.Text:= '';
  cTecla:= Key;

  case Key of
    65..90, 48..57: sTecla:= Char(cTecla);
    VK_BACK: sTecla:= 'BACKSPACE';
    VK_RETURN: sTecla:= 'ENTER';
    VK_SPACE: sTecla:= 'ESPAÇO';
    VK_DELETE: sTecla:= 'DELETE';
    else
      sTecla:= 'Inválida';
  end;
  GroupBox3.Caption:= 'Enviar tecla: '+sTecla;
end;

procedure TForm1.Label9Click(Sender: TObject);
begin
  ShowMessage(Sobre);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label9.Hint:= Sobre;
  Label9.ShowHint:= True;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    FormStyle:= fsStayOnTop
  else
    FormStyle:= fsNormal;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if not PostMessage(StrToInt(Edit1.Text), WM_CLOSE, 0, 0) then
    ShowMessage('Erro fechar janela');
end;

end.
