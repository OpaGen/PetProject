unit mazaika;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Menus, StdCtrls, Buttons, ComCtrls;

type
  TForm5 = class(TForm)
    FonImage: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Im1: TImage;
    Im2: TImage;
    Im3: TImage;
    Im4: TImage;
    Kalloda: TImage;
    Kony: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    moiock: TLabel;
    NameIgrok: TLabel;
    ObnovkenirLabelOV: TTimer;
    prod: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Razum_Komp: TTimer;
    RazumStavka: TTimer;
    SKX: TLabel;
    sky: TLabel;
    Timer1: TTimer;
    UpDown1: TUpDown;
    You1: TImage;
    You2: TImage;
    You3: TImage;
    You4: TImage;
    youock: TLabel;
    za1: TImage;
    za2: TImage;
    za3: TImage;
    za4: TImage;
    VisKarti: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Im2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure prodClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Razum_KompTimer(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ObnovkenirLabelOVTimer(Sender: TObject);
    procedure RazumStavkaTimer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure VisKartiTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  //сТРОКОВЫЕ ПЕРЕМНЕНЫЕ КАРТ 36карт
  B6,C6,K6,P6,B7,C7,K7,P7,B8,C8,K8,P8,B9,C9,K9,P9,B10,C10,K10,P10 : string;
  BJ,CJ,KJ,PJ,BQ,CQ,KQ,PQ,BK,CK,KK,PK,BT,CT,KT,PT : string;
  RUB,JOKER: string;
  Fon:string;
  //строковые переменные добавочные карты 52
  B2,C2,K2,P2,B3,C3,K3,P3,B4,C4,K4,P4,B5,C5,K5,P5: STRING;
    c : string;
    //пЕРЕМЕННЫЕ ДЛЯ СЧЁТА  карт И ВЫБОРА КАРТ
    x1,x2,x3,x4: integer;
    y1,y2,y3,y4: integer;
    x: integer;
    //переменные для счета игр.денег
    //и коллво карт
    //и очков
    KOlKart: integer;
    ManyX: integer;
    ManyY: integer;
    sx,sy,okx1,okx2,okx3,okx4,oky1,oky2,oky3,oky4: integer;
    //Очки туза 1 или 11
    tuzx,tuzy,tuzxx: byte;
    //Переменная для разума компьютера
    shagkomp: byte;
       //Переменная ставки и кона
    stavka: integer;
    stavkaY: integer;
    Kon:integer;
    StavkiY: integer;
    StavkiX: integer;
    //Переменные булевского типа
    dalshe,STAVKAPro: boolean;
    ///Переменная процесса
    str: string;
    //Переменная новой игры
    NewGame: byte;
    //Переменная с именем игрока
    NameGamer: string;
    //Переменная со стилем адресс
    Styleadr: string;
    //Переменные для загрузки закрыв карт и коллоды
    kol:string;
    zakr:string;
    //Переменная фона
    fongreen: string;
    //переменные нужные для смены языка
    proigrall,vigrall,nicay,notmoney,compnotmoney,notst,youvigralbros,comppodst,youpereborchik,comppereborchik: string;
implementation

uses Unit7, Setting, Rec;

{$R *.dfm}

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
KolKart:=KolKart+1;
//Loading 3 karti
if kolkart=3 then
 begin
    x:=random(52);
    if (x=x2) or (x=x1) then
       x:=random(52)
    else
       x3:=x;
    //Loading Moi First kart
case (x3) of
//Загрузка шестерок
1:begin im3.Picture.LoadFromFile(b6); okx3:=6; end;
2:begin im3.Picture.LoadFromFile(c6); okx3:=6; end;
3:begin im3.Picture.LoadFromFile(k6); okx3:=6; end;
4:begin im3.Picture.LoadFromFile(p6); okx3:=6; end;
//Loading Seven
5:begin im3.Picture.LoadFromFile(b7);  okx3:=7; end;
6:begin im3.Picture.LoadFromFile(c7);  okx3:=7; end;
7:begin im3.Picture.LoadFromFile(k7);  okx3:=7; end;
8:begin im3.Picture.LoadFromFile(p7);  okx3:=7; end;
//Loading 8
9:begin im3.Picture.LoadFromFile(b8);  okx3:=8; end;
10:begin im3.Picture.LoadFromFile(c8); okx3:=8; end;
11:begin im3.Picture.LoadFromFile(k8); okx3:=8; end;
12:begin im3.Picture.LoadFromFile(p8);okx3:=8; end;
//Loading 9
13:begin im3.Picture.LoadFromFile(b9);okx3:=9; end;
14:begin im3.Picture.LoadFromFile(c9);okx3:=9; end;
15:begin im3.Picture.LoadFromFile(k9); okx3:=9; end;
16:begin im3.Picture.LoadFromFile(p9); okx3:=9; end;
//Loading 10
17:begin im3.Picture.LoadFromFile(b10); okx3:=10; end;
18:begin im3.Picture.LoadFromFile(c10);  okx3:=10; end;
19:begin im3.Picture.LoadFromFile(k10);   okx3:=10; end;
20:begin im3.Picture.LoadFromFile(p10);  okx3:=10; end;
//Loading Valet
21:begin im3.Picture.LoadFromFile(bj); okx3:=10; end;
22:begin im3.Picture.LoadFromFile(cj);  okx3:=10; end;
23:begin im3.Picture.LoadFromFile(kj); okx3:=10; end;
24:begin im3.Picture.LoadFromFile(pj); okx3:=10; end;
//Loading Dama
25:begin im3.Picture.LoadFromFile(bq);  okx3:=10; end;
26:begin im3.Picture.LoadFromFile(cq);  okx3:=10; end;
27:begin im3.Picture.LoadFromFile(kq);  okx3:=10; end;
28:begin im3.Picture.LoadFromFile(pq); okx3:=10; end;
//Loadig King
29:begin im3.Picture.LoadFromFile(bk);  okx3:=10; end;
30:begin im3.Picture.LoadFromFile(ck); okx3:=10; end;
31:begin im3.Picture.LoadFromFile(kk); okx3:=10; end;
32:begin im3.Picture.LoadFromFile(pk);  okx3:=10; end;
//Loading TUZ
33:begin im3.Picture.LoadFromFile(bt);   okx3:=tuzx; end;
34:begin im3.Picture.LoadFromFile(ct);   okx3:=tuzx; end;
35:begin im3.Picture.LoadFromFile(kt);  okx3:=tuzx; end;
36:begin im3.Picture.LoadFromFile(pt);  okx3:=tuzx; end;
//ЗАКРУЗКА 2
37:begin im3.Picture.LoadFromFile(b2);   okx3:=2; end;
38:begin im3.Picture.LoadFromFile(c2);   okx3:=2; end;
39:begin im3.Picture.LoadFromFile(k2);  okx3:=2; end;
40:begin im3.Picture.LoadFromFile(p2);  okx3:=2; end;
//ЗАГРУЗКА 3
41:begin im3.Picture.LoadFromFile(b3);   okx3:=3; end;
42:begin im3.Picture.LoadFromFile(c3);   okx3:=3; end;
43:begin im3.Picture.LoadFromFile(k3);  okx3:=3; end;
44:begin im3.Picture.LoadFromFile(p3);  okx3:=3; end;
//ЗАГРУЗКА 4
45:begin im3.Picture.LoadFromFile(b4);   okx3:=4; end;
46:begin im3.Picture.LoadFromFile(c4);   okx3:=4; end;
47:begin im3.Picture.LoadFromFile(k4);  okx3:=4; end;
48:begin im3.Picture.LoadFromFile(p4);  okx3:=4; end;
//ЗАГРУЗКА 5
49:begin im3.Picture.LoadFromFile(b5);   okx3:=5; end;
50:begin im3.Picture.LoadFromFile(c5);   okx3:=5; end;
51:begin im3.Picture.LoadFromFile(k5);  okx3:=5; end;
52:begin im3.Picture.LoadFromFile(p5);  okx3:=5; end;
end;
 end;
//Loading 4 karti
if kolkart=4 then
 begin
    x:=random(52);
    if (x=x2) or (x=x1) or (x=x3) then
       x:=random(52)
    else
       x4:=x;
    //Loading Moi First kart
case (x4) of
//Загрузка шестерок
1:begin im4.Picture.LoadFromFile(b6); okx4:=6; end;
2:begin im4.Picture.LoadFromFile(c6); okx4:=6; end;
3:begin im4.Picture.LoadFromFile(k6); okx4:=6; end;
4:begin im4.Picture.LoadFromFile(p6); okx4:=6; end;
//Loading Seven
5:begin im4.Picture.LoadFromFile(b7);  okx4:=7; end;
6:begin im4.Picture.LoadFromFile(c7);  okx4:=7; end;
7:begin im4.Picture.LoadFromFile(k7);  okx4:=7; end;
8:begin im4.Picture.LoadFromFile(p7);  okx4:=7; end;
//Loading 8
9:begin im4.Picture.LoadFromFile(b8);  okx4:=8; end;
10:begin im4.Picture.LoadFromFile(c8); okx4:=8; end;
11:begin im4.Picture.LoadFromFile(k8); okx4:=8; end;
12:begin im4.Picture.LoadFromFile(p8);okx4:=8; end;
//Loading 9
13:begin im4.Picture.LoadFromFile(b9);okx4:=9; end;
14:begin im4.Picture.LoadFromFile(c9);okx4:=9; end;
15:begin im4.Picture.LoadFromFile(k9); okx4:=9; end;
16:begin im4.Picture.LoadFromFile(p9); okx4:=9; end;
//Loading 10
17:begin im4.Picture.LoadFromFile(b10); okx4:=10; end;
18:begin im4.Picture.LoadFromFile(c10);  okx4:=10; end;
19:begin im4.Picture.LoadFromFile(k10);   okx4:=10; end;
20:begin im4.Picture.LoadFromFile(p10);  okx4:=10; end;
//Loading Valet
21:begin im4.Picture.LoadFromFile(bj); okx4:=10; end;
22:begin im4.Picture.LoadFromFile(cj);  okx4:=10; end;
23:begin im4.Picture.LoadFromFile(kj); okx4:=10; end;
24:begin im4.Picture.LoadFromFile(pj); okx4:=10; end;
//Loading Dama
25:begin im4.Picture.LoadFromFile(bq);  okx4:=10; end;
26:begin im4.Picture.LoadFromFile(cq);  okx4:=10; end;
27:begin im4.Picture.LoadFromFile(kq);  okx4:=10; end;
28:begin im4.Picture.LoadFromFile(pq); okx4:=10; end;
//Loadig King
29:begin im4.Picture.LoadFromFile(bk);  okx4:=10; end;
30:begin im4.Picture.LoadFromFile(ck); okx4:=10; end;
31:begin im4.Picture.LoadFromFile(kk); okx4:=10; end;
32:begin im4.Picture.LoadFromFile(pk);  okx4:=10; end;
//Loading TUZ
33:begin im4.Picture.LoadFromFile(bt);   okx4:=tuzx; end;
34:begin im4.Picture.LoadFromFile(ct);   okx4:=tuzx; end;
35:begin im4.Picture.LoadFromFile(kt);  okx4:=tuzx; end;
36:begin im4.Picture.LoadFromFile(pt);  okx4:=tuzx; end;
  //ЗАКРУЗКА 2
37:begin im4.Picture.LoadFromFile(b2);   okx4:=2; end;
38:begin im4.Picture.LoadFromFile(c2);   okx4:=2; end;
39:begin im4.Picture.LoadFromFile(k2);  okx4:=2; end;
40:begin im4.Picture.LoadFromFile(p2);  okx4:=2; end;
//ЗАГРУЗКА 3
41:begin im4.Picture.LoadFromFile(b3);   okx4:=3; end;
42:begin im4.Picture.LoadFromFile(c3);   okx4:=3; end;
43:begin im4.Picture.LoadFromFile(k3);  okx4:=3; end;
44:begin im4.Picture.LoadFromFile(p3);  okx4:=3; end;
//ЗАГРУЗКА 4
45:begin im4.Picture.LoadFromFile(b4);   okx4:=4; end;
46:begin im4.Picture.LoadFromFile(c4);   okx4:=4; end;
47:begin im4.Picture.LoadFromFile(k4);  okx4:=4; end;
48:begin im4.Picture.LoadFromFile(p4);  okx4:=4; end;
//ЗАГРУЗКА 5
49:begin im4.Picture.LoadFromFile(b5);   okx4:=5; end;
50:begin im4.Picture.LoadFromFile(c5);   okx4:=5; end;
51:begin im4.Picture.LoadFromFile(k5);  okx4:=5; end;
52:begin im4.Picture.LoadFromFile(p5);  okx4:=5; end;
 end;
 end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
//Открывание карт и очков соперника
za1.Visible:=false;
za2.Visible:=false;
za3.Visible:=false;
za4.Visible:=false;
you1.Visible:=true;
you2.Visible:=true;
you3.Visible:=true;
you4.Visible:=true;
sky.Visible:=true;
label6.Visible:=true;
Bitbtn3.Enabled:=false;
edit1.Enabled:=false;
//Проверка победителя учитывая перебор у игроков
if (sy>21) and ((sx<21) or (sx=21)) then
begin
str:=vigrall;
manyx:=manyx+50+kon;
manyy:=manyy-50;
end;
if (sx>21) and ((sy<21) or (sy=21)) then
begin
str:=proigrall;
manyx:=manyx-50;
manyy:=manyy+50+kon;
end;
if (sy>21) and (sx>21) then
begin
str:=nicay;
if kon>0 then
//manyx:=manyx+(kon/2);
//manyy:=manyy+(kon/2);
end;

//ПРОВЕРКА ПОБЕДИТЕЛЯ БЕЗ УЧЕТА ПЕРЕБОРА

IF (SX<22) AND (SY<22) THEN
begin
  if sx>sy then
  begin
 str:=vigrall;
  manyx:=manyx+50+kon;
manyy:=manyy-50;
  end;
  if sx<sy then
  begin
 str:=proigrall;
   manyx:=manyx-50;
manyy:=manyy+50+kon;
  end;
  IF SX=SY THEN
  begin
str:=nicay;
if kon>0 then
  end;
end;
  if ManyX<0 then
begin
  if messagedlg (notmoney,
 mtconfirmation,[mbyes,mbno],0)=mryes then
 n1.Click;
end;
if ManyY<0 then
begin
   if messagedlg (compnotmoney,
 mtconfirmation,[mbyes,mbno],0)=mryes then
 ManyY:=ManyX*2;
 end;
  prod.Visible:=true;
  BitBtn1.Enabled:=false;
   BitBtn2.Enabled:=false;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
stavka:=strtoint(edit1.Text);
edit1.Text:='50';
kon:=kon+stavka;
if (manyx-stavka<0) then
begin
  ShowMessage(notst);
  exit;
end;
   if (manyX-stavka>0) or (ManyX-stavka=0) then
   begin
StavkaPro:=true;
ManyX:=ManyX-stavka;
StavkiX:=Stavkix+stavka;
label6.Visible:=true;
   end;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 KEY:=CHR(0);
end;

procedure TForm5.FormActivate(Sender: TObject);
var IIG,iig2,iig3: string;
 var IIGna256,izik: string;
  fna256: TextFile;       // файл
begin
  begin
 { begin
getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
end; }
{ if izik='Русский' then
 begin
  bitbtn1.Caption:='Взять еще карту';
   bitbtn2.Caption:='Вскрыть карты';
    bitbtn3.Caption:='Ставка';
    label1.Caption:='Ваши очки';
    label2.Caption:='Сумма ваших карт';
    label3.Caption:='Очки компьютера';
    label4.Caption:='Сумма карт противника';
    label5.Caption:='На кону';
    label8.Caption:='Играет';
    prod.Caption:='Продолжить';
    radiobutton1.Caption:='Считать туз за 1';
    radiobutton2.Caption:='Считать туз за 11';
    n1.Caption:='Новая игра';
    n2.Caption:='Рекорды';
    n3.Caption:='Правила';
    n4.Caption:='Выход';
    n5.Caption:='Сохраниться в рекорды';
 end;
 end;
{ if izik='English' then
  begin
    bitbtn1.Caption:='Take else card';
   bitbtn2.Caption:='Open cards';
    bitbtn3.Caption:='Rate';
    label1.Caption:='Your spectacles';
    label2.Caption:='Amount of your cards';
    label3.Caption:='Spectacles of the computer';
    label4.Caption:='Amount of the cards of the enemy';
    label5.Caption:='On horse';
    label8.Caption:='Plays';
    prod.Caption:='Continue';
    radiobutton1.Caption:='Consider ace for 1';
    radiobutton2.Caption:='Consider ace for 11';
    n1.Caption:='New play';
    n2.Caption:='Records';
    n3.Caption:='Rules';
    n4.Caption:='Close';
    n5.Caption:='In records';
  end;   }
begin
getdir(0,IIg);
  IIG:=IIG+'\Setting\name.txt';
  AssignFile(f,IIG);
  Reset (f);
  Read(f,Namegamer);
  NameIgrok.Caption:=Namegamer;
  CloseFile(f);
end;
   begin
   getdir(0,IIg2);
  IIG2:=IIG2+'\Setting\StyleBj.txt';
  AssignFile(f,IIG2);
  Reset (f);
  Read(f,Styleadr);
  CloseFile(f);
 end;
   begin
   getdir(0,IIg3);
  IIG3:=IIG3+'\Setting\grenfon.txt';
  AssignFile(f,IIG3);
  Reset (f);
  Read(f,fongreen);
  CloseFile(f);
 end;

newgame:=1;
RadioButton2.Checked:=true;
 sx:=0;   StavkaPro:=false;
 sy:=0;
tuzx:=11;
   getdir(0,c);
   Kolkart:=2;
   ///////////////////////////
   ///  /////////////////////
   ///  //////////////////////
   ///  ////////////////////////
   ///  /////////////////////////
   C:=C+styleadr;
   //загрузка коллоды и закрывающих карт
   kol:=c+'kol.jpg';
   Kalloda.Picture.LoadFromFile(kol);
   zakr:=c+'RUBASHKA.jpg';
   za1.Picture.LoadFromFile(zakr);
     za2.Picture.LoadFromFile(zakr);
       za3.Picture.LoadFromFile(zakr);
         za4.Picture.LoadFromFile(zakr);
    //зАГРУЗКА ОБЛОЖКИ
   rub:=c+'RUBASHKA.jpg';
      //загрузка фона
   fon:=c+'fon.jpg';
   //Загрузка карт Бубы
   b6:=c+'6buba.jpg';
    b7:=c+'7buba.jpg';
     b8:=c+'8buba.jpg';
      b9:=c+'9buba.jpg';
       b10:=c+'10buba.jpg';
        bj:=c+'jbuba.jpg';
         bq:=c+'qbuba.jpg';
          bk:=c+'kbuba.jpg';
           bt:=c+'tbuba.jpg';
             b2:=c+'2buba.jpg';
               b3:=c+'3buba.jpg';
                 b4:=c+'4buba.jpg';
                   b5:=c+'5buba.jpg';
   //Загрузка карт черви
   C6:=c+'6cerva.jpg';
    C7:=c+'7cerva.jpg';
     C8:=c+'8cerva.jpg';
      C9:=c+'9cerva.jpg';
       C10:=c+'10cerva.jpg';
        Cj:=c+'jcerva.jpg';
         Cq:=c+'qcerva.jpg';
          Ck:=c+'kcerva.jpg';
           Ct:=c+'tcerva.jpg';
           C2:=c+'2cerva.jpg';
           C3:=c+'3cerva.jpg';
           C4:=c+'4cerva.jpg';
           C5:=c+'5cerva.jpg';
    //Загрузка карт КРЕСТИ
      K6:=c+'6krest.jpg';
       K7:=c+'7krest.jpg';
        K8:=c+'8krest.jpg';
         K9:=c+'9krest.jpg';
          K10:=c+'10krest.jpg';
           KJ:=c+'Jkrest.jpg';
            KQ:=c+'Qkrest.jpg';
             KK:=c+'Kkrest.jpg';
              KT:=c+'Tkrest.jpg';
               K2:=c+'2krest.jpg';
                K3:=c+'3krest.jpg';
                 K4:=c+'4krest.jpg';
                  K5:=c+'5krest.jpg';
//зАГРУЗКА  КАРТ ПИКИ
 P6:=c+'6pika.jpg';
 P7:=c+'7pika.jpg';
 P8:=c+'8pika.jpg';
 P9:=c+'9pika.jpg';
 P10:=c+'10pika.jpg';
 PJ:=c+'Jpika.jpg';
 PQ:=c+'Qpika.jpg';
 PK:=c+'Kpika.jpg';
 PT:=c+'Tpika.jpg';
 P2:=c+'2pika.jpg';
 P3:=c+'3pika.jpg';
 P4:=c+'4pika.jpg';
 P5:=c+'5pika.jpg';
 //ЗАГРУЗКА РУБАЖЕК КАРТ
 you1.Picture.LoadFromFile(rub);
 you2.Picture.LoadFromFile(rub);
 you3.Picture.LoadFromFile(rub);
 you4.Picture.LoadFromFile(rub);
 im1.Picture.LoadFromFile(rub);
 im2.Picture.LoadFromFile(rub);
 im3.Picture.LoadFromFile(rub);
 im4.Picture.LoadFromFile(rub);
  //loading fon
 if fongreen='Да' then
 begin
fonimage.Picture.LoadFromFile(c+'fon2.jpg');
 end;
 if fongreen='Нет' then
 begin
   fonimage.Visible:=true;
 fonimage.Picture.LoadFromFile(fon);
 end;

  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
var IIG,iig2,iig3: string;
 var IIGna256,izik: string;
  fna256: TextFile;       // файл
begin
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
  bitbtn1.Caption:='Взять еще карту';
   bitbtn2.Caption:='Вскрыть карты';
    bitbtn3.Caption:='Ставка';
    label1.Caption:='Ваши очки';
    label2.Caption:='Сумма ваших карт';
    label3.Caption:='Очки компьютера';
    label4.Caption:='Сумма карт противника';
    label5.Caption:='На кону';
    label8.Caption:='Играет';
    prod.Caption:='Продолжить';
    radiobutton1.Caption:='Считать туз за 1';
    radiobutton2.Caption:='Считать туз за 11';
    n1.Caption:='Новая игра';
    n2.Caption:='Рекорды';
    n3.Caption:='Правила';
    n4.Caption:='Выход';
    n5.Caption:='Сохраниться в рекорды';
    nicay:='Ничья';
    notmoney:='Вы проиграли кончились деньги, начать заново?';
compnotmoney:='Компьютер проиграл, продолжить с новым соперником или закончить';
notst:='Вы не можете поставить данную ставку не хватает денег';
youvigralbros:='Вы выграли комп скинул карты';
comppodst:='Компьютер потдержал ставку';
youpereborchik:='У вс перебор';
comppereborchik:='У компьютера перебор';
proigrall:='Вы проиграли';
vigrall:='Вы выйграли';
 end;
 end;
 if izik='English' then
  begin
    bitbtn1.Caption:='Take else card';
   bitbtn2.Caption:='Open cards';
    bitbtn3.Caption:='Rate';
    label1.Caption:='Your spectacles';
    label2.Caption:='Amount of your cards';
    label3.Caption:='Spectacles of the computer';
    label4.Caption:='Amount of the cards of the enemy';
    label5.Caption:='On horse';
    label8.Caption:='Plays';
    prod.Caption:='Continue';
    radiobutton1.Caption:='Consider ace for 1';
    radiobutton2.Caption:='Consider ace for 11';
    n1.Caption:='New play';
    n2.Caption:='Records';
    n3.Caption:='Rules';
    n4.Caption:='Close';
    n5.Caption:='In records';
       nicay:='Draw';
    notmoney:='You lose the money ran aut to start new?';
compnotmoney:='Computer lost to continue with a new rival of finish';
notst:='You can not put this bet does not have enaugh money';
youvigralbros:='You won the copm folded';
comppodst:='Computer supported rates';
youpereborchik:='You bust';
comppereborchik:='The computer search of';
proigrall:='You lose';
vigrall:='You win';
  end;
getdir(0,IIg);
  IIG:=IIG+'\Setting\name.txt';
  AssignFile(f,IIG);
  Reset (f);
  Read(f,Namegamer);
  NameIgrok.Caption:=Namegamer;
  CloseFile(f);
 begin
   getdir(0,IIg2);
  IIG2:=IIG2+'\Setting\StyleBj.txt';
  AssignFile(f,IIG2);
  Reset (f);
  Read(f,Styleadr);
  CloseFile(f);
 end;
  begin
   getdir(0,IIg3);
  IIG3:=IIG3+'\Setting\grenfon.txt';
  AssignFile(f,IIG3);
  Reset (f);
  Read(f,fongreen);
  CloseFile(f);
 end;

newgame:=1;
RadioButton2.Checked:=true;
 sx:=0;   StavkaPro:=false;
 sy:=0;
tuzx:=11;
   getdir(0,c);
   Kolkart:=2;
   ///////////////////////////
   ///  /////////////////////
   ///  //////////////////////
   ///  ////////////////////////
   ///  /////////////////////////
   C:=C+styleadr;
    //загрузка коллоды и закрывающих карт
   kol:=c+'kol.jpg';
   Kalloda.Picture.LoadFromFile(kol);
   zakr:=c+'RUBASHKA.jpg';
   za1.Picture.LoadFromFile(zakr);
     za2.Picture.LoadFromFile(zakr);
       za3.Picture.LoadFromFile(zakr);
         za4.Picture.LoadFromFile(zakr);
    //зАГРУЗКА ОБЛОЖКИ
   rub:=c+'RUBASHKA.jpg';
   //загрузка фона
   fon:=c+'fon.jpg';
   //Загрузка карт Бубы
   b6:=c+'6buba.jpg';
    b7:=c+'7buba.jpg';
     b8:=c+'8buba.jpg';
      b9:=c+'9buba.jpg';
       b10:=c+'10buba.jpg';
        bj:=c+'jbuba.jpg';
         bq:=c+'qbuba.jpg';
          bk:=c+'kbuba.jpg';
           bt:=c+'tbuba.jpg';
             b2:=c+'2buba.jpg';
               b3:=c+'3buba.jpg';
                 b4:=c+'4buba.jpg';
                   b5:=c+'5buba.jpg';
   //Загрузка карт черви
   C6:=c+'6cerva.jpg';
    C7:=c+'7cerva.jpg';
     C8:=c+'8cerva.jpg';
      C9:=c+'9cerva.jpg';
       C10:=c+'10cerva.jpg';
        Cj:=c+'jcerva.jpg';
         Cq:=c+'qcerva.jpg';
          Ck:=c+'kcerva.jpg';
           Ct:=c+'tcerva.jpg';
           C2:=c+'2cerva.jpg';
           C3:=c+'3cerva.jpg';
           C4:=c+'4cerva.jpg';
           C5:=c+'5cerva.jpg';
    //Загрузка карт КРЕСТИ
      K6:=c+'6krest.jpg';
       K7:=c+'7krest.jpg';
        K8:=c+'8krest.jpg';
         K9:=c+'9krest.jpg';
          K10:=c+'10krest.jpg';
           KJ:=c+'Jkrest.jpg';
            KQ:=c+'Qkrest.jpg';
             KK:=c+'Kkrest.jpg';
              KT:=c+'Tkrest.jpg';
               K2:=c+'2krest.jpg';
                K3:=c+'3krest.jpg';
                 K4:=c+'4krest.jpg';
                  K5:=c+'5krest.jpg';
//зАГРУЗКА  КАРТ ПИКИ
 P6:=c+'6pika.jpg';
 P7:=c+'7pika.jpg';
 P8:=c+'8pika.jpg';
 P9:=c+'9pika.jpg';
 P10:=c+'10pika.jpg';
 PJ:=c+'Jpika.jpg';
 PQ:=c+'Qpika.jpg';
 PK:=c+'Kpika.jpg';
 PT:=c+'Tpika.jpg';
 P2:=c+'2pika.jpg';
 P3:=c+'3pika.jpg';
 P4:=c+'4pika.jpg';
 P5:=c+'5pika.jpg';
 //ЗАГРУЗКА РУБАЖЕК КАРТ
 you1.Picture.LoadFromFile(rub);
 you2.Picture.LoadFromFile(rub);
 you3.Picture.LoadFromFile(rub);
 you4.Picture.LoadFromFile(rub);
 im1.Picture.LoadFromFile(rub);
 im2.Picture.LoadFromFile(rub);
 im3.Picture.LoadFromFile(rub);
 im4.Picture.LoadFromFile(rub);
 //loading fon
 if fongreen='Да' then
 begin
fonimage.Picture.LoadFromFile(c+'fon2.jpg');
 end;
 if fongreen='Нет' then
 begin
   fonimage.Visible:=true;
 fonimage.Picture.LoadFromFile(fon);
 end;
end;

procedure TForm5.Im2Click(Sender: TObject);
begin
    // im2.Picture.LoadFromFile(b6);
end;

procedure TForm5.N1Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;
bitbtn3.Enabled:=true;
VisKarti.Enabled:=true;
shagkomp:=2;
manyx:=1000;
manyY:=2000;
im3.Picture.LoadFromFile(rub); okx3:=0;
im4.Picture.LoadFromFile(rub); okx4:=0;

Kolkart:=2;
  x:=random(52);
  x1:=x;
    x:=random(52);
    if x=x1 then
         x:=random(52)
         else
         x2:=x;
         //Loading Moi First kart
case (x1) of
//Загрузка шестерок
1:begin im1.Picture.LoadFromFile(b6); okx1:=6; end;
2:begin im1.Picture.LoadFromFile(c6); okx1:=6; end;
3:begin im1.Picture.LoadFromFile(k6); okx1:=6; end;
4:begin im1.Picture.LoadFromFile(p6); okx1:=6; end;
//Loading Seven
5:begin im1.Picture.LoadFromFile(b7);  okx1:=7; end;
6:begin im1.Picture.LoadFromFile(c7);  okx1:=7; end;
7:begin im1.Picture.LoadFromFile(k7);  okx1:=7; end;
8:begin im1.Picture.LoadFromFile(p7);  okx1:=7; end;
//Loading 8
9:begin im1.Picture.LoadFromFile(b8);  okx1:=8; end;
10:begin im1.Picture.LoadFromFile(c8); okx1:=8; end;
11:begin im1.Picture.LoadFromFile(k8); okx1:=8; end;
12:begin im1.Picture.LoadFromFile(p8);okx1:=8; end;
//Loading 9
13:begin im1.Picture.LoadFromFile(b9);okx1:=9; end;
14:begin im1.Picture.LoadFromFile(c9);okx1:=9; end;
15:begin im1.Picture.LoadFromFile(k9); okx1:=9; end;
16:begin im1.Picture.LoadFromFile(p9); okx1:=9; end;
//Loading 10
17:begin im1.Picture.LoadFromFile(b10); okx1:=10; end;
18:begin im1.Picture.LoadFromFile(c10);  okx1:=10; end;
19:begin im1.Picture.LoadFromFile(k10);   okx1:=10; end;
20:begin im1.Picture.LoadFromFile(p10);  okx1:=10; end;
//Loading Valet
21:begin im1.Picture.LoadFromFile(bj); okx1:=10; end;
22:begin im1.Picture.LoadFromFile(cj);  okx1:=10; end;
23:begin im1.Picture.LoadFromFile(kj); okx1:=10; end;
24:begin im1.Picture.LoadFromFile(pj); okx1:=10; end;
//Loading Dama
25:begin im1.Picture.LoadFromFile(bq);  okx1:=10; end;
26:begin im1.Picture.LoadFromFile(cq);  okx1:=10; end;
27:begin im1.Picture.LoadFromFile(kq);  okx1:=10; end;
28:begin im1.Picture.LoadFromFile(pq); okx1:=10; end;
//Loadig King
29:begin im1.Picture.LoadFromFile(bk);  okx1:=10; end;
30:begin im1.Picture.LoadFromFile(ck); okx1:=10; end;
31:begin im1.Picture.LoadFromFile(kk); okx1:=10; end;
32:begin im1.Picture.LoadFromFile(pk);  okx1:=10; end;
//Loading TUZ
33:begin im1.Picture.LoadFromFile(bt);   okx1:=tuzx; end;
34:begin im1.Picture.LoadFromFile(ct);   okx1:=tuzx; end;
35:begin im1.Picture.LoadFromFile(kt);  okx1:=tuzx; end;
36:begin im1.Picture.LoadFromFile(pt);  okx1:=tuzx; end;
//ЗАКРУЗКА 2
37:begin im1.Picture.LoadFromFile(b2);   okx1:=2; end;
38:begin im1.Picture.LoadFromFile(c2);   okx1:=2; end;
39:begin im1.Picture.LoadFromFile(k2);  okx1:=2; end;
40:begin im1.Picture.LoadFromFile(p2);  okx1:=2; end;
//ЗАГРУЗКА 3
41:begin im1.Picture.LoadFromFile(b3);   okx1:=3; end;
42:begin im1.Picture.LoadFromFile(c3);   okx1:=3; end;
43:begin im1.Picture.LoadFromFile(k3);  okx1:=3; end;
44:begin im1.Picture.LoadFromFile(p3);  okx1:=3; end;
//ЗАГРУЗКА 4
45:begin im1.Picture.LoadFromFile(b4);   okx1:=4; end;
46:begin im1.Picture.LoadFromFile(c4);   okx1:=4; end;
47:begin im1.Picture.LoadFromFile(k4);  okx1:=4; end;
48:begin im1.Picture.LoadFromFile(p4);  okx1:=4; end;
//ЗАГРУЗКА 5
49:begin im1.Picture.LoadFromFile(b5);   okx1:=5; end;
50:begin im1.Picture.LoadFromFile(c5);   okx1:=5; end;
51:begin im1.Picture.LoadFromFile(k5);  okx1:=5; end;
52:begin im1.Picture.LoadFromFile(p5);  okx1:=5; end;
end;
  //loading moi second kart
case (x2) of
//Загрузка шестерок
1:begin im2.Picture.LoadFromFile(b6); okx2:=6; end;
2:begin im2.Picture.LoadFromFile(c6); okx2:=6; end;
3:begin im2.Picture.LoadFromFile(k6); okx2:=6; end;
4:begin im2.Picture.LoadFromFile(p6); okx2:=6; end;
//Loading Seven
5:begin im2.Picture.LoadFromFile(b7);  okx2:=7; end;
6:begin im2.Picture.LoadFromFile(c7);  okx2:=7; end;
7:begin im2.Picture.LoadFromFile(k7);  okx2:=7; end;
8:begin im2.Picture.LoadFromFile(p7);  okx2:=7; end;
//Loading 8
9:begin im2.Picture.LoadFromFile(b8);  okx2:=8; end;
10:begin im2.Picture.LoadFromFile(c8); okx2:=8; end;
11:begin im2.Picture.LoadFromFile(k8); okx2:=8; end;
12:begin im2.Picture.LoadFromFile(p8);okx2:=8; end;
//Loading 9
13:begin im2.Picture.LoadFromFile(b9);okx2:=9; end;
14:begin im2.Picture.LoadFromFile(c9);okx2:=9; end;
15:begin im2.Picture.LoadFromFile(k9); okx2:=9; end;
16:begin im2.Picture.LoadFromFile(p9); okx2:=9; end;
//Loading 10
17:begin im2.Picture.LoadFromFile(b10); okx2:=10; end;
18:begin im2.Picture.LoadFromFile(c10);  okx2:=10; end;
19:begin im2.Picture.LoadFromFile(k10);   okx2:=10; end;
20:begin im2.Picture.LoadFromFile(p10);  okx2:=10; end;
//Loading Valet
21:begin im2.Picture.LoadFromFile(bj); okx2:=10; end;
22:begin im2.Picture.LoadFromFile(cj);  okx2:=10; end;
23:begin im2.Picture.LoadFromFile(kj); okx2:=10; end;
24:begin im2.Picture.LoadFromFile(pj); okx2:=10; end;
//Loading Dama
25:begin im2.Picture.LoadFromFile(bq);  okx2:=10; end;
26:begin im2.Picture.LoadFromFile(cq);  okx2:=10; end;
27:begin im2.Picture.LoadFromFile(kq);  okx2:=10; end;
28:begin im2.Picture.LoadFromFile(pq); okx2:=10; end;
//Loadig King
29:begin im2.Picture.LoadFromFile(bk);  okx2:=10; end;
30:begin im2.Picture.LoadFromFile(ck); okx2:=10; end;
31:begin im2.Picture.LoadFromFile(kk); okx2:=10; end;
32:begin im2.Picture.LoadFromFile(pk);  okx2:=10; end;
//Loading TUZ
33:begin im2.Picture.LoadFromFile(bt);   okx2:=tuzx; end;
34:begin im2.Picture.LoadFromFile(ct);   okx2:=tuzx; end;
35:begin im2.Picture.LoadFromFile(kt);  okx2:=tuzx; end;
36:begin im2.Picture.LoadFromFile(pt);  okx2:=tuzx; end;
//ЗАКРУЗКА 2
37:begin im2.Picture.LoadFromFile(b2);   okx2:=2; end;
38:begin im2.Picture.LoadFromFile(c2);   okx2:=2; end;
39:begin im2.Picture.LoadFromFile(k2);  okx2:=2; end;
40:begin im2.Picture.LoadFromFile(p2);  okx2:=2; end;
//ЗАГРУЗКА 3
41:begin im2.Picture.LoadFromFile(b3);   okx2:=3; end;
42:begin im2.Picture.LoadFromFile(c3);   okx2:=3; end;
43:begin im2.Picture.LoadFromFile(k3);  okx2:=3; end;
44:begin im2.Picture.LoadFromFile(p3);  okx2:=3; end;
//ЗАГРУЗКА 4
45:begin im2.Picture.LoadFromFile(b4);   okx2:=4; end;
46:begin im2.Picture.LoadFromFile(c4);   okx2:=4; end;
47:begin im2.Picture.LoadFromFile(k4);  okx2:=4; end;
48:begin im2.Picture.LoadFromFile(p4);  okx2:=4; end;
//ЗАГРУЗКА 5
49:begin im2.Picture.LoadFromFile(b5);   okx2:=5; end;
50:begin im2.Picture.LoadFromFile(c5);   okx2:=5; end;
51:begin im2.Picture.LoadFromFile(k5);  okx2:=5; end;
52:begin im2.Picture.LoadFromFile(p5);  okx2:=5; end;
end;
//Теперь создаем карты для компика
x:=random(52);
  y1:=x;
    x:=random(52);
    if x=y1 then
         x:=random(52)
         else
         y2:=x;
         //Loading komp First kart
case (y1) of
//Загрузка шестерок
1:begin you1.Picture.LoadFromFile(b6); oky1:=6; end;
2:begin you1.Picture.LoadFromFile(c6); oky1:=6; end;
3:begin you1.Picture.LoadFromFile(k6); oky1:=6; end;
4:begin you1.Picture.LoadFromFile(p6); oky1:=6; end;
//Loading Seven
5:begin you1.Picture.LoadFromFile(b7);  oky1:=7; end;
6:begin you1.Picture.LoadFromFile(c7);  oky1:=7; end;
7:begin you1.Picture.LoadFromFile(k7);  oky1:=7; end;
8:begin you1.Picture.LoadFromFile(p7);  oky1:=7; end;
//Loading 8
9:begin you1.Picture.LoadFromFile(b8);  oky1:=8; end;
10:begin you1.Picture.LoadFromFile(c8); oky1:=8; end;
11:begin you1.Picture.LoadFromFile(k8); oky1:=8; end;
12:begin you1.Picture.LoadFromFile(p8);oky1:=8; end;
//Loading 9
13:begin you1.Picture.LoadFromFile(b9);oky1:=9; end;
14:begin you1.Picture.LoadFromFile(c9);oky1:=9; end;
15:begin you1.Picture.LoadFromFile(k9); oky1:=9; end;
16:begin you1.Picture.LoadFromFile(p9); oky1:=9; end;
//Loading 10
17:begin you1.Picture.LoadFromFile(b10); oky1:=10; end;
18:begin you1.Picture.LoadFromFile(c10);  oky1:=10; end;
19:begin you1.Picture.LoadFromFile(k10);   oky1:=10; end;
20:begin you1.Picture.LoadFromFile(p10);  oky1:=10; end;
//Loading Valet
21:begin you1.Picture.LoadFromFile(bj); oky1:=10; end;
22:begin you1.Picture.LoadFromFile(cj);  oky1:=10; end;
23:begin you1.Picture.LoadFromFile(kj); oky1:=10; end;
24:begin you1.Picture.LoadFromFile(pj); oky1:=10; end;
//Loading Dama
25:begin you1.Picture.LoadFromFile(bq);  oky1:=10; end;
26:begin you1.Picture.LoadFromFile(cq);  oky1:=10; end;
27:begin you1.Picture.LoadFromFile(kq);  oky1:=10; end;
28:begin you1.Picture.LoadFromFile(pq); oky1:=10; end;
//Loadig King
29:begin you1.Picture.LoadFromFile(bk);  oky1:=10; end;
30:begin you1.Picture.LoadFromFile(ck); oky1:=10; end;
31:begin you1.Picture.LoadFromFile(kk); oky1:=10; end;
32:begin you1.Picture.LoadFromFile(pk);  oky1:=10; end;
//Loading TUZ
33:begin you1.Picture.LoadFromFile(bt);   oky1:=tuzx; end;
34:begin you1.Picture.LoadFromFile(ct);   oky1:=tuzx; end;
35:begin you1.Picture.LoadFromFile(kt);  oky1:=tuzx; end;
36:begin you1.Picture.LoadFromFile(pt);  oky1:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you1.Picture.LoadFromFile(b2);   oky1:=2; end;
38:begin you1.Picture.LoadFromFile(c2);   oky1:=2; end;
39:begin you1.Picture.LoadFromFile(k2);  oky1:=2; end;
40:begin you1.Picture.LoadFromFile(p2);  oky1:=2; end;
//ЗАГРУЗКА 3
41:begin you1.Picture.LoadFromFile(b3);   oky1:=3; end;
42:begin you1.Picture.LoadFromFile(c3);   oky1:=3; end;
43:begin you1.Picture.LoadFromFile(k3);  oky1:=3; end;
44:begin you1.Picture.LoadFromFile(p3);  oky1:=3; end;
//ЗАГРУЗКА 4
45:begin you1.Picture.LoadFromFile(b4);   oky1:=4; end;
46:begin you1.Picture.LoadFromFile(c4);   oky1:=4; end;
47:begin you1.Picture.LoadFromFile(k4);  oky1:=4; end;
48:begin you1.Picture.LoadFromFile(p4);  oky1:=4; end;
//ЗАГРУЗКА 5
49:begin you1.Picture.LoadFromFile(b5);   oky1:=5; end;
50:begin you1.Picture.LoadFromFile(c5);   oky1:=5; end;
51:begin you1.Picture.LoadFromFile(k5);  oky1:=5; end;
52:begin you1.Picture.LoadFromFile(p5);  oky1:=5; end;
end;
  //loading komp second kart
case (y2) of
//Загрузка шестерок
1:begin you2.Picture.LoadFromFile(b6); oky2:=6; end;
2:begin you2.Picture.LoadFromFile(c6); oky2:=6; end;
3:begin you2.Picture.LoadFromFile(k6); oky2:=6; end;
4:begin you2.Picture.LoadFromFile(p6); oky2:=6; end;
//Loading Seven
5:begin you2.Picture.LoadFromFile(b7);  oky2:=7; end;
6:begin you2.Picture.LoadFromFile(c7);  oky2:=7; end;
7:begin you2.Picture.LoadFromFile(k7);  oky2:=7; end;
8:begin you2.Picture.LoadFromFile(p7);  oky2:=7; end;
//Loading 8
9:begin you2.Picture.LoadFromFile(b8);  oky2:=8; end;
10:begin you2.Picture.LoadFromFile(c8); oky2:=8; end;
11:begin you2.Picture.LoadFromFile(k8); oky2:=8; end;
12:begin you2.Picture.LoadFromFile(p8);oky2:=8; end;
//Loading 9
13:begin you2.Picture.LoadFromFile(b9);oky2:=9; end;
14:begin you2.Picture.LoadFromFile(c9);oky2:=9; end;
15:begin you2.Picture.LoadFromFile(k9); oky2:=9; end;
16:begin you2.Picture.LoadFromFile(p9); oky2:=9; end;
//Loading 10
17:begin you2.Picture.LoadFromFile(b10); oky2:=10; end;
18:begin you2.Picture.LoadFromFile(c10);  oky2:=10; end;
19:begin you2.Picture.LoadFromFile(k10);   oky2:=10; end;
20:begin you2.Picture.LoadFromFile(p10);  oky2:=10; end;
//Loading Valet
21:begin you2.Picture.LoadFromFile(bj); oky2:=10; end;
22:begin you2.Picture.LoadFromFile(cj);  oky2:=10; end;
23:begin you2.Picture.LoadFromFile(kj); oky2:=10; end;
24:begin you2.Picture.LoadFromFile(pj); oky2:=10; end;
//Loading Dama
25:begin you2.Picture.LoadFromFile(bq);  oky2:=10; end;
26:begin you2.Picture.LoadFromFile(cq);  oky2:=10; end;
27:begin you2.Picture.LoadFromFile(kq);  oky2:=10; end;
28:begin you2.Picture.LoadFromFile(pq); oky2:=10; end;
//Loadig King
29:begin you2.Picture.LoadFromFile(bk);  oky2:=10; end;
30:begin you2.Picture.LoadFromFile(ck); oky2:=10; end;
31:begin you2.Picture.LoadFromFile(kk); oky2:=10; end;
32:begin you2.Picture.LoadFromFile(pk);  oky2:=10; end;
//Loading TUz
33:begin you2.Picture.LoadFromFile(bt);   oky2:=tuzx; end;
34:begin you2.Picture.LoadFromFile(ct);   oky2:=tuzx; end;
35:begin you2.Picture.LoadFromFile(kt);  oky2:=tuzx; end;
36:begin you2.Picture.LoadFromFile(pt);  oky2:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you2.Picture.LoadFromFile(b2);   oky2:=2; end;
38:begin you2.Picture.LoadFromFile(c2);   oky2:=2; end;
39:begin you2.Picture.LoadFromFile(k2);  oky2:=2; end;
40:begin you2.Picture.LoadFromFile(p2);  oky2:=2; end;
//ЗАГРУЗКА 3
41:begin you2.Picture.LoadFromFile(b3);   oky2:=3; end;
42:begin you2.Picture.LoadFromFile(c3);   oky2:=3; end;
43:begin you2.Picture.LoadFromFile(k3);  oky2:=3; end;
44:begin you2.Picture.LoadFromFile(p3);  oky2:=3; end;
//ЗАГРУЗКА 4
45:begin you2.Picture.LoadFromFile(b4);   oky2:=4; end;
46:begin you2.Picture.LoadFromFile(c4);   oky2:=4; end;
47:begin you2.Picture.LoadFromFile(k4);  oky2:=4; end;
48:begin you2.Picture.LoadFromFile(p4);  oky2:=4; end;
//ЗАГРУЗКА 5
49:begin you2.Picture.LoadFromFile(b5);   oky2:=5; end;
50:begin you2.Picture.LoadFromFile(c5);   oky2:=5; end;
51:begin you2.Picture.LoadFromFile(k5);  oky2:=5; end;
52:begin you2.Picture.LoadFromFile(p5);  oky2:=5; end;
end;
end;


procedure TForm5.N2Click(Sender: TObject);
begin
Form9.ShowModal;
end;

procedure TForm5.N3Click(Sender: TObject);
begin
form7.showmodal;
end;

procedure TForm5.N4Click(Sender: TObject);
begin
close;
end;

procedure TForm5.N5Click(Sender: TObject);
 var crec,SaveRecBJ: string;
  ff: TextFile;       // файл
   fNamerec: String; // имя файла
begin
SaveRecBJ:=Namegamer+' набрал '+inttostr(manyx)+' Очков'+#13;
     getdir(0,crec);
  fNamerec :=crec+'\Setting\RecordBJ.txt';
   AssignFile(ff, fNamerec);
   Append(ff);  // открыть для перезаписи
   // запись в файл
          writeln(ff,SaveRecBJ);
 CloseFile(ff); // закрыть файл
  MessageDlg('Рекорд Сохранен ',mtInformation,[mbOk],0);
end;

procedure TForm5.ObnovkenirLabelOVTimer(Sender: TObject);
begin
moiock.Caption:=inttostr(manyx);
youock.Caption:=inttostr(manyy);
Kony.Caption:=inttostr(kon);
sy:=oky1+oky2+oky3+oky4;
label6.Caption:=str;

label7.Caption:=inttostr(oky1+oky2);
end;

procedure TForm5.prodClick(Sender: TObject);
begin
viskarti.Enabled:=true;
razum_komp.Enabled:=false;
Bitbtn3.Enabled:=true;
edit1.Enabled:=true;
shagkomp:=2; kon:=0;
im3.Picture.LoadFromFile(rub);
im4.Picture.LoadFromFile(rub);
Kolkart:=2;
  x:=random(52);
  x1:=x;
    x:=random(52);
    if x=x1 then
         x:=random(52)
         else
         x2:=x;
         //Loading Moi First kart
case (x1) of
//Загрузка шестерок
1:begin im1.Picture.LoadFromFile(b6); okx1:=6; end;
2:begin im1.Picture.LoadFromFile(c6); okx1:=6; end;
3:begin im1.Picture.LoadFromFile(k6); okx1:=6; end;
4:begin im1.Picture.LoadFromFile(p6); okx1:=6; end;
//Loading Seven
5:begin im1.Picture.LoadFromFile(b7);  okx1:=7; end;
6:begin im1.Picture.LoadFromFile(c7);  okx1:=7; end;
7:begin im1.Picture.LoadFromFile(k7);  okx1:=7; end;
8:begin im1.Picture.LoadFromFile(p7);  okx1:=7; end;
//Loading 8
9:begin im1.Picture.LoadFromFile(b8);  okx1:=8; end;
10:begin im1.Picture.LoadFromFile(c8); okx1:=8; end;
11:begin im1.Picture.LoadFromFile(k8); okx1:=8; end;
12:begin im1.Picture.LoadFromFile(p8);okx1:=8; end;
//Loading 9
13:begin im1.Picture.LoadFromFile(b9);okx1:=9; end;
14:begin im1.Picture.LoadFromFile(c9);okx1:=9; end;
15:begin im1.Picture.LoadFromFile(k9); okx1:=9; end;
16:begin im1.Picture.LoadFromFile(p9); okx1:=9; end;
//Loading 10
17:begin im1.Picture.LoadFromFile(b10); okx1:=10; end;
18:begin im1.Picture.LoadFromFile(c10);  okx1:=10; end;
19:begin im1.Picture.LoadFromFile(k10);   okx1:=10; end;
20:begin im1.Picture.LoadFromFile(p10);  okx1:=10; end;
//Loading Valet
21:begin im1.Picture.LoadFromFile(bj); okx1:=10; end;
22:begin im1.Picture.LoadFromFile(cj);  okx1:=10; end;
23:begin im1.Picture.LoadFromFile(kj); okx1:=10; end;
24:begin im1.Picture.LoadFromFile(pj); okx1:=10; end;
//Loading Dama
25:begin im1.Picture.LoadFromFile(bq);  okx1:=10; end;
26:begin im1.Picture.LoadFromFile(cq);  okx1:=10; end;
27:begin im1.Picture.LoadFromFile(kq);  okx1:=10; end;
28:begin im1.Picture.LoadFromFile(pq); okx1:=10; end;
//Loadig King
29:begin im1.Picture.LoadFromFile(bk);  okx1:=10; end;
30:begin im1.Picture.LoadFromFile(ck); okx1:=10; end;
31:begin im1.Picture.LoadFromFile(kk); okx1:=10; end;
32:begin im1.Picture.LoadFromFile(pk);  okx1:=10; end;
//Loading TUZ
33:begin im1.Picture.LoadFromFile(bt);   okx1:=tuzx; end;
34:begin im1.Picture.LoadFromFile(ct);   okx1:=tuzx; end;
35:begin im1.Picture.LoadFromFile(kt);  okx1:=tuzx; end;
36:begin im1.Picture.LoadFromFile(pt);  okx1:=tuzx; end;
//ЗАКРУЗКА 2
37:begin im1.Picture.LoadFromFile(b2);   okx1:=2; end;
38:begin im1.Picture.LoadFromFile(c2);   okx1:=2; end;
39:begin im1.Picture.LoadFromFile(k2);  okx1:=2; end;
40:begin im1.Picture.LoadFromFile(p2);  okx1:=2; end;
//ЗАГРУЗКА 3
41:begin im1.Picture.LoadFromFile(b3);   okx1:=3; end;
42:begin im1.Picture.LoadFromFile(c3);   okx1:=3; end;
43:begin im1.Picture.LoadFromFile(k3);  okx1:=3; end;
44:begin im1.Picture.LoadFromFile(p3);  okx1:=3; end;
//ЗАГРУЗКА 4
45:begin im1.Picture.LoadFromFile(b4);   okx1:=4; end;
46:begin im1.Picture.LoadFromFile(c4);   okx1:=4; end;
47:begin im1.Picture.LoadFromFile(k4);  okx1:=4; end;
48:begin im1.Picture.LoadFromFile(p4);  okx1:=4; end;
//ЗАГРУЗКА 5
49:begin im1.Picture.LoadFromFile(b5);   okx1:=5; end;
50:begin im1.Picture.LoadFromFile(c5);   okx1:=5; end;
51:begin im1.Picture.LoadFromFile(k5);  okx1:=5; end;
52:begin im1.Picture.LoadFromFile(p5);  okx1:=5; end;
end;
  //loading moi second kart
case (x2) of
//Загрузка шестерок
1:begin im2.Picture.LoadFromFile(b6); okx2:=6; end;
2:begin im2.Picture.LoadFromFile(c6); okx2:=6; end;
3:begin im2.Picture.LoadFromFile(k6); okx2:=6; end;
4:begin im2.Picture.LoadFromFile(p6); okx2:=6; end;
//Loading Seven
5:begin im2.Picture.LoadFromFile(b7);  okx2:=7; end;
6:begin im2.Picture.LoadFromFile(c7);  okx2:=7; end;
7:begin im2.Picture.LoadFromFile(k7);  okx2:=7; end;
8:begin im2.Picture.LoadFromFile(p7);  okx2:=7; end;
//Loading 8
9:begin im2.Picture.LoadFromFile(b8);  okx2:=8; end;
10:begin im2.Picture.LoadFromFile(c8); okx2:=8; end;
11:begin im2.Picture.LoadFromFile(k8); okx2:=8; end;
12:begin im2.Picture.LoadFromFile(p8);okx2:=8; end;
//Loading 9
13:begin im2.Picture.LoadFromFile(b9);okx2:=9; end;
14:begin im2.Picture.LoadFromFile(c9);okx2:=9; end;
15:begin im2.Picture.LoadFromFile(k9); okx2:=9; end;
16:begin im2.Picture.LoadFromFile(p9); okx2:=9; end;
//Loading 10
17:begin im2.Picture.LoadFromFile(b10); okx2:=10; end;
18:begin im2.Picture.LoadFromFile(c10);  okx2:=10; end;
19:begin im2.Picture.LoadFromFile(k10);   okx2:=10; end;
20:begin im2.Picture.LoadFromFile(p10);  okx2:=10; end;
//Loading Valet
21:begin im2.Picture.LoadFromFile(bj); okx2:=10; end;
22:begin im2.Picture.LoadFromFile(cj);  okx2:=10; end;
23:begin im2.Picture.LoadFromFile(kj); okx2:=10; end;
24:begin im2.Picture.LoadFromFile(pj); okx2:=10; end;
//Loading Dama
25:begin im2.Picture.LoadFromFile(bq);  okx2:=10; end;
26:begin im2.Picture.LoadFromFile(cq);  okx2:=10; end;
27:begin im2.Picture.LoadFromFile(kq);  okx2:=10; end;
28:begin im2.Picture.LoadFromFile(pq); okx2:=10; end;
//Loadig King
29:begin im2.Picture.LoadFromFile(bk);  okx2:=10; end;
30:begin im2.Picture.LoadFromFile(ck); okx2:=10; end;
31:begin im2.Picture.LoadFromFile(kk); okx2:=10; end;
32:begin im2.Picture.LoadFromFile(pk);  okx2:=10; end;
//Loading TUZ
33:begin im2.Picture.LoadFromFile(bt);   okx2:=tuzx; end;
34:begin im2.Picture.LoadFromFile(ct);   okx2:=tuzx; end;
35:begin im2.Picture.LoadFromFile(kt);  okx2:=tuzx; end;
36:begin im2.Picture.LoadFromFile(pt);  okx2:=tuzx; end;
//ЗАКРУЗКА 2
37:begin im2.Picture.LoadFromFile(b2);   okx2:=2; end;
38:begin im2.Picture.LoadFromFile(c2);   okx2:=2; end;
39:begin im2.Picture.LoadFromFile(k2);  okx2:=2; end;
40:begin im2.Picture.LoadFromFile(p2);  okx2:=2; end;
//ЗАГРУЗКА 3
41:begin im2.Picture.LoadFromFile(b3);   okx2:=3; end;
42:begin im2.Picture.LoadFromFile(c3);   okx2:=3; end;
43:begin im2.Picture.LoadFromFile(k3);  okx2:=3; end;
44:begin im2.Picture.LoadFromFile(p3);  okx2:=3; end;
//ЗАГРУЗКА 4
45:begin im2.Picture.LoadFromFile(b4);   okx2:=4; end;
46:begin im2.Picture.LoadFromFile(c4);   okx2:=4; end;
47:begin im2.Picture.LoadFromFile(k4);  okx2:=4; end;
48:begin im2.Picture.LoadFromFile(p4);  okx2:=4; end;
//ЗАГРУЗКА 5
49:begin im2.Picture.LoadFromFile(b5);   okx2:=5; end;
50:begin im2.Picture.LoadFromFile(c5);   okx2:=5; end;
51:begin im2.Picture.LoadFromFile(k5);  okx2:=5; end;
52:begin im2.Picture.LoadFromFile(p5);  okx2:=5; end;
end;
//Теперь создаем карты для компика
x:=random(52);
  y1:=x;
    x:=random(52);
    if x=y1 then
         x:=random(52)
         else
         y2:=x;
         //Loading komp First kart
case (y1) of
//Загрузка шестерок
1:begin you1.Picture.LoadFromFile(b6); oky1:=6; end;
2:begin you1.Picture.LoadFromFile(c6); oky1:=6; end;
3:begin you1.Picture.LoadFromFile(k6); oky1:=6; end;
4:begin you1.Picture.LoadFromFile(p6); oky1:=6; end;
//Loading Seven
5:begin you1.Picture.LoadFromFile(b7);  oky1:=7; end;
6:begin you1.Picture.LoadFromFile(c7);  oky1:=7; end;
7:begin you1.Picture.LoadFromFile(k7);  oky1:=7; end;
8:begin you1.Picture.LoadFromFile(p7);  oky1:=7; end;
//Loading 8
9:begin you1.Picture.LoadFromFile(b8);  oky1:=8; end;
10:begin you1.Picture.LoadFromFile(c8); oky1:=8; end;
11:begin you1.Picture.LoadFromFile(k8); oky1:=8; end;
12:begin you1.Picture.LoadFromFile(p8);oky1:=8; end;
//Loading 9
13:begin you1.Picture.LoadFromFile(b9);oky1:=9; end;
14:begin you1.Picture.LoadFromFile(c9);oky1:=9; end;
15:begin you1.Picture.LoadFromFile(k9); oky1:=9; end;
16:begin you1.Picture.LoadFromFile(p9); oky1:=9; end;
//Loading 10
17:begin you1.Picture.LoadFromFile(b10); oky1:=10; end;
18:begin you1.Picture.LoadFromFile(c10);  oky1:=10; end;
19:begin you1.Picture.LoadFromFile(k10);   oky1:=10; end;
20:begin you1.Picture.LoadFromFile(p10);  oky1:=10; end;
//Loading Valet
21:begin you1.Picture.LoadFromFile(bj); oky1:=10; end;
22:begin you1.Picture.LoadFromFile(cj);  oky1:=10; end;
23:begin you1.Picture.LoadFromFile(kj); oky1:=10; end;
24:begin you1.Picture.LoadFromFile(pj); oky1:=10; end;
//Loading Dama
25:begin you1.Picture.LoadFromFile(bq);  oky1:=10; end;
26:begin you1.Picture.LoadFromFile(cq);  oky1:=10; end;
27:begin you1.Picture.LoadFromFile(kq);  oky1:=10; end;
28:begin you1.Picture.LoadFromFile(pq); oky1:=10; end;
//Loadig King
29:begin you1.Picture.LoadFromFile(bk);  oky1:=10; end;
30:begin you1.Picture.LoadFromFile(ck); oky1:=10; end;
31:begin you1.Picture.LoadFromFile(kk); oky1:=10; end;
32:begin you1.Picture.LoadFromFile(pk);  oky1:=10; end;
//Loading TUZ
33:begin you1.Picture.LoadFromFile(bt);   oky1:=tuzx; end;
34:begin you1.Picture.LoadFromFile(ct);   oky1:=tuzx; end;
35:begin you1.Picture.LoadFromFile(kt);  oky1:=tuzx; end;
36:begin you1.Picture.LoadFromFile(pt);  oky1:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you1.Picture.LoadFromFile(b2);   oky1:=2; end;
38:begin you1.Picture.LoadFromFile(c2);   oky1:=2; end;
39:begin you1.Picture.LoadFromFile(k2);  oky1:=2; end;
40:begin you1.Picture.LoadFromFile(p2);  oky1:=2; end;
//ЗАГРУЗКА 3
41:begin you1.Picture.LoadFromFile(b3);   oky1:=3; end;
42:begin you1.Picture.LoadFromFile(c3);   oky1:=3; end;
43:begin you1.Picture.LoadFromFile(k3);  oky1:=3; end;
44:begin you1.Picture.LoadFromFile(p3);  oky1:=3; end;
//ЗАГРУЗКА 4
45:begin you1.Picture.LoadFromFile(b4);   oky1:=4; end;
46:begin you1.Picture.LoadFromFile(c4);   oky1:=4; end;
47:begin you1.Picture.LoadFromFile(k4);  oky1:=4; end;
48:begin you1.Picture.LoadFromFile(p4);  oky1:=4; end;
//ЗАГРУЗКА 5
49:begin you1.Picture.LoadFromFile(b5);   oky1:=5; end;
50:begin you1.Picture.LoadFromFile(c5);   oky1:=5; end;
51:begin you1.Picture.LoadFromFile(k5);  oky1:=5; end;
52:begin you1.Picture.LoadFromFile(p5);  oky1:=5; end;
end;
  //loading komp second kart
case (y2) of
//Загрузка шестерок
1:begin you2.Picture.LoadFromFile(b6); oky2:=6; end;
2:begin you2.Picture.LoadFromFile(c6); oky2:=6; end;
3:begin you2.Picture.LoadFromFile(k6); oky2:=6; end;
4:begin you2.Picture.LoadFromFile(p6); oky2:=6; end;
//Loading Seven
5:begin you2.Picture.LoadFromFile(b7);  oky2:=7; end;
6:begin you2.Picture.LoadFromFile(c7);  oky2:=7; end;
7:begin you2.Picture.LoadFromFile(k7);  oky2:=7; end;
8:begin you2.Picture.LoadFromFile(p7);  oky2:=7; end;
//Loading 8
9:begin you2.Picture.LoadFromFile(b8);  oky2:=8; end;
10:begin you2.Picture.LoadFromFile(c8); oky2:=8; end;
11:begin you2.Picture.LoadFromFile(k8); oky2:=8; end;
12:begin you2.Picture.LoadFromFile(p8);oky2:=8; end;
//Loading 9
13:begin you2.Picture.LoadFromFile(b9);oky2:=9; end;
14:begin you2.Picture.LoadFromFile(c9);oky2:=9; end;
15:begin you2.Picture.LoadFromFile(k9); oky2:=9; end;
16:begin you2.Picture.LoadFromFile(p9); oky2:=9; end;
//Loading 10
17:begin you2.Picture.LoadFromFile(b10); oky2:=10; end;
18:begin you2.Picture.LoadFromFile(c10);  oky2:=10; end;
19:begin you2.Picture.LoadFromFile(k10);   oky2:=10; end;
20:begin you2.Picture.LoadFromFile(p10);  oky2:=10; end;
//Loading Valet
21:begin you2.Picture.LoadFromFile(bj); oky2:=10; end;
22:begin you2.Picture.LoadFromFile(cj);  oky2:=10; end;
23:begin you2.Picture.LoadFromFile(kj); oky2:=10; end;
24:begin you2.Picture.LoadFromFile(pj); oky2:=10; end;
//Loading Dama
25:begin you2.Picture.LoadFromFile(bq);  oky2:=10; end;
26:begin you2.Picture.LoadFromFile(cq);  oky2:=10; end;
27:begin you2.Picture.LoadFromFile(kq);  oky2:=10; end;
28:begin you2.Picture.LoadFromFile(pq); oky2:=10; end;
//Loadig King
29:begin you2.Picture.LoadFromFile(bk);  oky2:=10; end;
30:begin you2.Picture.LoadFromFile(ck); oky2:=10; end;
31:begin you2.Picture.LoadFromFile(kk); oky2:=10; end;
32:begin you2.Picture.LoadFromFile(pk);  oky2:=10; end;
//Loading TUz
33:begin you2.Picture.LoadFromFile(bt);   oky2:=tuzx; end;
34:begin you2.Picture.LoadFromFile(ct);   oky2:=tuzx; end;
35:begin you2.Picture.LoadFromFile(kt);  oky2:=tuzx; end;
36:begin you2.Picture.LoadFromFile(pt);  oky2:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you2.Picture.LoadFromFile(b2);   oky2:=2; end;
38:begin you2.Picture.LoadFromFile(c2);   oky2:=2; end;
39:begin you2.Picture.LoadFromFile(k2);  oky2:=2; end;
40:begin you2.Picture.LoadFromFile(p2);  oky2:=2; end;
//ЗАГРУЗКА 3
41:begin you2.Picture.LoadFromFile(b3);   oky2:=3; end;
42:begin you2.Picture.LoadFromFile(c3);   oky2:=3; end;
43:begin you2.Picture.LoadFromFile(k3);  oky2:=3; end;
44:begin you2.Picture.LoadFromFile(p3);  oky2:=3; end;
//ЗАГРУЗКА 4
45:begin you2.Picture.LoadFromFile(b4);   oky2:=4; end;
46:begin you2.Picture.LoadFromFile(c4);   oky2:=4; end;
47:begin you2.Picture.LoadFromFile(k4);  oky2:=4; end;
48:begin you2.Picture.LoadFromFile(p4);  oky2:=4; end;
//ЗАГРУЗКА 5
49:begin you2.Picture.LoadFromFile(b5);   oky2:=5; end;
50:begin you2.Picture.LoadFromFile(c5);   oky2:=5; end;
51:begin you2.Picture.LoadFromFile(k5);  oky2:=5; end;
52:begin you2.Picture.LoadFromFile(p5);  oky2:=5; end;
end;
 BitBtn1.Enabled:=true;
   BitBtn2.Enabled:=true;
za1.Visible:=true;
za2.Visible:=true;
za3.Visible:=true;
za4.Visible:=true;
sky.Visible:=false;
you1.Visible:=false;
you2.Visible:=false;
you3.Visible:=false;
you4.Visible:=false;
label6.Visible:=false;
 sx:=0;
 sy:=0;
 okx3:=0;
 okx4:=0;
prod.Visible:=false;


end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
tuzxx:=1;
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
tuzxx:=11;
end;

procedure TForm5.RazumStavkaTimer(Sender: TObject);
Var Risk: byte;
begin
If StavkaPro=true then
//Если у компа перебор и сделана ставка
     begin
       if (( (sy>=22) and (sy<=60) ) and ((stavka>=50) and (stavka<=100)) ) then
       begin
    str:=youvigralbros;
         ManyX:=manyx+kon+50;
         Prod.Visible:=true;
    Stavkapro:=false;
    Bitbtn3.Enabled:=false;
edit1.Enabled:=false;
 Bitbtn1.Enabled:=false;
       end;
   //Если сделана ставка и карты нормальные
if (( (sy>=16) and (sy<=21) ) and ((stavka>=50) and (stavka<=100)) and (Manyy-stavka>=0)) then
       begin
     str:=comppodst;
          Manyy:=Manyy-stavka;
      Stavkapro:=false;
      Kon:=Kon+stavka;
      stavkiY:=StavKiY+stavka;
       end;
//Если сделана ставка и карты плохие
if (( (sy>=2) and (sy<=15) ) and ((stavka>=50) and (stavka<=100)) and (Manyy-stavka>=0)) then
       begin
 str:=youvigralbros;
         ManyX:=manyx+kon+50;
         Prod.Visible:=true;
    Stavkapro:=false;
     Bitbtn3.Enabled:=false;
edit1.Enabled:=false;
 Bitbtn1.Enabled:=false;
       end;
     end;
end;

procedure TForm5.Razum_KompTimer(Sender: TObject);
var raz,raz2,raz3: byte;
begin
if shagkomp=2 then
begin
  if ((oky1+oky2>2) or (oky1+oky2<=11)) then
  begin
  //shagkomp:=3;
    x:=random(52);
    if ((x=y3) or (x=y2) or (x=y1)) then
         x:=random(52)
         else
         begin
         razum_komp.enabled:=false;
         y3:=x;
         //Loading komp First kart
case (y3) of
//Загрузка шестерок
1:begin you3.Picture.LoadFromFile(b6); oky3:=6; end;
2:begin you3.Picture.LoadFromFile(c6); oky3:=6; end;
3:begin you3.Picture.LoadFromFile(k6); oky3:=6; end;
4:begin you3.Picture.LoadFromFile(p6); oky3:=6; end;
//Loading Seven
5:begin you3.Picture.LoadFromFile(b7);  oky3:=7; end;
6:begin you3.Picture.LoadFromFile(c7);  oky3:=7; end;
7:begin you3.Picture.LoadFromFile(k7);  oky3:=7; end;
8:begin you3.Picture.LoadFromFile(p7);  oky3:=7; end;
//Loading 8
9:begin you3.Picture.LoadFromFile(b8);  oky3:=8; end;
10:begin you3.Picture.LoadFromFile(c8); oky3:=8; end;
11:begin you3.Picture.LoadFromFile(k8); oky3:=8; end;
12:begin you3.Picture.LoadFromFile(p8);oky3:=8; end;
//Loading 9
13:begin you3.Picture.LoadFromFile(b9);oky3:=9; end;
14:begin you3.Picture.LoadFromFile(c9);oky3:=9; end;
15:begin you3.Picture.LoadFromFile(k9); oky3:=9; end;
16:begin you3.Picture.LoadFromFile(p9); oky3:=9; end;
//Loading 10
17:begin you3.Picture.LoadFromFile(b10); oky3:=10; end;
18:begin you3.Picture.LoadFromFile(c10);  oky3:=10; end;
19:begin you3.Picture.LoadFromFile(k10);   oky3:=10; end;
20:begin you3.Picture.LoadFromFile(p10);  oky3:=10; end;
//Loading Valet
21:begin you3.Picture.LoadFromFile(bj); oky3:=10; end;
22:begin you3.Picture.LoadFromFile(cj);  oky3:=10; end;
23:begin you3.Picture.LoadFromFile(kj); oky3:=10; end;
24:begin you3.Picture.LoadFromFile(pj); oky3:=10; end;
//Loading Dama
25:begin you3.Picture.LoadFromFile(bq);  oky3:=10; end;
26:begin you3.Picture.LoadFromFile(cq);  oky3:=10; end;
27:begin you3.Picture.LoadFromFile(kq);  oky3:=10; end;
28:begin you3.Picture.LoadFromFile(pq); oky3:=10; end;
//Loadig King
29:begin you3.Picture.LoadFromFile(bk);  oky3:=10; end;
30:begin you3.Picture.LoadFromFile(ck); oky3:=10; end;
31:begin you3.Picture.LoadFromFile(kk); oky3:=10; end;
32:begin you3.Picture.LoadFromFile(pk);  oky3:=10; end;
//Loading TUZ
33:begin you3.Picture.LoadFromFile(bt);   oky3:=tuzx; end;
34:begin you3.Picture.LoadFromFile(ct);   oky3:=tuzx; end;
35:begin you3.Picture.LoadFromFile(kt);  oky3:=tuzx; end;
36:begin you3.Picture.LoadFromFile(pt);  oky3:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you3.Picture.LoadFromFile(b2);   oky3:=2; end;
38:begin you3.Picture.LoadFromFile(c2);   oky3:=2; end;
39:begin you3.Picture.LoadFromFile(k2);  oky3:=2; end;
40:begin you3.Picture.LoadFromFile(p2);  oky3:=2; end;
//ЗАГРУЗКА 3
41:begin you3.Picture.LoadFromFile(b3);   oky3:=3; end;
42:begin you3.Picture.LoadFromFile(c3);   oky3:=3; end;
43:begin you3.Picture.LoadFromFile(k3);  oky3:=3; end;
44:begin you3.Picture.LoadFromFile(p3);  oky3:=3; end;
//ЗАГРУЗКА 4
45:begin you3.Picture.LoadFromFile(b4);   oky3:=4; end;
46:begin you3.Picture.LoadFromFile(c4);   oky3:=4; end;
47:begin you3.Picture.LoadFromFile(k4);  oky3:=4; end;
48:begin you3.Picture.LoadFromFile(p4);  oky3:=4; end;
//ЗАГРУЗКА 5
49:begin you3.Picture.LoadFromFile(b5);   oky3:=5; end;
50:begin you3.Picture.LoadFromFile(c5);   oky3:=5; end;
51:begin you3.Picture.LoadFromFile(k5);  oky3:=5; end;
52:begin you3.Picture.LoadFromFile(p5);  oky3:=5; end;

end;
end;
  end;
end;
 if ((oky1+oky2+oky3>6) and (oky1+oky2+oky3<=14)) then
 begin
 shagkomp:=3;
 razum_komp.Enabled:=true;
 end;
  if ((oky1+oky2+oky3>15) and (oky1+oky2+oky3<=21)) then
 begin
 razum_komp.Enabled:=false;
 end;
if shagkomp=3 then
begin
  if ((oky1+oky2+oky3>5) and (oky1+oky2+oky3<=14)) then
  begin
    x:=random(52);
    if ((x=y3) or (x=y2) or (x=y1)) then
         x:=random(52)
         else
         begin
 razum_komp.Enabled:=false;
         y4:=x;
         //Loading komp First kart
case (y4) of
//Загрузка шестерок
1:begin you4.Picture.LoadFromFile(b6); oky4:=6; end;
2:begin you4.Picture.LoadFromFile(c6); oky4:=6; end;
3:begin you4.Picture.LoadFromFile(k6); oky4:=6; end;
4:begin you4.Picture.LoadFromFile(p6); oky4:=6; end;
//Loading Seven
5:begin you4.Picture.LoadFromFile(b7);  oky4:=7; end;
6:begin you4.Picture.LoadFromFile(c7);  oky4:=7; end;
7:begin you4.Picture.LoadFromFile(k7);  oky4:=7; end;
8:begin you4.Picture.LoadFromFile(p7);  oky4:=7; end;
//Loading 8
9:begin you4.Picture.LoadFromFile(b8);  oky4:=8; end;
10:begin you4.Picture.LoadFromFile(c8); oky4:=8; end;
11:begin you4.Picture.LoadFromFile(k8); oky4:=8; end;
12:begin you4.Picture.LoadFromFile(p8);oky4:=8; end;
//Loading 9
13:begin you4.Picture.LoadFromFile(b9);oky4:=9; end;
14:begin you4.Picture.LoadFromFile(c9);oky4:=9; end;
15:begin you4.Picture.LoadFromFile(k9); oky4:=9; end;
16:begin you4.Picture.LoadFromFile(p9); oky4:=9; end;
//Loading 10
17:begin you4.Picture.LoadFromFile(b10); oky4:=10; end;
18:begin you4.Picture.LoadFromFile(c10);  oky4:=10; end;
19:begin you4.Picture.LoadFromFile(k10);   oky4:=10; end;
20:begin you4.Picture.LoadFromFile(p10);  oky4:=10; end;
//Loading Valet
21:begin you4.Picture.LoadFromFile(bj); oky4:=10; end;
22:begin you4.Picture.LoadFromFile(cj);  oky4:=10; end;
23:begin you4.Picture.LoadFromFile(kj); oky4:=10; end;
24:begin you4.Picture.LoadFromFile(pj); oky4:=10; end;
//Loading Dama
25:begin you4.Picture.LoadFromFile(bq);  oky4:=10; end;
26:begin you4.Picture.LoadFromFile(cq);  oky4:=10; end;
27:begin you4.Picture.LoadFromFile(kq);  oky4:=10; end;
28:begin you4.Picture.LoadFromFile(pq); oky4:=10; end;
//Loadig King
29:begin you4.Picture.LoadFromFile(bk);  oky4:=10; end;
30:begin you4.Picture.LoadFromFile(ck); oky4:=10; end;
31:begin you4.Picture.LoadFromFile(kk); oky4:=10; end;
32:begin you4.Picture.LoadFromFile(pk);  oky4:=10; end;
//Loading TUZ
33:begin you4.Picture.LoadFromFile(bt);   oky4:=tuzx; end;
34:begin you4.Picture.LoadFromFile(ct);   oky4:=tuzx; end;
35:begin you4.Picture.LoadFromFile(kt);  oky4:=tuzx; end;
36:begin you4.Picture.LoadFromFile(pt);  oky4:=tuzx; end;
//ЗАКРУЗКА 2
37:begin you4.Picture.LoadFromFile(b2);   oky4:=2; end;
38:begin you4.Picture.LoadFromFile(c2);   oky4:=2; end;
39:begin you4.Picture.LoadFromFile(k2);  oky4:=2; end;
40:begin you4.Picture.LoadFromFile(p2);  oky4:=2; end;
//ЗАГРУЗКА 3
41:begin you4.Picture.LoadFromFile(b3);   oky4:=3; end;
42:begin you4.Picture.LoadFromFile(c3);   oky4:=3; end;
43:begin you4.Picture.LoadFromFile(k3);  oky4:=3; end;
44:begin you4.Picture.LoadFromFile(p3);  oky4:=3; end;
//ЗАГРУЗКА 4
45:begin you4.Picture.LoadFromFile(b4);   oky4:=4; end;
46:begin you4.Picture.LoadFromFile(c4);   oky4:=4; end;
47:begin you4.Picture.LoadFromFile(k4);  oky4:=4; end;
48:begin you4.Picture.LoadFromFile(p4);  oky4:=4; end;
//ЗАГРУЗКА 5
49:begin you4.Picture.LoadFromFile(b5);   oky4:=5; end;
50:begin you4.Picture.LoadFromFile(c5);   oky4:=5; end;
51:begin you4.Picture.LoadFromFile(k5);  oky4:=5; end;
52:begin you4.Picture.LoadFromFile(p5);  oky4:=5; end;
  end;
  end;
  end;
end;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
begin
//Проверка наличия туза и присвоение ему значения
if okx1=tuzx then
begin
okx1:=tuzxx;
end;
if okx2=tuzx then
begin
okx2:=tuzxx;
end;
if okx3=tuzx then
begin
okx3:=tuzxx;
end;
if okx4=tuzx then
begin
okx4:=tuzxx;
end;
 //Проверка наличия туза и просвоение ему значения (компик)
 if oky1=tuzx then
begin
oky1:=11;
end;
 if oky2=tuzx then
begin
oky2:=11;
end;
 if oky3=tuzx then
begin
oky3:=11;
end;
 if oky4=tuzx then
begin
oky4:=11;
end;
end;
 sx:=okx1+okx2+okx3+okx4;
sy:=oky1+oky2+oky3+oky4;
begin
if sx>21 then
skx.Caption:=inttostr(sx)+ youpereborchik;
 if sx<22 then
skx.Caption:=inttostr(sx);

if sy>21 then
sky.Caption:=inttostr(sy)+ comppereborchik;
 if sy<22 then
sky.Caption:=inttostr(sy);
end;
moiock.Caption:=inttostr(manyx);
youock.Caption:=inttostr(manyy);
end;

procedure TForm5.VisKartiTimer(Sender: TObject);
var Vk: byte;
begin
vk:=oky1+oky2;
if (vk>=16) and (vk<=21) then
begin
shagkomp:=5;
you3.Picture.LoadFromFile(rub);
you4.Picture.LoadFromFile(rub);
oky3:=0;
oky4:=0;
end
else
begin
razum_komp.Enabled:=true;
shagkomp:=2;
viskarti.Enabled:=false;
end;
end;

end.
