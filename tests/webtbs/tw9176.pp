{$ifdef fpc}
{$mode delphi}
{$endif}

type TBla=class
      procedure Bla;
      procedure BlaBla;
     end;

procedure TBla.Bla;
begin
end;

procedure TBla.BlaBla;
 procedure Bla;
 begin
 end;
begin
 Bla;
end;

begin
end.

