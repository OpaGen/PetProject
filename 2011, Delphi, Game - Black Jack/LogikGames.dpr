program LogikGames;

uses
  Forms,
  main in 'main.pas' {Form1},
  Oprog in 'Oprog.pas' {Form4},
  mazaika in 'mazaika.pas' {Form5},
  Tir in 'Tir.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Setting in 'Setting.pas' {Form8},
  Rec in 'Rec.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
