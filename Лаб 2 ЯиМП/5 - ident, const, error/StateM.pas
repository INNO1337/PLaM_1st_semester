Program StateM;

uses
  strutils;

type
  states = (no, id, error, const_int, const_signed, const_float, find_Quot,
  Check_Quot);

function isDot(c: char):boolean;
begin
  if (c = '.') then
     result:=true
     else
       result:=false;
end;

function IsLetter(c: char):boolean;
begin
  if (c in ['a'..'z']) or (c in ['A'..'Z']) or (c='_') then
     result:= true
     else
       result:=false;
end;

function IsDigit(c: char): boolean;
begin
  if (c in ['0'..'9']) then
     result:=true
     else
       result:=false;
end;

function IsSign(c: char): boolean;
begin
  if (c='+') or (c='-') then
     result:=true
     else
       result:=false;
end;

function WhatState(c: char): states;
begin
  if (isLetter(c)) then
     result:=id else
  if (isDot(c)) then
     result:=const_float else
  if (isDigit(c)) then
     result:=const_int else
  if (isSign(c)) then
     result:=const_signed else
  if (c = chr(39)) then
     result:=Find_Quot else
     result:=error;
end;

Var
  state: states;
  s, buf: string;
  i: integer;

BEGIN
   writeln('Enter your string:');
   while (true) do
   begin
     readln(s);
     s:= TrimRightSet(s, [' ']);
     state:=no;
     buf:='';
     i:=1;
     while (True) do
     begin
       case state of

            NO: begin
              if (i>length(s)) then break;
              if (s[i]=' ') then begin
                state:=no;
              end else
              begin
                buf:=buf+s[i];
                state:=WhatState(s[i]);
              end;
            end;

            ID: begin
              if (isLetter(s[i])) or (isDigit(s[i])) then
                 begin
                   buf:=buf+s[i];
                 end;
              if (s[i]=' ') or (i > length(s)) then
                 begin
                   state:=no;
                   writeln(buf,' ', 'IDENT');
                   buf:='';
                 end else
                 if not (isLetter(s[i])) and not (isDigit(s[i])) then
                    begin
                      buf:=buf+s[i];
                      state:=error;
                    end;
            end;

            CONST_FLOAT: begin
              if (s[i]=' ') or (i>length(s)) then
                 begin
                   writeln(buf, ' ', 'CONST');
                   state:=no;
                   buf:='';
                 end else
                 begin
                   buf:=buf+s[i];
                   if (isDigit(s[i])) then begin
                     state:=const_float;
                   end;
                   if (isDot(s[i])) then begin
                     state:=error;
                   end;
                 end;
            end;

            CONST_SIGNED: begin
              if (s[i]=' ') or (i>length(s)) then
                 begin
                   writeln(buf, ' ', 'ERROR');
                   state:=no;
                   buf:='';
                 end else
                 begin
                   buf:=buf+s[i];
                   if (isDigit(s[i])) then begin
                     state:=const_int;
                   end else
                   if (isDot(s[i])) then
                      begin
                        state:=const_float;
                      end else
                      begin
                        state:=error;
                      end;
                 end;
            end;

            CONST_INT: begin
              if (i > length(s)) or (s[i]=' ') then
                 begin
                   writeln(buf, ' ', 'CONST');
                   state:=no;
                   buf:='';
                 end else
                 begin
                   buf:=buf+s[i];
                   if (isDot(s[i])) then
                      begin
                        state:=const_float;
                      end else
                      if not (isDigit(s[i])) then
                         begin
                           state:=error;
                         end;
                 end;
            end;

            FIND_QUOT: begin
              if (i>length(s)) then
                 begin
                   writeln(buf, ' ', 'ERROR');
                   buf:='';
                   state:=no;
                 end else
                 begin
                   buf:=buf+s[i];
                   if (s[i]='''') then begin
                     state:=check_quot;
                   end else
                   begin
                     state:=find_quot;
                   end;
                 end;
            end;

            CHECK_QUOT: begin
              if (s[i]=' ') or (i>length(s)) then
                 begin
                   writeln(buf, ' ', 'CONST');
                   buf:='';
                   state:=no;
                 end else
                 begin
                   buf:=buf+s[i];
                   if (s[i]=chr(39)) then begin
                     state:=find_quot;
                   end else
                   begin
                     state:=error;
                   end;
                 end;
            end;

            ERROR: begin
              if (i>length(s)) or (s[i]=' ') then
                 begin
                   writeln(buf, ' ', 'ERROR');
                   buf:='';
                   state:=no;
                 end else
                 begin
                   buf:=buf+s[i];
                 end;
            end;
       end;
       i:=i+1;
     end;
   end;
   readln()
END.

