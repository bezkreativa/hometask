unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    RunButton: TButton;
    InputMemo: TMemo;
    OutputMemo: TMemo;
    Quit: TToggleBox;
    procedure DoStuffClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

// abcdef
// a
// bcdef a

procedure TForm1.DoStuffClick(Sender: TObject);
var
  Line: string;
  curChar, fstChar: char;
  i, j: integer;
  InWord: boolean = False;
  AlphabetLower: set of 'a'..'z' = ['a', 'b', 'c', 'd', 'e', 'f', 'g', // idk how to make an alphabet an array in pascal
  'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
  'v', 'w', 'x', 'y', 'z'];
  AlphabetUpper: set of 'A'..'Z' = ['A', 'B', 'C', 'D', 'E', 'F', 'G',
  'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
  'V', 'W', 'X', 'Y', 'Z'];
begin
  OutputMemo.Clear;
  for i := 1 to InputMemo.Lines.Count do
  begin
    Line := '';
    for j := 1 to length(InputMemo.Lines[i]) do
    begin
      curChar := InputMemo.Lines[i][j];
      if (curChar in AlphabetLower) or (curChar in AlphabetUpper) then
      begin
        if inWord = False then
        begin
        fstChar := curChar;
        end;
        Line := Line + InputMemo.Lines[i][j + 1];
        inWord := True;
        if j = length(InputMemo.Lines[i]) then
        begin
            Line[j] := fstChar;
        end;
      end
      else
      begin
        Line := Line + curChar;
        if inWord then
        begin
          Line[j - 1] := fstChar;
          inWord := False;
        end;
      end;
    end;
    outputMemo.Lines.Add(Line);
  end;
end;

procedure TForm1.QuitClick(Sender: TObject);
begin
  Close;
end;

end.
