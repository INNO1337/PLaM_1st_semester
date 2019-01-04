program matrix1;

type
  matrix = array [1..100, 1..100] of integer;
var

  a, b: matrix;
  i, j, n, k: byte; { индексы массива }
begin
  Write('insert "n": ');
  readln(n);
  if (n > 100) then
  begin
    writeln('"n" is too big.');
    exit;
  end
  else
  if (n < 1) then
  begin
    writeln('"n" is too small.');
    exit;
  end;
  for i := 1 to n do
    for j := 1 to n do
    begin
      Write('A[', i, ', ', j, '] = ');
      readln(a[i, j]);
    end;
  writeln();
  writeln();
  writeln('matrix A[', n, ' x ', n, ']:');
  writeln();
  for i := 1 to n do
  begin
    for j := 1 to n do
      Write(a[i, j]: 4);
    writeln;
  end;
  writeln();
  writeln();
  writeln('matrix B[', n, ' x ', n, ']:');
  writeln();
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      b[i, j] := 0;
      for k := 1 to n do
        b[i, j] := b[i, j] + a[i, k] * a[k, j];
      Write(b[i, j]: 4);
    end;
    writeln;
  end;
  readln();
end.
