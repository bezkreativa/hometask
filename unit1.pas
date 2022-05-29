unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditFirst: TEdit;
    EditSecond: TEdit;
    EditThird: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMemo: TMemo;
    procedure ButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
function TriangleExist(a, b, c: real): boolean;
var
     res: boolean = False;
begin
     if ((a+b) > c) and ((a+c) > b) and ((c+b) > a) then
         res := True;
     TriangleExist := res
end;

function GetRadius(a, b, c : real): real;
var
     p, area, radius: real;
begin;
   p := (a+b+c)/2;
   area := sqrt(p*(p-a)*(p-b)*(p-c));
   radius := area / p;
   GetRadius := radius;
end;

function GetRightSide(radius: real): real;
begin
     GetRightSide := radius * 2 * sqrt(3)
end;

procedure TForm1.ButtonClick(Sender: TObject);
var
    radius: real;
    rightSide: real;
    a, b, c: real;
begin
    a := StrToFloat(EditFirst.Text);
    b := StrToFloat(EditSecond.Text);
    c := StrToFloat(EditThird.Text);
    if TriangleExist(a, b, c) then
        begin;
          MainMemo.Lines.Add('Трегуольник существует');
          radius := GetRadius(a, b, c);
          MainMemo.Lines.Add('Радиус вписанной окружности: ', [radius]);
          rightSide := GetRightSide(radius);
          MainMemo.Lines.Add('Сторона правильного треугольника: ', [rightSide]);
        end
    else
        MainMemo.Lines.Add('Трегуольник не существует.');
end;

end.

