unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Fon: TImage;
    OPD: TOpenPictureDialog;
    Image1: TImage;
    Image2: TImage;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Zaz: TImage;
    SPD: TSavePictureDialog;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    ProgressBar: TProgressBar;
    Image9: TImage;
    Image10: TImage;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure N4Click(Sender: TObject);
    procedure ZazClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);

  private
  Function Razmer(X,Y:Integer):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  raz:string;
  flag:boolean;
  N,M:Integer;//���������� �����
  Xi,Yi: word;
  b,fl:boolean;
implementation

uses Unit2, Unit3, Unit4;


Procedure EasyZAZ;   //������� ���������� �������
  var
     X,Y,XM,YM:Word;
     btm: TBitmap; progres:integer;
     fr,fr2:Tcolor; R,G,B:byte;
  Begin
   btm := TBitMap.create;
   btm.Height:=form1.Image2.Height;
   btm.Width:=form1.Image2.Width;
   progres:=0;
   Form1.ProgressBar.Visible:=true;
   form1.ProgressBar.Min := 0;
   form1.ProgressBar.Max :=form1.image1.Width*form1.image1.Height;
   form1.ProgressBar.Position := 0;

   btm.Assign(Form1.Image2.Picture);

 for X :=0 to form1.image1.Width  do     //������ ������ ����������� � bmp �����
    for Y :=0 to form1.image1.Height do
       Begin
          xm:=((x*m) mod (form1.image2.Width-1))+1;
          ym:=((y*n) mod (form1.image2.Height-1))+1;
          fr:=form1.Image1.Canvas.Pixels[x,y];
          if Form1.RadioButton1.Checked=true then
          begin
          if ((Xm-1>0) and (ym-1>0)) then
                         begin
       R := round((GetRValue(fr)+GetRValue(btm.Canvas.Pixels[Xm-1,Ym-1])+
       GetRValue(btm.Canvas.Pixels[Xm,Ym-1])+GetRValue(btm.Canvas.Pixels[Xm+1,Ym-1])+
       GetRValue(btm.Canvas.Pixels[Xm-1,Ym])+GetRValue(btm.Canvas.Pixels[Xm+1,Ym])+
       GetRValue(btm.Canvas.Pixels[Xm-1,Ym+1])+GetRValue(btm.Canvas.Pixels[Xm,Ym+1])+
       GetRValue(btm.Canvas.Pixels[Xm+1,Ym+1]))/9);

       G := round((GetGValue(fr)+GetGValue(btm.Canvas.Pixels[Xm-1,Ym-1])+
       GetGValue(btm.Canvas.Pixels[Xm,Ym-1])+GetGValue(btm.Canvas.Pixels[Xm+1,Ym-1])+
       GetGValue(btm.Canvas.Pixels[Xm-1,Ym])+GetGValue(btm.Canvas.Pixels[Xm+1,Ym])+
       GetGValue(btm.Canvas.Pixels[Xm-1,Ym+1])+GetGValue(btm.Canvas.Pixels[Xm,Ym+1])+
       GetGValue(btm.Canvas.Pixels[Xm+1,Ym+1]))/9);

       B := round((GetBValue(fr)+GetBValue(btm.Canvas.Pixels[Xm-1,Ym-1])+
       GetBValue(btm.Canvas.Pixels[Xm,Ym-1])+GetBValue(btm.Canvas.Pixels[Xm+1,Ym-1])+
       GetBValue(btm.Canvas.Pixels[Xm-1,Ym])+GetBValue(btm.Canvas.Pixels[Xm+1,Ym])+
       GetBValue(btm.Canvas.Pixels[Xm-1,Ym+1])+GetBValue(btm.Canvas.Pixels[Xm,Ym+1])+
       GetBValue(btm.Canvas.Pixels[Xm+1,Ym+1]))/9);

                          fr:=RGB(R,G,B);
                         end;
          end;
         btm.Canvas.Pixels[Xm,Ym]:=fr;
         Inc(progres);
         Form1.ProgressBar.Position :=progres;
          Form1.ProgressBar.Update;
       End;
 form1.Image2.Picture.Assign(btm);//�������� bmp ���� � image2
 Form1.Image10.Picture:=form1.Image2.Picture;
 form1.image2.Proportional:=true;
 btm.Free;
 Form1.ProgressBar.Visible:=false;
 ShowMessage('������������')
  end;

Procedure EasyRAZ;   //������� ����������� �������
var
    X,Y,XM,YM:Word;
    btm: TBitmap;
    progres:integer;
    fr,fr2:Tcolor;R,G,B: byte;
Begin
  btm := TBitMap.create;
   btm.Height:=yi;
   btm.Width:=xi;

     progres:=0;
   Form1.ProgressBar.Visible:=true;
   form1.ProgressBar.Min := 0;
   form1.ProgressBar.Max :=xi*yi;
   form1.ProgressBar.Position := 0;

 for X :=0 to xi  do
    for Y :=0 to yi do
       Begin
          xm:=((x*m) mod (form1.image1.Width-1))+1;
          ym:=((y*n) mod (FORM1.image1.Height-1))+1;

          fr:=FORM1.Image1.Canvas.Pixels[xm,ym];
          R :=(GetRValue(fr)*9)- ((GetRValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym-1])+
       GetRValue(FORM1.Image1.Canvas.Pixels[Xm,Ym-1])+GetRValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym-1])+
       GetRValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym])+GetRValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym])+
       GetRValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym+1])+GetRValue(FORM1.Image1.Canvas.Pixels[Xm,Ym+1])+
       GetRValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym+1])));

       G := (GetGValue(fr)*9)- ((GetGValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym-1])+
       GetGValue(FORM1.Image1.Canvas.Pixels[Xm,Ym-1])+GetGValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym-1])+
       GetGValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym])+GetGValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym])+
       GetGValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym+1])+GetGValue(FORM1.Image1.Canvas.Pixels[Xm,Ym+1])+
       GetGValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym+1])));

       B := (GetBValue(fr)*9)- ((GetBValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym-1])+
       GetBValue(FORM1.Image1.Canvas.Pixels[Xm,Ym-1])+GetBValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym-1])+
       GetBValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym])+GetBValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym])+
       GetBValue(FORM1.Image1.Canvas.Pixels[Xm-1,Ym+1])+GetBValue(FORM1.Image1.Canvas.Pixels[Xm,Ym+1])+
       GetBValue(FORM1.Image1.Canvas.Pixels[Xm+1,Ym+1])));

                          fr:=RGB(R,G,B);

         btm.Canvas.Pixels[X,Y]:=fr;
         Inc(progres);
         Form1.ProgressBar.Position :=progres;
          Form1.ProgressBar.Update;
       End;
     FORM1.Image2.Picture.Assign(btm);
     Form1.Image10.Picture:=form1.Image2.Picture;
     FORM1.image2.Proportional:=true;
     btm.Free;
     Form1.ProgressBar.Visible:=false;
     ShowMessage('�������������')
End;
{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
flag:=false;b:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AnimateWindow(handle, 500, AW_BLEND or AW_HIDE);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
AnimateWindow(Handle, 500, AW_ACTIVATE or AW_SLIDE);
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
b:=false;form3.ShowModal;
end;

procedure TForm1.Image3Click(Sender: TObject);
var i:word;s,s2,x:string;
begin
s:='';s2:='';x:='';
for I :=Length(opd.FileName) Downto 1 do
    if opd.FileName[i]<>'\' then s:=s+opd.FileName[i] else break;
for I :=Length(s) Downto 1 do s2:=s2+s[i]; s:='';
for I :=1 to Length(s2) do if s2[i]<>'.' then s:=s+s2[i] else break;
s2:=s;
for I :=1 to Length(s) do if s[i]<>'#' then delete(s2,1,1) else begin delete(s2,1,1); break end;
s:=s2;
for I :=1 to length(s2) do if s2[i]<>'#' then begin x:=x+s2[i]; delete(s,1,1) end else begin delete(s,1,1); break end;
xi:=strtoint(x); yi:=strtoint(s);
// showmessage(inttostr(xi)+inttostr(yi)) ;
flag:=false;
form2.ShowModal;
If flag=true then EasyRaz;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
if OPD.Execute then
  Begin
  Image1.Picture.LoadFromFile(OPD.FileName);
  Image9.Picture:=image1.Picture;
  End;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
if OPD.Execute then
Begin
 Image2.Picture.LoadFromFile(OPD.FileName);
 Image10.Picture:=image2.Picture;
 End;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
if SPD.Execute then  Image2.Picture.SaveToFile(SPD.FileName+
Razmer(image1.Width,image1.Height)+'.bmp');
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
close
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
form4.ShowModal;
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
b:=true;form3.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
close
end;

function TForm1.Razmer(X, Y: Integer): string;
begin
Razmer:='#'+inttostr(x)+'#'+inttostr(y);
end;

procedure TForm1.ZazClick(Sender: TObject);
begin
form2.ShowModal;
If flag=true then EasyZaz;
end;

end.
