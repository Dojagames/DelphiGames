unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btn_start: TButton;
    btn_exit: TButton;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btn_exitClick(Sender: TObject);
begin
Close();
end;

procedure TForm1.btn_startClick(Sender: TObject);
begin
Form2.Show;
Form1.Visible := false;
end;

end.
