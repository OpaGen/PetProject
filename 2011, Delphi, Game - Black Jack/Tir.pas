unit Tir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Menus;

type
  TForm6 = class(TForm)
    Tim: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Image1: TImage;
    You1: TImage;
    You2: TImage;
    v1: TImage;
    v2: TImage;
    v3: TImage;
    v4: TImage;
    v5: TImage;
    im1: TImage;
    im2: TImage;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
      //Í‡Ú˚ Û·‡¯ÍË ÙÓÌ˚
  B6,C6,K6,P6,B7,C7,K7,P7,B8,C8,K8,P8,B9,C9,K9,P9,B10,C10,K10,P10 : string;
  BJ,CJ,KJ,PJ,BQ,CQ,KQ,PQ,BK,CK,KK,PK,BT,CT,KT,PT : string;
  RUB,JOKER: string;
  Fon:string;
  B2,C2,K2,P2,B3,C3,K3,P3,B4,C4,K4,P4,B5,C5,K5,P5: STRING;
        fongreen: string;
    c : string;
    //Ô≈–≈Ã≈ÕÕ€≈ ƒÀﬂ —◊®“¿  Í‡Ú » ¬€¡Œ–¿  ¿–“
    x1,x2,x3,x4: integer;
    y1,y2,y3,y4: integer;
    x: integer;

implementation

uses main;

{$R *.dfm}

procedure TForm6.N1Click(Sender: TObject);
begin
 x:=random(52);
  x1:=x;
    x:=random(52);
    if x=x1 then
         x:=random(52)
         else
         x2:=x;
         //Loading Moi First kart
case (x1) of
//«‡„ÛÁÍ‡ ¯ÂÒÚÂÓÍ
1:begin im1.Picture.LoadFromFile(b6);  end;
2:begin im1.Picture.LoadFromFile(c6);  end;
3:begin im1.Picture.LoadFromFile(k6);  end;
4:begin im1.Picture.LoadFromFile(p6);  end;
//Loading Seven
5:begin im1.Picture.LoadFromFile(b7); end;
6:begin im1.Picture.LoadFromFile(c7);   end;
7:begin im1.Picture.LoadFromFile(k7);   end;
8:begin im1.Picture.LoadFromFile(p7);   end;
//Loading 8
9:begin im1.Picture.LoadFromFile(b8);   end;
10:begin im1.Picture.LoadFromFile(c8);  end;
11:begin im1.Picture.LoadFromFile(k8);  end;
12:begin im1.Picture.LoadFromFile(p8); end;
//Loading 9
13:begin im1.Picture.LoadFromFile(b9); end;
14:begin im1.Picture.LoadFromFile(c9); end;
15:begin im1.Picture.LoadFromFile(k9);  end;
16:begin im1.Picture.LoadFromFile(p9);  end;
//Loading 10
17:begin im1.Picture.LoadFromFile(b10);  end;
18:begin im1.Picture.LoadFromFile(c10);   end;
19:begin im1.Picture.LoadFromFile(k10);    end;
20:begin im1.Picture.LoadFromFile(p10);   end;
//Loading Valet
21:begin im1.Picture.LoadFromFile(bj);  end;
22:begin im1.Picture.LoadFromFile(cj);   end;
23:begin im1.Picture.LoadFromFile(kj);  end;
24:begin im1.Picture.LoadFromFile(pj);  end;
//Loading Dama
25:begin im1.Picture.LoadFromFile(bq);   end;
26:begin im1.Picture.LoadFromFile(cq);   end;
27:begin im1.Picture.LoadFromFile(kq);   end;
28:begin im1.Picture.LoadFromFile(pq);  end;
//Loadig King
29:begin im1.Picture.LoadFromFile(bk);   end;
30:begin im1.Picture.LoadFromFile(ck);  end;
31:begin im1.Picture.LoadFromFile(kk);  end;
32:begin im1.Picture.LoadFromFile(pk);   end;
//Loading TUZ
33:begin im1.Picture.LoadFromFile(bt);    end;
34:begin im1.Picture.LoadFromFile(ct);    end;
35:begin im1.Picture.LoadFromFile(kt);   end;
36:begin im1.Picture.LoadFromFile(pt);   end;
//«¿ –”« ¿ 2
37:begin im1.Picture.LoadFromFile(b2);   end;
38:begin im1.Picture.LoadFromFile(c2);    end;
39:begin im1.Picture.LoadFromFile(k2);  end;
40:begin im1.Picture.LoadFromFile(p2);   end;
//«¿√–”« ¿ 3
41:begin im1.Picture.LoadFromFile(b3);  end;
42:begin im1.Picture.LoadFromFile(c3);    end;
43:begin im1.Picture.LoadFromFile(k3);   end;
44:begin im1.Picture.LoadFromFile(p3);  end;
//«¿√–”« ¿ 4
45:begin im1.Picture.LoadFromFile(b4);    end;
46:begin im1.Picture.LoadFromFile(c4);    end;
47:begin im1.Picture.LoadFromFile(k4);   end;
48:begin im1.Picture.LoadFromFile(p4);  end;
//«¿√–”« ¿ 5
49:begin im1.Picture.LoadFromFile(b5);    end;
50:begin im1.Picture.LoadFromFile(c5);   end;
51:begin im1.Picture.LoadFromFile(k5);  end;
52:begin im1.Picture.LoadFromFile(p5);  end;
end;
  //loading moi second kart
case (x2) of
//«‡„ÛÁÍ‡ ¯ÂÒÚÂÓÍ
1:begin im2.Picture.LoadFromFile(b6);  end;
2:begin im2.Picture.LoadFromFile(c6);  end;
3:begin im2.Picture.LoadFromFile(k6);  end;
4:begin im2.Picture.LoadFromFile(p6);  end;
//Loading Seven
5:begin im2.Picture.LoadFromFile(b7);  end;
6:begin im2.Picture.LoadFromFile(c7);  end;
7:begin im2.Picture.LoadFromFile(k7);  end;
8:begin im2.Picture.LoadFromFile(p7);  end;
//Loading 8
9:begin im2.Picture.LoadFromFile(b8);  end;
10:begin im2.Picture.LoadFromFile(c8); end;
11:begin im2.Picture.LoadFromFile(k8); end;
12:begin im2.Picture.LoadFromFile(p8);; end;
//Loading 9
13:begin im2.Picture.LoadFromFile(b9); end;
14:begin im2.Picture.LoadFromFile(c9); end;
15:begin im2.Picture.LoadFromFile(k9); end;
16:begin im2.Picture.LoadFromFile(p9); end;
//Loading 10
17:begin im2.Picture.LoadFromFile(b10); end;
18:begin im2.Picture.LoadFromFile(c10); end;
19:begin im2.Picture.LoadFromFile(k10); end;
20:begin im2.Picture.LoadFromFile(p10); end;
//Loading Valet
21:begin im2.Picture.LoadFromFile(bj);  end;
22:begin im2.Picture.LoadFromFile(cj);  end;
23:begin im2.Picture.LoadFromFile(kj);  end;
24:begin im2.Picture.LoadFromFile(pj);  end;
//Loading Dama
25:begin im2.Picture.LoadFromFile(bq);  end;
26:begin im2.Picture.LoadFromFile(cq);  end;
27:begin im2.Picture.LoadFromFile(kq);  end;
28:begin im2.Picture.LoadFromFile(pq);  end;
//Loadig King
29:begin im2.Picture.LoadFromFile(bk);  end;
30:begin im2.Picture.LoadFromFile(ck);  end;
31:begin im2.Picture.LoadFromFile(kk);  end;
32:begin im2.Picture.LoadFromFile(pk);  end;
//Loading TUZ
33:begin im2.Picture.LoadFromFile(bt);  end;
34:begin im2.Picture.LoadFromFile(ct);  end;
35:begin im2.Picture.LoadFromFile(kt); end;
36:begin im2.Picture.LoadFromFile(pt); end;
//«¿ –”« ¿ 2
37:begin im2.Picture.LoadFromFile(b2); end;
38:begin im2.Picture.LoadFromFile(c2); end;
39:begin im2.Picture.LoadFromFile(k2); end;
40:begin im2.Picture.LoadFromFile(p2); end;
//«¿√–”« ¿ 3
41:begin im2.Picture.LoadFromFile(b3); end;
42:begin im2.Picture.LoadFromFile(c3); end;
43:begin im2.Picture.LoadFromFile(k3); end;
44:begin im2.Picture.LoadFromFile(p3); end;
//«¿√–”« ¿ 4
45:begin im2.Picture.LoadFromFile(b4); end;
46:begin im2.Picture.LoadFromFile(c4); end;
47:begin im2.Picture.LoadFromFile(k4); end;
48:begin im2.Picture.LoadFromFile(p4); end;
//«¿√–”« ¿ 5
49:begin im2.Picture.LoadFromFile(b5); end;
50:begin im2.Picture.LoadFromFile(c5); end;
51:begin im2.Picture.LoadFromFile(k5); end;
52:begin im2.Picture.LoadFromFile(p5); end;
end;
//“ÂÔÂ¸ ÒÓÁ‰‡ÂÏ Í‡Ú˚ ‰Îˇ ÍÓÏÔËÍ‡
x:=random(52);
  y1:=x;
    x:=random(52);
    if x=y1 then
         x:=random(52)
         else
         y2:=x;
         //Loading komp First kart
case (y1) of
//«‡„ÛÁÍ‡ ¯ÂÒÚÂÓÍ
1:begin you1.Picture.LoadFromFile(b6); end;
2:begin you1.Picture.LoadFromFile(c6); end;
3:begin you1.Picture.LoadFromFile(k6); end;
4:begin you1.Picture.LoadFromFile(p6); end;
//Loading Seven
5:begin you1.Picture.LoadFromFile(b7); end;
6:begin you1.Picture.LoadFromFile(c7); end;
7:begin you1.Picture.LoadFromFile(k7); end;
8:begin you1.Picture.LoadFromFile(p7); end;
//Loading 8
9:begin you1.Picture.LoadFromFile(b8); end;
10:begin you1.Picture.LoadFromFile(c8); end;
11:begin you1.Picture.LoadFromFile(k8); end;
12:begin you1.Picture.LoadFromFile(p8); end;
//Loading 9
13:begin you1.Picture.LoadFromFile(b9); end;
14:begin you1.Picture.LoadFromFile(c9); end;
15:begin you1.Picture.LoadFromFile(k9); end;
16:begin you1.Picture.LoadFromFile(p9); end;
//Loading 10
17:begin you1.Picture.LoadFromFile(b10); end;
18:begin you1.Picture.LoadFromFile(c10); end;
19:begin you1.Picture.LoadFromFile(k10); end;
20:begin you1.Picture.LoadFromFile(p10); end;
//Loading Valet
21:begin you1.Picture.LoadFromFile(bj);  end;
22:begin you1.Picture.LoadFromFile(cj);  end;
23:begin you1.Picture.LoadFromFile(kj);  end;
24:begin you1.Picture.LoadFromFile(pj);  end;
//Loading Dama
25:begin you1.Picture.LoadFromFile(bq);  end;
26:begin you1.Picture.LoadFromFile(cq);  end;
27:begin you1.Picture.LoadFromFile(kq);  end;
28:begin you1.Picture.LoadFromFile(pq); end;
//Loadig King
29:begin you1.Picture.LoadFromFile(bk);  end;
30:begin you1.Picture.LoadFromFile(ck);  end;
31:begin you1.Picture.LoadFromFile(kk);  end;
32:begin you1.Picture.LoadFromFile(pk);  end;
//Loading TUZ
33:begin you1.Picture.LoadFromFile(bt);  end;
34:begin you1.Picture.LoadFromFile(ct);  end;
35:begin you1.Picture.LoadFromFile(kt); end;
36:begin you1.Picture.LoadFromFile(pt);  end;
//«¿ –”« ¿ 2
37:begin you1.Picture.LoadFromFile(b2);  end;
38:begin you1.Picture.LoadFromFile(c2);  end;
39:begin you1.Picture.LoadFromFile(k2);  end;
40:begin you1.Picture.LoadFromFile(p2);  end;
//«¿√–”« ¿ 3
41:begin you1.Picture.LoadFromFile(b3);  end;
42:begin you1.Picture.LoadFromFile(c3);  end;
43:begin you1.Picture.LoadFromFile(k3);  end;
44:begin you1.Picture.LoadFromFile(p3);  end;
//«¿√–”« ¿ 4
45:begin you1.Picture.LoadFromFile(b4);  end;
46:begin you1.Picture.LoadFromFile(c4);  end;
47:begin you1.Picture.LoadFromFile(k4);  end;
48:begin you1.Picture.LoadFromFile(p4);  end;
//«¿√–”« ¿ 5
49:begin you1.Picture.LoadFromFile(b5);  end;
50:begin you1.Picture.LoadFromFile(c5);  end;
51:begin you1.Picture.LoadFromFile(k5);  end;
52:begin you1.Picture.LoadFromFile(p5);  end;
end;
  //loading komp second kart
case (y2) of
//«‡„ÛÁÍ‡ ¯ÂÒÚÂÓÍ
1:begin you2.Picture.LoadFromFile(b6);  end;
2:begin you2.Picture.LoadFromFile(c6);  end;
3:begin you2.Picture.LoadFromFile(k6);  end;
4:begin you2.Picture.LoadFromFile(p6);  end;
//Loading Seven
5:begin you2.Picture.LoadFromFile(b7);  end;
6:begin you2.Picture.LoadFromFile(c7);  end;
7:begin you2.Picture.LoadFromFile(k7);  end;
8:begin you2.Picture.LoadFromFile(p7);  end;
//Loading 8
9:begin you2.Picture.LoadFromFile(b8);  end;
10:begin you2.Picture.LoadFromFile(c8); end;
11:begin you2.Picture.LoadFromFile(k8); end;
12:begin you2.Picture.LoadFromFile(p8); end;
//Loading 9
13:begin you2.Picture.LoadFromFile(b9); end;
14:begin you2.Picture.LoadFromFile(c9); end;
15:begin you2.Picture.LoadFromFile(k9); end;
16:begin you2.Picture.LoadFromFile(p9); end;
//Loading 10
17:begin you2.Picture.LoadFromFile(b10); end;
18:begin you2.Picture.LoadFromFile(c10); end;
19:begin you2.Picture.LoadFromFile(k10); end;
20:begin you2.Picture.LoadFromFile(p10); end;
//Loading Valet
21:begin you2.Picture.LoadFromFile(bj);  end;
22:begin you2.Picture.LoadFromFile(cj);  end;
23:begin you2.Picture.LoadFromFile(kj);  end;
24:begin you2.Picture.LoadFromFile(pj);  end;
//Loading Dama
25:begin you2.Picture.LoadFromFile(bq);  end;
26:begin you2.Picture.LoadFromFile(cq);  end;
27:begin you2.Picture.LoadFromFile(kq); end;
28:begin you2.Picture.LoadFromFile(pq);  end;
//Loadig King
29:begin you2.Picture.LoadFromFile(bk);  end;
30:begin you2.Picture.LoadFromFile(ck);  end;
31:begin you2.Picture.LoadFromFile(kk);  end;
32:begin you2.Picture.LoadFromFile(pk);  end;
//Loading TUz
33:begin you2.Picture.LoadFromFile(bt);  end;
34:begin you2.Picture.LoadFromFile(ct);  end;
35:begin you2.Picture.LoadFromFile(kt);  end;
36:begin you2.Picture.LoadFromFile(pt);  end;
//«¿ –”« ¿ 2
37:begin you2.Picture.LoadFromFile(b2);  end;
38:begin you2.Picture.LoadFromFile(c2);  end;
39:begin you2.Picture.LoadFromFile(k2);  end;
40:begin you2.Picture.LoadFromFile(p2);  end;
//«¿√–”« ¿ 3
41:begin you2.Picture.LoadFromFile(b3);  end;
42:begin you2.Picture.LoadFromFile(c3);  end;
43:begin you2.Picture.LoadFromFile(k3);  end;
44:begin you2.Picture.LoadFromFile(p3);  end;
//«¿√–”« ¿ 4
45:begin you2.Picture.LoadFromFile(b4);  end;
46:begin you2.Picture.LoadFromFile(c4);  end;
47:begin you2.Picture.LoadFromFile(k4);  end;
48:begin you2.Picture.LoadFromFile(p4);  end;
//«¿√–”« ¿ 5
49:begin you2.Picture.LoadFromFile(b5);  end;
50:begin you2.Picture.LoadFromFile(c5);  end;
51:begin you2.Picture.LoadFromFile(k5); end;
52:begin you2.Picture.LoadFromFile(p5);  end;
end;
end;

end.
