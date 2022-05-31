unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  Interfaces;

type

  { TForm1 }

  TForm1 = class(TForm)
    InputMatrix: TStringGrid;
    MeanPlaceholder: TLabel;
    RandomFillButton: TButton;
    ConfirmButton: TButton;
    MatrixSizeValueEdit: TEdit;
    MatrixSizeQuery: TLabel;
    ResultDeclarationLabel: TLabel;
    MeanDeclaration: TLabel;
    ResultVector: TStringGrid;
    procedure ConfirmButtonClick(Sender: TObject);
    procedure OnSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure RandomFillButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.RandomFillButtonClick(Sender: TObject);
var
   size, i, j: integer;
begin
   size := StrToInt(MatrixSizeValueEdit.Text);
   if size > 9 then begin ShowMessage('Size Too Big!'); exit; end;
   Randomize;
   InputMatrix.Clean;
   for i := 0 to size-1 do
       for j := 0 to size-1 do
           InputMatrix.Cells[i, j] := Format('%6d', [100-Random(200)]);
end;

procedure TForm1.ConfirmButtonClick(Sender: TObject);
var
   size, minValue, x, y, i, sum: integer;
   minValuesList : array [1..10] of integer;
begin
   size:= StrToInt(MatrixSizeValueEdit.Text);
   if size > 9 then begin ShowMessage('Size Too Big!'); exit; end;
   for x := 0 to size-1 do begin
       minValue := 1000000;
       for y := 0 to size-1 do begin
           if StrToInt(InputMatrix.Cells[x, y]) < minValue then begin
             minValue := StrToInt(InputMatrix.Cells[x, y]);
           end;
       minValuesList[x] := minValue;
       end;
   end;
   sum := 0;
   ResultVector.Clean();
   ResultVector.ColCount := size;
   for i := 0 to size-1 do begin
       ResultVector.Cells[i, 0] := IntToStr(minValuesList[i]);
       inc(sum, minValuesList[i]);
   end;
    MeanPlaceholder.Caption := FloatToStr(sum / size);
end;

procedure TForm1.OnSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
   InputMatrix.Cells[Acol, Arow] := Format('%6d', [StrToInt(InputMatrix.Cells[ACol, Arow])])
end;

end.

