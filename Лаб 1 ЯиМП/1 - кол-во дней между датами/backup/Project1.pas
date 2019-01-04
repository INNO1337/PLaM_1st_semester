program Dates;
     {проверка на високосный год}
     function vis(g:integer):boolean;
     begin
       vis:=((g mod 4=0) and (g mod 100<>0)) or (g mod 400=0)
     end;
{количество дней, которое уже прошло в данном году}
function Dpassed(d,m,g:integer):word;
var
  k:word;
  k2:byte;
  begin
    if vis(g) then k2:=60
    else k2:=59;
    case m of
    1:k:=d;
    2:k:=31+d;
    3:k:=k2+d;
    4:k:=k2+31+d;
    5:k:=k2+61+d;
    6:k:=k2+92+d;
    7:k:=k2+122+d;
    8:k:=k2+153+d;
    9:k:=k2+184+d;
    10:k:=k2+214+d;
    11:k:=k2+245+d;
    12:k:=k2+275+d;
    end;
    Dpassed:=k;
  end;
{количество дней прошло между датами}
function DbtD(d1,m1,g1,d2,m2,g2:integer):qword;
var i:word;
    k:qword;
begin
  if g1=g2 then k:=Dpassed(d2,m2,g2)- Dpassed(d1,m1,g1)-1{если даты в одном году}
   else if g2-g1=1 then
        begin
          if vis(g1) then k:=366-Dpassed(d1,m1,g1)+Dpassed(d2,m2,g2) else
            k:=365-Dpassed(d1,m1,g1)+Dpassed(d2,m2,g2);
        end else
  if g2-g1>1 then
       begin
       if vis(g1) then k:=366-Dpassed(d1,m1,g1)+Dpassed(d2,m2,g2) else
            k:=365-Dpassed(d1,m1,g1)+Dpassed(d2,m2,g2);
       for i:=g1+1 to g2-1 do
       if vis(i) then k:=k+366 else k:=k+365;
       end;
  DbtD:=k;
end;
function check(d,m:byte;g:integer):boolean;

    begin
      check:=true;
      if (g < 0)
       or not(m in [1..12])
       or((m in [1,3,5,7,8,10,12]) and not(d in [1..31])
       or ((m=2) and vis(g) and not (d in [1..29]))
       or ((m=2) and not vis(g) and not (d in [1..28])))
       then check:=false;
    end;

Var
    d1,d2,m1,m2:byte;
      g1,g2,pl:integer;


begin
repeat
  writeln('vvedite 2 dati v formate dd mm gggg (vtoraya data pozdnee).');
  repeat
  write('Data N1 - ');
  readln(d1,m1,g1);
  if not check(d1,m1,g1) then
       writeln('oshibka, povtorite vvod:');
  until check(d1,m1,g1);
  repeat
  write(' Data N2 - ');
  readln(d2,m2,g2);
  if not check(d2,m2,g2) then
       writeln('oshibka, povtorite vvod:');
  until check(d2,m2,g2);

if (g2<g1) or ((g2 = g1)
   and (DbtD(1,1,1,d1,m1,g1) > DbtD(1,1,1,d2,m2,g2)))
       then writeln('vtoraya data menshe pervoy, povtorite vvod');
   until (g2>g1) or((g2=g1)
   and(DbtD(1,1,1,d1,m1,g1)<= DbtD(1,1,1,d2,m2,g2)));
   writeln('Mejdu etimi datami proshlo: ', DbtD(d1,m1,g1,d2,m2,g2),' dney.');

if (m2>m1)or((m2=m1)and(d2>=d1)) then pl:=g2-g1 else pl:=g2-g1-1;
   writeln('kolichestvo polnih let: ', pl);
readln();
end.

