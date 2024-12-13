unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    label_2: TLabel;
    label_hits: TLabel;
    label_missed: TLabel;
    btn_exit: TButton;
    btn_restart: TButton;
    Button1: TButton;
    Label3: TLabel;
    label_ships: TLabel;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure StartGame;
    procedure NbShips(xx,yy: Integer);
    procedure btn_exitClick(Sender: TObject);
    procedure btn_restartClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ships: array[0..11, 0..11] of Integer;
  hits, missed, shipsLeft: Integer;
  gameDone: Boolean;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize();
  StartGame;
end;



procedure TForm1.StartGame;
var
i,j,x,y,ii,jj,temp: Integer;
placed, blocked : Boolean;
begin
  gameDone := false;
  hits := 0;
  missed := 0;
  shipsLeft := 10;

  label_missed.Caption := inttostr(missed);
  label_hits.Caption := inttostr(hits);
  label_ships.Caption := inttostr(shipsLeft);

  btn_restart.Visible := false;

  
  // clears field
  for i := 0 to 11 do begin
    for j := 0 to 11 do begin
      Ships[i,j] := 0;
    end;
  end;

  for i:= 0 to 9 do begin
    for j:= 0 to 9 do begin
      StringGrid1.Cells[i,j] := '';
    end;
  end;



  // ship placement
  for i := 1 to 4 do begin
    for j:= 1 to i do begin
      placed := false;
      while (placed = false) do begin

        blocked := false;
        x := random(10) + 1;
        y := random(10) + 1;

        if not (Ships[x,y] = 0) then Continue;

        temp := random(2);

        if(temp = 0) then begin
            if(x > 6 + i) then Continue;
            for ii := -1 to 5 - i do begin
              for jj := -1 to 1 do begin
                if (Ships[x + ii, y + jj] = 1) then blocked := true;
              end;
            end;

            if (blocked) then Continue;
            for ii := 0 to 4 - i do begin
              Ships[x + ii, y] := 1;
            end;
            placed := true;

        end else begin
          if(y > 6 + i) then Continue;
          for ii := -1 to 5 - i do begin
            for jj := -1 to 1 do begin
              if (Ships[x + jj, y + ii] = 1) then blocked := true;
            end;
          end;

          if (blocked) then Continue;
          for ii := 0 to 4 - i do begin
            Ships[x, y + ii] := 1;
          end;
          placed := true;
        end;

      end; // end while



    end;
  end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

var
i: Integer;
begin
  if(GameDone)then Exit;

  if(Ships[ACol + 1, ARow + 1] = 1) then begin
    Ships[Acol + 1, ARow + 1] := 2;
    StringGrid1.Cells[Acol, ARow] := 'X';
    NbShips(ACol + 1, ARow + 1);


    inc(hits);
    label_hits.Caption := inttostr(hits);
    //ShowMessage('hit');
  end else if(Ships[ACol + 1, ARow + 1] = 0) then begin
    Ships[ACol + 1, ARow + 1] := 3;
    StringGrid1.Cells[Acol, ARow] := 'M';
    inc(missed);
    label_missed.Caption := inttostr(missed);
    //ShowMessage('missed');
  end;

  if (hits >= 20) then begin
  ShowMessage('You Won' + sLineBreak + 'Du hast: ' + inttostr(hits + missed) + ' Versuche gebraucht');
  GameDone := true;
  btn_restart.Visible := true;
  end; 

end;


procedure TForm1.NbShips(xx,yy: Integer);
var
_hit, dead: Boolean;
i: Integer;
begin
  dead := true;

  if (Ships[xx + 1, yy] = 2) then begin
    i := 1;
    while not ((Ships[xx + 1 + i, yy] = 0) or (Ships[xx + 1 + i, yy] = 3)) do begin
    if Ships[xx + 1 + i, yy] = 1 then dead := false;
    inc(i);
    end;
  end;
  if (Ships[xx - 1, yy] = 2) then begin
    i := 1;
    while not ((Ships[xx - 1 - i, yy] = 0) or (Ships[xx - 1 - i, yy] = 3)) do begin
    if Ships[xx - 1 - i, yy] = 1 then dead := false;
    inc(i);
    end;
  end;
  if (Ships[xx, yy + 1] = 2) then begin
    i := 1;
    while not ((Ships[xx, yy + 1 + i] = 0) or (Ships[xx, yy + 1 + i] = 3)) do begin
    if Ships[xx, yy + 1 + i] = 1 then dead := false;
    inc(i);
    end;
  end;
  if (Ships[xx, yy - 1] = 2) then begin
    i := 1;
    while not ((Ships[xx, yy - 1 - i] = 0) or (Ships[xx, yy - 1 - i] = 3)) do begin
    if Ships[xx, yy - 1 - i] = 1 then dead := false;
    inc(i);
    end;
  end;

  if(Ships[xx + 1, yy] = 1) then dead := false;
  if(Ships[xx - 1, yy] = 1) then dead := false;
  if(Ships[xx, yy + 1] = 1) then dead := false;
  if(Ships[xx, yy - 1] = 1) then dead := false;



  if not (Ships[xx + 1, yy] = 0) and not (Ships[xx - 1, yy] = 0) and not (Ships[xx, yy - 1] = 0) and not (Ships[xx, yy + 1] = 0) then dead := false;

  if (dead) then begin
    dec(shipsLeft);
    label_ships.Caption := inttostr(shipsLeft);
    ShowMessage('Versenkt!!!');
  end;
end;


procedure TForm1.btn_exitClick(Sender: TObject);
begin
Close();
end;

procedure TForm1.btn_restartClick(Sender: TObject);
begin
  StartGame;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
ShowMessage('Klicke eine Zelle an um sie auszuwehlen. Es gibt Schiffe in folgender Laenge:' + sLineBreak + '4 x1' + sLineBreak + '3 x2' + sLineBreak + '2 x3' + sLineBreak + '1 x4' + sLineBreak + 'Nach Anklicken wird dir durch ein "M" signalisiert, dass diese Zelle leer war, durch ein "X" wird ein Treffer symbolisiert.')
end;

end.


//0 Empty Cell
//1 Ship Cell
//2 hitted cell
//3 empty cell hitted
