unit Rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm9 = class(TForm)
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses mazaika;

{$R *.dfm}

procedure TForm9.FormActivate(Sender: TObject);
var recput: string;
begin
 GetDir(0,recput);
 recput:=recput+'\Setting\RecordBJ.txt';
 memo1.Lines.LoadFromFile(recput);
end;

procedure TForm9.FormKeyPress(Sender: TObject; var Key: Char);
begin
 KEY:=CHR(0);
end;

procedure TForm9.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
 KEY:=CHR(0);
end;

end.
