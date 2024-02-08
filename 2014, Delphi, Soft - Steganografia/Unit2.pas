unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
var Flagok:boolean;
begin
Flagok:=true;
try
  m:=strtoint(edit1.Text);
   n:=strtoint(edit2.Text);
except
  On EConvertError do
     Begin
        Flagok:=false;
        ShowMessage('������� �� ��������� ������');
      End;
end;
If Flagok then
 begin
   Flag:=true;
   close;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AnimateWindow(handle, 500, AW_BLEND or AW_HIDE);
end;

end.
