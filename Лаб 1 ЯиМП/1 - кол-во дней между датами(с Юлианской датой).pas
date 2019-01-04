program Lab1_1;

var
  d2, m2, y2, d1, m1, y1, n1, n2, n: integer;

function jul(cda, cmo, cye: integer): integer;
var
  a, y, m: integer;
begin
  a := (14 - cmo) div 12; 
  y := cye + 4800 - a; 
  m := cmo + 12 * a - 3; 
  jul := cda + ((153 * m + 2) div 5) + (365 * y) + y div 4 - y div 100 + y div 400 - 32045; 
end;

function vis(y: integer): boolean;
begin
  vis := ((y mod 4 = 0) and ((y mod 100 <> 0)) or (y mod 400 = 0)); 
end;

function check(d, m, y: integer): boolean;
begin
  case m of 
    2: check := d in [1..28 + ord(vis(y))]; 
    1, 3, 5, 7, 8, 10, 12: check := d in [1..31]; 
    4, 6, 9, 11: check := d in [1..30];
  else 
    check := False; 
  end; 
end;

begin
  read(d1, m1, y1); 
  read(d2, m2, y2); 
  if check(d1, m1, y1) and check(d2, m2, y2) then 
  begin
    n1 := jul(d1, m1, y1); 
    n2 := jul(d2, m2, y2); 
    if n2 > n1 then 
      n := n2 - n1 
    else 
      n := n1 - n2; 
    writeln(n); 
  end 
  else  
    writeln('Error'); 
end.