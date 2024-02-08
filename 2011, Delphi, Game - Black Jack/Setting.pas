unit Setting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm8 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    NameEdit: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CBStyleBJ: TComboBox;
    Label3: TLabel;
    Fondn: TCheckBox;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  cname: string;
  f: TextFile;       // файл
   fName: String; // имя файла
implementation

uses mazaika, main;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
var AdrSt: string;
  fx: TextFile;       // файл
   fstyle,www: String; // имя файла
   var AdrSt1: string;
  fx1: TextFile;       // файл
   fstyle1,www1: String; // имя файла
begin
if fondn.Checked=true then
begin
     getdir(0,adrst1);
  fstyle1 :=adrst1+'\Setting\grenfon.txt';
   AssignFile(fx1, fstyle1);
   Rewrite(fx1);  // открыть для перезаписи
   www1:='Да';
   // запись в файл
          writeln(fx1,www1  );
 CloseFile(fx1); // закрыть файл
end;
if fondn.Checked=false then
begin
       getdir(0,adrst1);
  fstyle1 :=adrst1+'\Setting\grenfon.txt';
   AssignFile(fx1, fstyle1);
   Rewrite(fx1);  // открыть для перезаписи
   www1:='Нет';
   // запись в файл
          writeln(fx1,www1  );
 CloseFile(fx1); // закрыть файл
end;
if cbstylebj.itemindex=0 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // открыть для перезаписи
   www:='\images\images for BJ\Karts 36\';
   // запись в файл
          writeln(fx,www  );
 CloseFile(fx); // закрыть файл
 end;
 if cbstylebj.itemindex=1 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // открыть для перезаписи
   // запись в файл
   www:='\images\images for BJ\Katrs_52_Xp_Style\';
          writeln(fx, www );
 CloseFile(fx); // закрыть файл
 end;
  if cbstylebj.itemindex=2 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // открыть для перезаписи
   // запись в файл
     www:='\images\images for BJ\Karts_52_7_Style\';
          writeln(fx, www );
 CloseFile(fx); // закрыть файл
 end;
begin
getdir(0,cname);
  fName :=cname+'\Setting\name.txt';
   AssignFile(f, fName);
   Rewrite(f);  // открыть для перезаписи
   // запись в файл
          writeln(f,nameedit.text );
 CloseFile(f); // закрыть файл
  MessageDlg('Настройки сохранены ',mtInformation,[mbOk],0);
end;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TForm8.BitBtn3Click(Sender: TObject);
  var crec,SaveRecBJ: string;
  ff: TextFile;       // файл
   fNamerec: String; // имя файла
begin
if messagedlg ('Вы действительно хотите очистить таблицу рекордов',
 mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
SaveRecBJ:='';
     getdir(0,crec);
  fNamerec :=crec+'\Setting\RecordBJ.txt';
   AssignFile(ff, fNamerec);
   Rewrite(ff);  // открыть для перезаписи
   // запись в файл
          writeln(ff,SaveRecBJ);
 CloseFile(ff); // закрыть файл
  MessageDlg('Таблица рекордов очищенна ',mtInformation,[mbOk],0);
 end;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
var AdrStknb: string;
  fxknb: TextFile;       // файл
   fstyleknb,wwwknb: String; // имя файла
   var AdrStknb2: string;
  fxknb2: TextFile;       // файл
   fstyleknb2,wwwknb2: String; // имя файла
begin

 end;




procedure TForm8.Button1Click(Sender: TObject);
var IIGna777,w123: string;
  fna777: TextFile;
  //стирание значения  ничьих
   begin
   w123:='0';
     getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisNicknb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // открыть для перезаписи
          writeln(fna777,w123);
 CloseFile(fna777); // закрыть файл

 //cтиранения значения   выигрышей
    getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisVigKnb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // открыть для перезаписи
          writeln(fna777,w123);
 CloseFile(fna777); // закрыть файл

 //стирание значения проигрышей)))
   getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisProigknb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // открыть для перезаписи
          writeln(fna777,w123);
 CloseFile(fna777); // закрыть файл
    MessageDlg('Статистика очищена ',mtInformation,[mbOk],0);
end;

procedure TForm8.FormCreate(Sender: TObject);
var IIGna2,IIGna,iig,stbjpro,stbjpro2,IIGna3,stbjpro3,iigna86,stbjpro86: string;
  fna,fna2,fna3,fna86: TextFile;       // файл
   var IIGna256,izik: string;
  fna256: TextFile;
begin
getdir(0,IIg);
  IIG:=IIG+'\Setting\name.txt';
  AssignFile(f,IIG);
  Reset (f);
  Read(f,Namegamer);
  Nameedit.text:=Namegamer;
  CloseFile(f);
  pagecontrol1.ActivePage:=TabSheet1;
  //настройка первого
  begin
getdir(0,IIgna);
  IIGna:=IIGna+'\Setting\StyleBj.txt';
  AssignFile(fna,IIGna);
  Reset (fna);
  Read(fna,stbjpro);
  CloseFile(fna);
end;
if stbjpro='\images\images for BJ\Karts 36\' then
   cbstylebj.itemindex:=0;
    if stbjpro='\images\images for BJ\Katrs_52_Xp_Style\' then
   cbstylebj.itemindex:=1;
    if stbjpro='\images\images for BJ\Karts_52_7_Style\' then
   cbstylebj.itemindex:=2;


    begin
getdir(0,IIgna3);
  IIGna3:=IIGna3+'\Setting\grenfon.txt';
  AssignFile(fna3,IIGna3);
  Reset (fna3);
  Read(fna3,stbjpro3);
  CloseFile(fna3);
end;
 if stbjpro3='Да' then
   Fondn.Checked:=true;
    if stbjpro3='Нет' then
   Fondn.Checked:=false;
   //настройка второго
     begin
getdir(0,IIgna2);
  IIGna2:=IIGna2+'\Setting\Styleknb.txt';
  AssignFile(fna2,IIGna2);
  Reset (fna2);
  Read(fna2,stbjpro2);
  CloseFile(fna2);
end;

        //Настройка параметров самой игры
         begin
getdir(0,IIgna86);
  IIGna86:=IIGna86+'\Setting\Language.txt';
  AssignFile(fna86,IIGna86);
  Reset (fna86);
  Read(fna86,stbjpro86);
  CloseFile(fna86);
end;
if stbjpro86='Русский' then
radiobutton1.Checked:=true;
 if stbjpro86='English' then
radiobutton2.Checked:=true;
begin
  getdir(0,IIgna256);
  IIGna256:=IIGna256+'\Setting\language.txt';
  AssignFile(fna256,IIGna256);
  Reset (fna256);
  Read(fna256,izik);
  CloseFile(fna256);
 if izik='Русский' then
 begin
  label1.Caption:='Имя игрока';
  label2.Caption:='Стиль карт';
  label3.Caption:='Зеленый фон';
   BitBtn3.Caption:='Очистить таблицу рекордов';
   BitBtn1.Caption:='Сохранить';
   BitBtn2.Caption:='Закрыть';

   label5.Caption:='Язык';
   RadioButton1.Caption:='Русский';
   Label6.Caption:='При смене языка требуется перезагрузка компа';
   BitBtn6.Caption:='Сохранить';
   BitBtn7.Caption:='Закрыть';
    form8.Caption:='Настройки';

    TabSheet3.Caption:='Настройки программы';
 end;
 if izik='English' then
  begin
    label1.Caption:='Players name';
  label2.Caption:='Style card';
  label3.Caption:='Green backgraund';
   BitBtn3.Caption:='Clear the table of records';
   BitBtn1.Caption:='Save';
   BitBtn2.Caption:='Cancel';

   label5.Caption:='Language';
   RadioButton1.Caption:='Russian';
   Label6.Caption:='When you change the language you want to restart the program';
   BitBtn6.Caption:='Save';
   BitBtn7.Caption:='Cancel';
     form8.Caption:='Setting';

    TabSheet3.Caption:='Setting of program';
  end;
end;
end;

end.
