unit Knb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Menus;

type
  TForm2 = class(TForm)
    Image1: TImage;
    kamen: TImage;
    bumaga: TImage;
    nojnici: TImage;
    KamenKomp: TImage;
    nojniciKomp: TImage;
    bumkomp: TImage;
    fin: TLabel;
    nicy: TLabel;
    proig: TLabel;
    komp: TLabel;
    Label1: TLabel;
    igrok: TLabel;
    kop: TImage;
    FFF: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure kamenClick(Sender: TObject);
    procedure bumagaClick(Sender: TObject);
    procedure nojniciClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    procedure Pobeda;
    procedure Proigral;
    procedure Niciay;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
   x,x2,kamen,bumaga,nojnici: integer;
   c: string;
   kk,nk,bk,ki,ni,bi,style : string;
   vig,proig,nic,www2: integer;

       var AdrSt1: string;
  fx122: TextFile;       // файл
   fstyle122,www1,p,n,v: String; // имя файла
   statproig,statnic,statvig: integer; // имя файла

implementation

uses main;
 procedure tform2.Pobeda;
 begin
 //считать значение
getdir(0,adrst1);
  adrst1:=adrst1+'\Setting\StatisVigKnb.txt';
  AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  www2:=strtoint(www1);
  statvig:=www2+1;
  www1:=inttostr(statvig);
  N4.Caption:='Побед => '+inttostr(statvig);
  //вписать новое
    AssignFile(fx122, adrst1);
   Rewrite(fx122);  // открыть для перезаписи
  // www1:='Да';
   // запись в файл
          writeln(fx122,www1  );
 CloseFile(fx122); // закрыть файл
 end;
procedure tform2.Proigral;
begin
       getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisProigknb.txt';
   AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  www2:=strtoint(www1);
  statproig:=www2+1;
  www1:=inttostr(statproig);
  N2.Caption:='Проигрышей => '+inttostr(statproig);
  //вписать новое
    AssignFile(fx122, adrst1);
   Rewrite(fx122);  // открыть для перезаписи
  // www1:='Да';
   // запись в файл
          writeln(fx122,www1  );
 CloseFile(fx122); // закрыть файл
end;
procedure  tform2.Niciay;
begin
     getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisNicknb.txt';
      AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  www2:=strtoint(www1);
  statnic:=www2+1;
  www1:=inttostr(statnic);
   N3.Caption:='Ничьих => '+inttostr(statnic);
  //вписать новое
    AssignFile(fx122, adrst1);
   Rewrite(fx122);  // открыть для перезаписи
  // www1:='Да';
   // запись в файл
          writeln(fx122,www1  );
 CloseFile(fx122); // закрыть файл
end;

//ses main;

{$R *.dfm}

procedure TForm2.bumagaClick(Sender: TObject);
begin
getdir(0,c);
//c:=c+'\images\images for KNB\';
kop.Picture.LoadFromFile(c+style+'bum.bmp');
 igrok.Caption:='Бумага';
x:=x2;
  x:=random(3);
  if x=x2 then
     x:=random(2);
  if x=0 then
begin
  kamenkomp.Visible:=true;
  nicy.Visible:=false;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=false;
  fin.Visible:=true;    pobeda;
  proig.Visible:=false;
   komp.Caption:='Камень';
   fff.Picture.LoadFromFile(c+style+'Vig.bmp');
end;
  if x=1 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=true;
  nojnicikomp.Visible:=false;
   fin.Visible:=false;
  proig.Visible:=false;
    nicy.Visible:=true;  Niciay;
     komp.Caption:='Бумага';
      fff.Picture.LoadFromFile(c+style+'nic.bmp');
end;
  if x=2 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=true;
   fin.Visible:=false;
  proig.Visible:=true; Proigral;
    nicy.Visible:=false;
     komp.Caption:='Ножницы';
        fff.Picture.LoadFromFile(c+style+'proig.bmp');
end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var IIG,iig2,iig3: string;
   fx: TextFile;       // файл
  {
   var IIGna256,izik: string;
  fna256: TextFile; }
   begin
getdir(0,IIg);
  IIG:=IIG+'\Setting\StyleKnb.txt';
  AssignFile(fx,IIG);
  Reset (fx);
  Read(fx,style);
  CloseFile(fx);
 begin
getdir(0,c);
 end;
  igrok.Caption:='';
  komp.Caption:='';
   fin.Visible:=false;
   proig.Visible:=false;
    nicy.Visible:=false;
     // загрузка стиля для комппаа
     bumkomp.Picture.LoadFromFile(c+style+'bum.bmp');
      kamenkomp.Picture.LoadFromFile(c+style+'kamen.bmp');
       nojnicikomp.Picture.LoadFromFile(c+style+'noj.bmp');
       //загрузка панели выбора
        bumaga.Picture.LoadFromFile(c+style+'bum.bmp');
      kamen.Picture.LoadFromFile(c+style+'kamen.bmp');
       nojnici.Picture.LoadFromFile(c+style+'noj.bmp');
          {      begin
getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256); }
{end;

 if izik='Русский' then
 begin
   //крестики нолики
   Form2.Caption:='Камень ножницы бумага';
   Fin.caption:='Вы выиграли';
   nicy.Caption:='Ничья';
   proig.Caption:='Вы проиграли';
   n1.Caption:='Статистика';
   n2.Caption:='Проигрышей';
   n3.Caption:='Ничьих';
   n4.Caption:='Выйгрышей';
   n5.Caption:='Выход';
 {end;
 if izik='English' then
  begin
     //крестики нолики
     Form2.Caption:='Stone scissors paper';
   Fin.caption:='You have won';
   nicy.Caption:='Draw';
   proig.Caption:='You have lost';
    n1.Caption:='Statistics';
   n2.Caption:='Losses';
   n3.Caption:='Draws';
   n4.Caption:='Winnings';
   n5.Caption:='Close';
  end;     }
     Begin
      //загрузка ничья проигрыш выгрыш
   getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisNicknb.txt';
      AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
   N3.Caption:=n+www1;

     getdir(0,adrst1);
  adrst1:=adrst1+'\Setting\StatisVigKnb.txt';
  AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  N4.Caption:=v+www1;

 getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisProigknb.txt';
   AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  N2.Caption:=p+www1;
   End;

end;


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  igrok.Caption:='';
  komp.Caption:='';
   fin.Visible:=false;
   proig.Visible:=false;
    nicy.Visible:=false;
end;

procedure TForm2.FormCreate(Sender: TObject);
var IIG,iig2,iig3: string;
   fx: TextFile;       // файл

   var IIGna256,izik: string;
  fna256: TextFile;
   begin

getdir(0,IIg);
  IIG:=IIG+'\Setting\StyleKnb.txt';
  AssignFile(fx,IIG);
  Reset (fx);
  Read(fx,style);
  CloseFile(fx);
 begin
getdir(0,c);
 end;
  igrok.Caption:='';
  komp.Caption:='';
   fin.Visible:=false;
   proig.Visible:=false;
    nicy.Visible:=false;
    // загрузка стиля для комппаа
     bumkomp.Picture.LoadFromFile(c+style+'bum.bmp');
      kamenkomp.Picture.LoadFromFile(c+style+'kamen.bmp');
       nojnicikomp.Picture.LoadFromFile(c+style+'noj.bmp');
       //загрузка панели выбора
        bumaga.Picture.LoadFromFile(c+style+'bum.bmp');
      kamen.Picture.LoadFromFile(c+style+'kamen.bmp');
       nojnici.Picture.LoadFromFile(c+style+'noj.bmp');
         begin
getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
 if izik='Русский' then
 begin
   //крестики нолики
   Form2.Caption:='Камень ножницы бумага';
   Fin.caption:='Вы выиграли';
   nicy.Caption:='Ничья';
   proig.Caption:='Вы проиграли';
    n1.Caption:='Статистика';
  p:='Проигрышей  ';
   n:='Ничьих  ';
   v:='Выйгрышей  ';
   n5.Caption:='Выход';
 end;
 if izik='English' then
  begin
     //крестики нолики
     Form2.Caption:='Stone scissors paper';
   Fin.caption:='You have won';
   nicy.Caption:='Tie up';
   proig.Caption:='You have lost';
     n1.Caption:='Statistics';
  p:='Losses  ';
   n:='Draws  ';
   v:='Winnings  ';
   n5.Caption:='Close';
  end;
         end;
       Begin
      //загрузка ничья проигрыш выгрыш
   getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisNicknb.txt';
      AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
   N3.Caption:=n+www1;

     getdir(0,adrst1);
  adrst1:=adrst1+'\Setting\StatisVigKnb.txt';
  AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  N4.Caption:=v+www1;

 getdir(0,adrst1);
 adrst1 :=adrst1+'\Setting\StatisProigknb.txt';
   AssignFile(fx122,adrst1);
  Reset (fx122);
  Read(fx122,www1);
  CloseFile(fx122);
  //
  N2.Caption:=p+www1;
   End;

end;

procedure TForm2.kamenClick(Sender: TObject);
begin
getdir(0,c);

kop.Picture.LoadFromFile(c+style+'kamen.bmp');
 igrok.Caption:='Камень';
  x:=x2;
  x:=random(3);
  if x=x2 then
     x:=random(2);
  if x=0 then
begin
  kamenkomp.Visible:=true;
  nicy.Visible:=true;   Niciay;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=false;
  fin.Visible:=false;
  proig.Visible:=false;
  komp.Caption:='Камень';
   fff.Picture.LoadFromFile(c+style+'nic.bmp');
end;
  if x=1 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=true;
  nojnicikomp.Visible:=false;
   fin.Visible:=false;
  proig.Visible:=true;    Proigral;
    nicy.Visible:=false;
     komp.Caption:='Бумага';
     fff.Picture.LoadFromFile(c+style+'proig.bmp');
end;
  if x=2 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=true;
   fin.Visible:=true;    Pobeda;
  proig.Visible:=false;
    nicy.Visible:=false;
     komp.Caption:='Ножницы';
      fff.Picture.LoadFromFile(c+style+'Vig.bmp');
end;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
close;
end;

procedure TForm2.nojniciClick(Sender: TObject);
begin
getdir(0,c);
//c:=c+'\images\images for KNB\';
kop.Picture.LoadFromFile(c+style+'noj.bmp');
 igrok.Caption:='Ножницы';
x:=x2;
  x:=random(3);
  if x=x2 then
     x:=random(2);
  if x=0 then
begin
  kamenkomp.Visible:=true;
  nicy.Visible:=false;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=false;
  fin.Visible:=false;
  proig.Visible:=true;  Proigral;
   komp.Caption:='Камень';
    fff.Picture.LoadFromFile(c+style+'proig.bmp');
end;
  if x=1 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=true;
  nojnicikomp.Visible:=false;
   fin.Visible:=true;    Pobeda;
  proig.Visible:=false;
    nicy.Visible:=false;
     komp.Caption:='Бумага';
     fff.Picture.LoadFromFile(c+style+'Vig.bmp');
end;
  if x=2 then
begin
  kamenkomp.Visible:=false;
  bumkomp.Visible:=false;
  nojnicikomp.Visible:=true;
   fin.Visible:=false;
  proig.Visible:=false;
    nicy.Visible:=true;   Niciay;
     komp.Caption:='Ножницы';
     fff.Picture.LoadFromFile(c+style+'nic.bmp');
end;
end;

end.
