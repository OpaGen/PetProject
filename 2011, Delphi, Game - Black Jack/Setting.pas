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
  f: TextFile;       // ����
   fName: String; // ��� �����
implementation

uses mazaika, main;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
var AdrSt: string;
  fx: TextFile;       // ����
   fstyle,www: String; // ��� �����
   var AdrSt1: string;
  fx1: TextFile;       // ����
   fstyle1,www1: String; // ��� �����
begin
if fondn.Checked=true then
begin
     getdir(0,adrst1);
  fstyle1 :=adrst1+'\Setting\grenfon.txt';
   AssignFile(fx1, fstyle1);
   Rewrite(fx1);  // ������� ��� ����������
   www1:='��';
   // ������ � ����
          writeln(fx1,www1  );
 CloseFile(fx1); // ������� ����
end;
if fondn.Checked=false then
begin
       getdir(0,adrst1);
  fstyle1 :=adrst1+'\Setting\grenfon.txt';
   AssignFile(fx1, fstyle1);
   Rewrite(fx1);  // ������� ��� ����������
   www1:='���';
   // ������ � ����
          writeln(fx1,www1  );
 CloseFile(fx1); // ������� ����
end;
if cbstylebj.itemindex=0 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // ������� ��� ����������
   www:='\images\images for BJ\Karts 36\';
   // ������ � ����
          writeln(fx,www  );
 CloseFile(fx); // ������� ����
 end;
 if cbstylebj.itemindex=1 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // ������� ��� ����������
   // ������ � ����
   www:='\images\images for BJ\Katrs_52_Xp_Style\';
          writeln(fx, www );
 CloseFile(fx); // ������� ����
 end;
  if cbstylebj.itemindex=2 then
 begin
   getdir(0,adrst);
  fstyle :=adrst+'\Setting\StyleBj.txt';
   AssignFile(fx, fstyle);
   Rewrite(fx);  // ������� ��� ����������
   // ������ � ����
     www:='\images\images for BJ\Karts_52_7_Style\';
          writeln(fx, www );
 CloseFile(fx); // ������� ����
 end;
begin
getdir(0,cname);
  fName :=cname+'\Setting\name.txt';
   AssignFile(f, fName);
   Rewrite(f);  // ������� ��� ����������
   // ������ � ����
          writeln(f,nameedit.text );
 CloseFile(f); // ������� ����
  MessageDlg('��������� ��������� ',mtInformation,[mbOk],0);
end;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TForm8.BitBtn3Click(Sender: TObject);
  var crec,SaveRecBJ: string;
  ff: TextFile;       // ����
   fNamerec: String; // ��� �����
begin
if messagedlg ('�� ������������� ������ �������� ������� ��������',
 mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
SaveRecBJ:='';
     getdir(0,crec);
  fNamerec :=crec+'\Setting\RecordBJ.txt';
   AssignFile(ff, fNamerec);
   Rewrite(ff);  // ������� ��� ����������
   // ������ � ����
          writeln(ff,SaveRecBJ);
 CloseFile(ff); // ������� ����
  MessageDlg('������� �������� �������� ',mtInformation,[mbOk],0);
 end;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
var AdrStknb: string;
  fxknb: TextFile;       // ����
   fstyleknb,wwwknb: String; // ��� �����
   var AdrStknb2: string;
  fxknb2: TextFile;       // ����
   fstyleknb2,wwwknb2: String; // ��� �����
begin

 end;




procedure TForm8.Button1Click(Sender: TObject);
var IIGna777,w123: string;
  fna777: TextFile;
  //�������� ��������  ������
   begin
   w123:='0';
     getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisNicknb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // ������� ��� ����������
          writeln(fna777,w123);
 CloseFile(fna777); // ������� ����

 //c��������� ��������   ���������
    getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisVigKnb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // ������� ��� ����������
          writeln(fna777,w123);
 CloseFile(fna777); // ������� ����

 //�������� �������� ����������)))
   getdir(0,IIGna777);
  IIGna777 :=IIGna777+'\Setting\StatisProigknb.txt';
   AssignFile( fna777, IIGna777);
   Rewrite(fna777);  // ������� ��� ����������
          writeln(fna777,w123);
 CloseFile(fna777); // ������� ����
    MessageDlg('���������� ������� ',mtInformation,[mbOk],0);
end;

procedure TForm8.FormCreate(Sender: TObject);
var IIGna2,IIGna,iig,stbjpro,stbjpro2,IIGna3,stbjpro3,iigna86,stbjpro86: string;
  fna,fna2,fna3,fna86: TextFile;       // ����
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
  //��������� �������
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
 if stbjpro3='��' then
   Fondn.Checked:=true;
    if stbjpro3='���' then
   Fondn.Checked:=false;
   //��������� �������
     begin
getdir(0,IIgna2);
  IIGna2:=IIGna2+'\Setting\Styleknb.txt';
  AssignFile(fna2,IIGna2);
  Reset (fna2);
  Read(fna2,stbjpro2);
  CloseFile(fna2);
end;

        //��������� ���������� ����� ����
         begin
getdir(0,IIgna86);
  IIGna86:=IIGna86+'\Setting\Language.txt';
  AssignFile(fna86,IIGna86);
  Reset (fna86);
  Read(fna86,stbjpro86);
  CloseFile(fna86);
end;
if stbjpro86='�������' then
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
 if izik='�������' then
 begin
  label1.Caption:='��� ������';
  label2.Caption:='����� ����';
  label3.Caption:='������� ���';
   BitBtn3.Caption:='�������� ������� ��������';
   BitBtn1.Caption:='���������';
   BitBtn2.Caption:='�������';

   label5.Caption:='����';
   RadioButton1.Caption:='�������';
   Label6.Caption:='��� ����� ����� ��������� ������������ �����';
   BitBtn6.Caption:='���������';
   BitBtn7.Caption:='�������';
    form8.Caption:='���������';

    TabSheet3.Caption:='��������� ���������';
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
