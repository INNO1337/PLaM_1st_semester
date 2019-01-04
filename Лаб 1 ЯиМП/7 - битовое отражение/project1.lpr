Program project1;

procedure Vbin(n:qword; var a:string);

begin
 a:='';
 repeat
 until(n > 0);
 while n > 0 do begin
   if n mod 2 = 0 then
     a:= '0'+a
   else begin
     a:= '1'+a;
     n:= n - 1;
   end;
   n:= n div 2;
 end;
 end;


Var
 a,b,last:qword;
 s:string;

begin
 readln(a);
 Vbin(a,s);
 writeln(s);
 b:=0;
 while (a<>0) do
 begin
   last:= a mod 2;
   a:= a shr 1;
   b:=b shl 1 + last;
 end;
 Vbin (b,s);
 writeln(s);
 writeln(b);
 readln();
end.
