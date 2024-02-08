unit KrNol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    KN1: TImage;
    Kn2: TImage;
    Kn3: TImage;
    Kn4: TImage;
    Kn5: TImage;
    Kn6: TImage;
    Kn7: TImage;
    Kn8: TImage;
    Kn9: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure KN1Click(Sender: TObject);
    procedure igra;
    procedure Kn2Click(Sender: TObject);
    procedure Kn3Click(Sender: TObject);
    procedure Kn4Click(Sender: TObject);
    procedure Kn5Click(Sender: TObject);
    procedure Kn6Click(Sender: TObject);
    procedure Kn7Click(Sender: TObject);
    procedure Kn8Click(Sender: TObject);
    procedure Kn9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
   c ,neas,popedaa,proig: string;
   x: byte;
   a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,c1,c2,c3,c4,c5,c6,c7,c8,c9 : boolean;
implementation

uses main;
   procedure tform3.igra;
begin
  if x=0 then
begin
if a1=true then
begin
   x:=random(8)
end
   else
   begin
   a1:=true;
   c1:=true;
kn1.Transparent:=true;
 kn1.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');

   end;
 end;
/////////////////
  if x=1 then
begin
if a2=true then
   x:=random(8)
   else
   begin
   c2:=true;
    a2:=true;
kn2.Transparent:=true;
 kn2.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=2 then
begin
if a3=true then
   x:=random(8)
   else
   begin
   c3:=true;
    a3:=true;
kn3.Transparent:=true;
 kn3.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=3 then
begin
if a4=true then
   x:=random(8)
   else
   begin
    c4:=true;
    a4:=true;
kn4.Transparent:=true;
 kn4.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=4 then
begin
if a5=true then
   x:=random(8)
   else
   begin
   c5:=true;
    a5:=true;
kn5.Transparent:=true;
 kn5.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=5 then
begin
if a6=true then
   x:=random(8)
   else
   begin
   c6:=true;
    a6:=true;
kn6.Transparent:=true;
 kn6.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=6 then
begin
if a7=true then
   x:=random(8)
   else
   begin
    c7:=true;
    a7:=true;
kn7.Transparent:=true;
 kn7.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=7 then
begin
if a8=true then
   x:=random(8)
   else
   begin
    c8:=true;
    a8:=true;
kn8.Transparent:=true;
 kn8.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
/////////////////
  if x=8 then
begin
if a9=true then
   x:=random(8)
   else
   begin
   c9:=true;
    a9:=true;
kn9.Transparent:=true;
 kn9.Picture.LoadFromFile(c+'\images\images for Kn\nolik.bmp');
end;
end;
end;
{$R *.dfm}


  procedure TForm3.KN1Click(Sender: TObject);
begin
kn1.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn1.Transparent:=true;
x:=random(8);
a1:=true;
 igra;
 b1:=true;

end;

procedure TForm3.Kn2Click(Sender: TObject);
begin
kn2.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn2.Transparent:=true;
x:=random(8);
a2:=true;
b2:=true;
 igra;
end;

procedure TForm3.Kn3Click(Sender: TObject);
begin
kn3.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn3.Transparent:=true;
x:=random(8);
a3:=true;
b3:=true;
 igra;
end;

procedure TForm3.Kn4Click(Sender: TObject);
begin
kn4.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn4.Transparent:=true;
x:=random(8);
a4:=true;
b4:=true;
 igra;
end;

procedure TForm3.Kn5Click(Sender: TObject);
begin
kn5.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn5.Transparent:=true;
x:=random(8);
a5:=true;
b5:=true;
 igra;
end;

procedure TForm3.Kn6Click(Sender: TObject);
begin
kn6.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn6.Transparent:=true;
x:=random(8);
a6:=true;
b6:=true;
 igra;
end;

procedure TForm3.Kn7Click(Sender: TObject);
begin
kn7.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn7.Transparent:=true;
x:=random(8);
a7:=true;
b7:=true;
 igra;
end;

procedure TForm3.Kn8Click(Sender: TObject);
begin
kn8.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn8.Transparent:=true;
x:=random(8);
a8:=true;
b8:=true;
 igra;
end;

procedure TForm3.Kn9Click(Sender: TObject);
begin
kn9.Picture.LoadFromFile(c+'\images\images for Kn\krestik.bmp');
kn9.Transparent:=true;
x:=random(8);
a9:=true;
b9:=true;
 igra;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
kn1.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn2.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn3.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn4.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn5.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn6.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn7.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn8.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn9.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn1.Transparent:=false;
kn2.Transparent:=false;
kn3.Transparent:=false;
kn4.Transparent:=false;
kn5.Transparent:=false;
kn6.Transparent:=false;
kn7.Transparent:=false;
kn8.Transparent:=false;
kn9.Transparent:=false;
 a1:=false;
  a2:=false;
   a3:=false;
    a4:=false;
     a5:=false;
      a6:=false;
       a7:=false;
        a8:=false;
         a9:=false;
          b1:=false;
  b2:=false;
   b3:=false;
    b4:=false;
     b5:=false;
      b6:=false;
       b7:=false;
        b8:=false;
         b9:=false;
          c1:=false;
  c2:=false;
   c3:=false;
    c4:=false;
     c5:=false;
      c6:=false;
       c7:=false;
        c8:=false;
         c9:=false;
         label1.Caption:=neas;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
if (b1=true) and (b2=true) and (b3=true) then
label1.caption:=popedaa;
if (b4=true) and (b5=true) and (b6=true) then
label1.caption:=popedaa;
if (b7=true) and (b8=true) and (b9=true) then
label1.caption:=popedaa;
if (b1=true) and (b4=true) and (b7=true) then
label1.caption:=popedaa;
if (b2=true) and (b5=true) and (b8=true) then
label1.caption:=popedaa;
if (b3=true) and (b6=true) and (b9=true) then
label1.caption:=popedaa;
if (b1=true) and (b5=true) and (b9=true) then
label1.caption:=popedaa;
if (b3=true) and (b5=true) and (b7=true) then
label1.caption:=popedaa;
////////////////////////////////////////////
if (c1=true) and (c2=true) and (c3=true) then
label1.caption:=proig;
if (c4=true) and (c5=true) and (c6=true) then
label1.caption:=proig;
if (c7=true) and (c8=true) and (c9=true) then
label1.caption:=proig;
if (c1=true) and (c4=true) and (c7=true) then
label1.caption:=proig;
if (c2=true) and (c5=true) and (c8=true) then
label1.caption:=proig;
if (c3=true) and (c6=true) and (c9=true) then
label1.caption:=proig;
if (c1=true) and (c5=true) and (c9=true) then
label1.caption:=proig;
if (c3=true) and (c5=true) and (c7=true) then
label1.caption:=proig;
end;

procedure TForm3.FormActivate(Sender: TObject);
var IIGna256,izik: string;
  fna256: TextFile;       // файл
begin
begin
  getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
end;

 if izik='Русский' then
 begin
   form3.Caption:='Крестики нолики';
   n1.Caption:='Начать заново';
 end;
 if izik='English' then
  begin
  form3.Caption:='cross and zero';
   n1.Caption:='Try back';

  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     kn1.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn2.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn3.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn4.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn5.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn6.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn7.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn8.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn9.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn1.Transparent:=false;
kn2.Transparent:=false;
kn3.Transparent:=false;
kn4.Transparent:=false;
kn5.Transparent:=false;
kn6.Transparent:=false;
kn7.Transparent:=false;
kn8.Transparent:=false;
kn9.Transparent:=false;
 a1:=false;
  a2:=false;
   a3:=false;
    a4:=false;
     a5:=false;
      a6:=false;
       a7:=false;
        a8:=false;
         a9:=false;
          b1:=false;
  b2:=false;
   b3:=false;
    b4:=false;
     b5:=false;
      b6:=false;
       b7:=false;
        b8:=false;
         b9:=false;
          c1:=false;
  c2:=false;
   c3:=false;
    c4:=false;
     c5:=false;
      c6:=false;
       c7:=false;
        c8:=false;
         c9:=false;
         label1.Caption:='Еще не ясно кто победит';
end;

procedure TForm3.FormCreate(Sender: TObject);
var IIGna256,izik: string;
  fna256: TextFile;       // файл
begin
begin
  getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
end;

 if izik='Русский' then
 begin
   form3.Caption:='Крестики нолики';
   n1.Caption:='Начать заново';
   popedaa:='Вы выиграли';
   proig:='Вы проиграли';
   neas:='Еще не ясно кто победит';
 end;
 if izik='English' then
  begin
  form3.Caption:='cross and zero';
   n1.Caption:='Try back';
    popedaa:='You won';
   proig:='You lose';
   neas:='It is not clear who will win';

  end;
  getdir(0,c);

         kn1.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn2.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn3.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn4.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn5.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn6.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn7.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn8.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn9.Picture.LoadFromFile(c+'\images\images for Kn\Neizvestno.bmp');
kn1.Transparent:=false;
kn2.Transparent:=false;
kn3.Transparent:=false;
kn4.Transparent:=false;
kn5.Transparent:=false;
kn6.Transparent:=false;
kn7.Transparent:=false;
kn8.Transparent:=false;
kn9.Transparent:=false;
 a1:=false;
  a2:=false;
   a3:=false;
    a4:=false;
     a5:=false;
      a6:=false;
       a7:=false;
        a8:=false;
         a9:=false;
          b1:=false;
  b2:=false;
   b3:=false;
    b4:=false;
     b5:=false;
      b6:=false;
       b7:=false;
        b8:=false;
         b9:=false;
          c1:=false;
  c2:=false;
   c3:=false;
    c4:=false;
     c5:=false;
      c6:=false;
       c7:=false;
        c8:=false;
         c9:=false;
         label1.Caption:=neas;

end;

end.
