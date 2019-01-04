program bitovoe_otrajenie;

var
  A, B: longword; 
  i: integer;

begin
  write('A: '); 
  readln(A); 
  write('A: '); 
  for i := sizeof(longword) * 8 - 1 downto 0 do 
    write(ord(1 shl i and a <> 0)); 
  writeln;
  
  write('B: '); 
  for i := 0 to sizeof(longword) * 8 - 1 do 
    write(ord(1 shl i and a <> 0)); 
end.