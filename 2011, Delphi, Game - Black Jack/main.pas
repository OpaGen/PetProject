unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, GIFImg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Opis: TLabel;
    opis2: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   c,slleg,slslog,slnorma : string;
   ttt: integer;
implementation

uses Knb, KrNol, Oprog, Tir, mazaika, Setting;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form2.ShowModal;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
form3.ShowModal;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  form6.ShowModal;
end;

procedure TForm1.FormActivate(Sender: TObject);
var IIGna256,izik: string;
  fna256: TextFile;       // פאיכ
  begin
  begin
getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
end;
 getdir(0,c);
 ttt:=0;

end;

procedure TForm1.FormCreate(Sender: TObject);
var IIGna256,izik: string;
  fna256: TextFile;       // פאיכ
  var rWorkArea: TRect;
  begin
 { begin
       SystemParametersInfo(SPI_GETWORKAREA, 0, @rWorkArea, 0);
      form1.WindowState:=wsMaximized;
      form1.Height:=rWorkArea.Bottom;
  end;}
  begin
getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
end;
 getdir(0,c);
 ttt:=0;
 
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
 form5.ShowModal;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
Form8.ShowModal;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
form4.ShowModal;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
close;
end;

end.
