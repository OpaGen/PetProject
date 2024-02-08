unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm3.FormActivate(Sender: TObject);
begin
if b then
form3.Image1.Picture:=form1.Image1.Picture
else
 form3.Image1.Picture:=form1.Image2.Picture
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 AnimateWindow(handle, 500, AW_BLEND or AW_HIDE);
end;

procedure TForm3.FormShow(Sender: TObject);
begin
 AnimateWindow(handle, 500, AW_BLEND or AW_HIDE);
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
close
end;

end.
