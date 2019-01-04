program Koordinati;
var
  a,b,y1,x1,y2,x2: real;
begin
    readln(a, b);
    readln(x1,y1);
    readln(x2,y2);
    if (y1=a*x1+b) and (y2=a*x2+b) then
      begin
      writeln('лежат на линии');
      exit;
      end;
    if ((y1>a*x1+b) and (y2>a*x2+b)) or ((y1<a*x1+b) and (y2<a*x2+b)) then
       writeln('в одной полуплоскости')
    else
      writeln('в разных полуплоскостях');
end.

