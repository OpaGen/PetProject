unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm7 = class(TForm)
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses mazaika;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
