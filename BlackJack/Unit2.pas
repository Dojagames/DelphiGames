unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    D_Count_Text: TLabel;
    Label5: TLabel;
    Count_Text: TLabel;
    Player_Cards: TStringGrid;
    Dealer_Cards: TStringGrid;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Score, D_Score, Count, D_Count, hits: Integer;


implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate();
end;



Function ReturnCard(input: Integer): string;
begin

  case input of
    2..10: Result := inttostr(input);
    11: Result := 'J';
    12: Result := 'D';
    13: Result := 'K';
    14: Result := 'A';
  end;
end;

Function ReturnVal(input, currentVal: Integer): Integer;
begin



  case input of
    2..10: Result := input;
    11..13: Result := 10;
    14: Result := 11;
  end;

  if ((currentVal > 10) and (input = 14)) then Result := 1;
end;



procedure TForm2.FormCreate(Sender: TObject);
var
  buffer, i: Integer;
begin
  //initialize
  hits := 0;
  Count := 0;
  D_Count := 0;
  Player_Cards.ColCount := 2;
  Dealer_Cards.ColCount := 2;
  randomize();
  Button1.Visible := true;
  Button2.Visible := true;
  Button3.Visible := false;

  //Dealer Draw
  buffer := random(13) + 2;
  Dealer_Cards.Cells[0, 0] := ReturnCard(buffer);
  D_Count := D_Count + ReturnVal(buffer, D_Count);
  D_Count_Text.Caption := inttostr(D_Count);

  //Player Draw
  for i := 0 to 1 do begin
    buffer := random(13) + 2;
    Player_Cards.Cells[i, 0] := ReturnCard(buffer);
    Count := Count + ReturnVal(buffer, Count);
  end;
  Count_Text.Caption := inttostr(Count);

  if Count = 21 then
  begin
    buffer := random(13) + 2;
    Dealer_Cards.Cells[1, 0] := ReturnCard(buffer);
    D_Count := D_Count + ReturnVal(buffer, D_Count);
    D_Count_Text.Caption := inttostr(D_Count);

    if Count > D_Count then
    begin
      Score := Score + 1;
      ShowMessage('You Won... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));

      Button1.Visible := false;
      Button2.Visible := false;
      Button3.Visible := true;
    end
    else
    begin
      ShowMessage('Draw... your score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
      Button1.Visible := false;
      Button2.Visible := false;
      Button3.Visible := true;
    end;
  end;

end;



procedure TForm2.Button1Click(Sender: TObject);
var
  buffer: Integer;
begin
  if Count = 21 then
  begin
    ShowMessage('already at 21');
    Exit;
  end;

  Player_Cards.ColCount := Player_Cards.ColCount + 1;
  buffer := random(13) + 2;
  Player_Cards.Cells[Player_Cards.ColCount - 1, 0] := ReturnCard(buffer);
  Count := Count + ReturnVal(buffer, Count);
  Count_Text.Caption := inttostr(Count);

  if Count > 21 then
  begin
    buffer := random(13) + 2;
    Dealer_Cards.Cells[1, 0] := ReturnCard(buffer);
    D_Count := D_Count + ReturnVal(buffer, D_Count);
    D_Count_Text.Caption := inttostr(D_Count);

    D_Score := D_Score + 1;
    ShowMessage('You Lost (Overbought)... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
      Button1.Visible := false;
      Button2.Visible := false;
      Button3.Visible := true;
  end;
end;




// stay
procedure TForm2.Button2Click(Sender: TObject);
var
  buffer: Integer;
begin
  buffer := random(13) + 2;
  Dealer_Cards.Cells[1, 0] := ReturnCard(buffer);
  D_Count := D_Count + ReturnVal(buffer, D_Count);
  D_Count_Text.Caption := inttostr(D_Count);

  if D_Count = 21 then
  begin
    D_Score := D_Score + 1;
    ShowMessage('You Lost... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));

    Button1.Visible := false;
    Button2.Visible := false;
    Button3.Visible := true;
    exit;
  end;

  while D_Count < 17 do begin
    buffer := random(13) + 2;
    Dealer_Cards.ColCount := Dealer_Cards.ColCount + 1;
    Dealer_Cards.Cells[Dealer_Cards.ColCount - 1, 0] := ReturnCard(buffer);
    D_Count := D_Count + ReturnVal(buffer, D_Count);
    D_Count_Text.Caption := inttostr(D_Count);
  end;

  if D_Count > 21 then
  begin
    Score := Score + 1;
    ShowMessage('You Won... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
    Button1.Visible := false;
    Button2.Visible := false;
    Button3.Visible := true;
    exit;
  end;

  if Count > D_Count then
    begin
    Score := Score + 1;
    ShowMessage('You Won... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
    Button1.Visible := false;
    Button2.Visible := false;
    Button3.Visible := true;
    end
  else if D_Count > Count then
    begin
    D_Score := D_Score + 1;
    ShowMessage('You Lost... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
    Button1.Visible := false;
    Button2.Visible := false;
    Button3.Visible := true;
    end
  else
  begin
    ShowMessage('Draw... your score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
    Button1.Visible := false;
    Button2.Visible := false;
    Button3.Visible := true;
  end;


end;





// new Game
procedure TForm2.Button3Click(Sender: TObject);
var
buffer, i: Integer;
begin
  hits := 0;
  Count := 0;
  D_Count := 0;
  Player_Cards.ColCount := 2;
  Dealer_Cards.ColCount := 2;
  Dealer_Cards.Cells[1, 0] := '';
  Button1.Visible := true;
  Button2.Visible := true;
  Button3.Visible := false;


    //Dealer Draw
  buffer := random(13) + 2;
  Dealer_Cards.Cells[0, 0] := ReturnCard(buffer);
  D_Count := D_Count + ReturnVal(buffer, D_Count);
  D_Count_Text.Caption := inttostr(D_Count);

  //Player Draw
  for i := 0 to 1 do begin
    buffer := random(13) + 2;
    Player_Cards.Cells[i, 0] := ReturnCard(buffer);
    Count := Count + ReturnVal(buffer, Count);
  end;
  Count_Text.Caption := inttostr(Count);

  if Count = 21 then
  begin
    buffer := random(13) + 2;
    Dealer_Cards.Cells[1, 0] := ReturnCard(buffer);
    D_Count := D_Count + ReturnVal(buffer, D_Count);
    D_Count_Text.Caption := inttostr(D_Count);

    if Count > D_Count then
    begin
      Score := Score + 1;
      ShowMessage('You Won... Your Score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));

      Button1.Visible := false;
      Button2.Visible := false;
      Button3.Visible := true;
    end
    else
    begin
      ShowMessage('Draw... your score is ' + inttostr(Score) + ' / ' + inttostr(D_Score));
      Button1.Visible := false;
      Button2.Visible := false;
      Button3.Visible := true;
    end;
  end;
end;

end.

