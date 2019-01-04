program fibonaccieva_ss;

var
  f: array [0..46] of integer; 
  n, i, j: integer; 
  s: string;

begin
  read(n); 
  f[0] := 0; 
  f[1] := 1; 
  for i := 2 to 46 do 
    f[i] := f[i - 2] + f[i - 1]; 
  i := 1; 
  while f[i + 1] <= n do 
    i := i + 1;  
  for j := 1 to i - 2 do 
    s := s + '0'; 
  s := '1' + s; 
  n := n - f[i]; 
  while n > 0 do 
  begin
    j := 1; 
    while f[j + 1] <= n do 
      j := j + 1; 
    s[i + 1 - j] := '1'; 
    n := n - f[j]
  end; 
  write(s); 
end.