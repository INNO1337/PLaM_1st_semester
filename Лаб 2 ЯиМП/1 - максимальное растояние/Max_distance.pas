program Max_distance;


var
  r, d: double;
  i, j, n, z1, z2: integer;
  z: array of record
    x, y: real
  end;
begin
  write('insert ammount of points: ');
  Readln(n);
  SetLength(z,n);
  for i := 1 to n do
  begin
    write('Coordinates of point_', i, ' (x', i,' y', i, '): ');
    Readln(z[i].x, z[i].y)
  end;
  r := 0;
  for i := 1 to n - 1 do
    for j := i + 1 to n do
    begin
      d := sqrt((z[i].x - z[j].x) * (z[i].x - z[j].x) + (z[i].y - z[j].y) * (z[i].y - z[j].y));
      if d > r then
      begin
        r := d;
        z1 := i;
        z2 := j
      end
    end;
  writeln('The biggest distanse is between ', z1, ' and ', z2);
  readln();
end.

