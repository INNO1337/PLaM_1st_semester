unit Unit1;


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    procedure Button16Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure ClickButton(Sender: TObject);
    procedure ClickSign(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;
  A, B, C: double;
  Sign: string;
  flag,minus,eq: boolean;
  pustota: string;

implementation

{$R *.lfm}

                              { TForm1 }

{ПРОВЕРКА ЗАПЯТОЙ}
procedure TForm1.Button23Click(Sender: TObject);
BEGIN
   if pos(',', Edit1.Text)=0
   then Edit1.Text:=Edit1.Text + (Sender as TButton).Caption;
END;


{ВВОД ЗНАЧЕНИЙ}
procedure TForm1.ClickButton(Sender: TObject);
BEGIN
   if (not flag) then
   begin
      pustota:= Edit1.Text;
   if pustota = '0' then
     Delete(pustota,length(pustota),1);
     Edit1.Text:=pustota;
     Edit1.Text:=Edit1.Text + (Sender as TButton).Caption;
     pustota:='';
   end else
   begin
      flag:=false;
      Edit1.Text:=(Sender as TButton).Caption;
   end;
END;


{+ НА - И НАОБОРОТ}
procedure TForm1.Button21Click(Sender: TObject);
var check:double;
BEGIN

END;


{МИНУС}
procedure TForm1.Button16Click(Sender: TObject);
BEGIN
   eq:=false;
   //minus - знак переменной, а не действие
   if (Edit1.Text='0') then
   begin
        minus:=true;
        exit;
   end else
   //короче если minus, то тупо вводишь число и всё норм
   //а потом короче такой нажимаешь любой другой знак или минус и
   //число отображаетя с минусом ну а дальше по классике

   if  (pos('/', Sign)=0) and
       (pos('*', Sign)=0) and
       (pos('+', Sign)=0) and
       (pos('-', Sign)=0) then
           pustota:=Edit1.Text;
           if pustota='0' then
           begin
                 Delete(pustota,length(pustota),1);
                 Edit1.Text:=FloatToStr(a);
                 if minus then
                 begin
                      A:=-(StrToFloat(Edit1.Text));
                      minus:=false;
                 end else
                      A:=StrToFloat(Edit1.Text);
            end else
            if minus then
            begin
              A:=-(StrToFloat(Edit1.Text));
              minus:=false;
            end else
            A:=StrToFloat(Edit1.Text);
            flag:=true;
Sign:=(Sender as TButton).Caption;
Edit1.Text:=FloatToStr(a);
END;


{ВВОД ЗНАКА ОПЕРАЦИИ}
procedure TForm1.ClickSign(Sender: TObject);
BEGIN
   eq:=false;
   if  (pos('/', Sign)=0) and
       (pos('*', Sign)=0) and
       (pos('+', Sign)=0) and
       (pos('-', Sign)=0) then
           pustota:=Edit1.Text;
           if pustota='0' then
           begin
                 Delete(pustota,length(pustota),1);
                 Edit1.Text:=FloatToStr(a);
                 if minus then
                 begin
                      A:=-(StrToFloat(Edit1.Text));
                      minus:=false;
                 end else
                      A:=StrToFloat(Edit1.Text);
            end else
            if minus then
            begin
              A:=-(StrToFloat(Edit1.Text));
              minus:=false;
            end else
            A:=StrToFloat(Edit1.Text);
            flag:=true;
Sign:=(Sender as TButton).Caption;
Edit1.Text:=FloatToStr(A);
END;


{РАВНО}
procedure TForm1.Button24Click(Sender: TObject);
BEGIN
  if not eq then
  begin
  if minus then
     begin
       if Edit1.Text <> '0' then
       Edit1.Text:='-'+Edit1.Text;
       minus:=false;
     end;
  b:=StrToFloat(Edit1.Text);
  Edit1.Clear;
  begin
       Case Sign of
            '' : c:=b;
            '+': c:=a+b;
            '-': c:=a-b;
            '*': c:=a*b;
            '/': if b=0 then
            begin
                 Edit1.Text:='0';
                 ShowMessage('Ошибка, деление на 0 не допустимо');
                 exit;
            end else
                 c:=a/b;
       end;

       Edit1.Text:=FloatToStr(c);
       eq:=true;
  end;

  end;




END;


{КВАДРАТНЫЙ КОРЕНЬ}
procedure TForm1.Button2Click(Sender: TObject);
BEGIN
  if minus then
  begin
       Edit1.Text := '0';
          ShowMessage(('Ошибка, корень из отрицательного ') +
          ('числа не существует в области действительных чисел'));
          a:=0;
          minus:=false;
  end;

  a:= StrToFloat(Edit1.Text);
     if a >= 0 then
     begin
          c:= sqrt(a);
          Edit1.Text := FloatToStr(c);
          a:= 0;
     end
     else
     begin
          Edit1.Text := '0';
          ShowMessage(('Ошибка, корень из отрицательного ') +
          ('числа не существует в области действительных чисел'));
          a:=0;
     end;
END;


{ВОЗВЕДЕНИЕ В КВАДРАТ}
procedure TForm1.Button3Click(Sender: TObject);
BEGIN
  a:=StrToFloat(Edit1.Text);
  c:=sqr(a);
  Edit1.Text:= FloatToStr(c);
  a:=0;
END;


{1/X}
procedure TForm1.Button4Click(Sender: TObject);
BEGIN
  a:=StrToFloat(Edit1.Text);
  if (a <> 0) then
  begin
    if minus then
    begin
       c:=-(1/a);
       minus:=false;
    end else
       c:=1/a;
       Edit1.Text:=FloatToStr(c);
       a:=0;
  end else
  begin
       Edit1.Text:='0';
       ShowMessage('Ошибка, деление на 0 не допустимо');
  end;
END;


{ПРОЦЕНТ}
procedure TForm1.Button1Click(Sender: TObject);
var
   p:double;
BEGIN
   if (Edit1.Text <> '') then
     begin
     b:=StrToFloat(Edit1.Text);
     Edit1.Clear;
     p:=(a/100)*b;

  Case Sign of
       '+': c:=a+p;
       '-': c:=a-p;
       '*': c:=a*p;
       '/': if p=0 then
      begin
           Edit1.Text:='0';
           ShowMessage('Ошибка, деление на 0 не допустимо');
           exit;
      end else
          c:=a/p;
  end;
      Edit1.Text:=FloatToStr(c);
      end;
   eq:=true
END;



{ПОСИМВОЛЬНОЕ УДАЛЕНИЕ}
procedure TForm1.Button7Click(Sender: TObject);
Var
str:string;
BEGIN
   str:= Edit1.Text;
        if (length(str)=2) and (pos('-',str)>0) then
           Edit1.Text:='0'
           else
             begin
  if (str <> '') and (str <> '0') then
     Delete(str,length(str),1);
     if (str = '') then
       Edit1.Text:='0' else
         Edit1.Text:=str;
end;
END;


{ОЧИСТИТЬ ПОЛЕ}
procedure TForm1.Button5Click(Sender: TObject);
BEGIN
   Edit1.Text:='0';
END;


{CТРОГОЕ УДАЛЕНИЕ}
procedure TForm1.Button6Click(Sender: TObject);
BEGIN
  c:=0;
  a:=0;
  b:=0;
  minus:=false;
  Edit1.Text:='0';
END;

end.
