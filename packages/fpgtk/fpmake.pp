{$ifndef ALLPACKAGES}
{$mode objfpc}{$H+}
program fpmake;

uses fpmkunit;

Var
  P : TPackage;
  T : TTarget;
begin
  With Installer do
    begin
{$endif ALLPACKAGES}

    P:=AddPackage('fpgtk');
{$ifdef ALLPACKAGES}
    P.Directory:='fpgtk';
{$endif ALLPACKAGES}
    P.Version:='2.6.0';
    P.Author := 'Luk Vandelaer & Sebastian Guenther (?)';
    P.License := 'LGPL with modification, ';
    P.HomepageURL := 'www.freepascal.org';
    P.Email := '';
    P.Description := 'Lightweight OOP wrapper over GTK1.';
    P.NeedLibC:= True;

    P.Dependencies.Add('gtk1');
    P.SourcePath.Add('src');

    T:=P.Targets.AddUnit('fpglib.pp');
    T:=P.Targets.AddUnit('fpgtkext.pp');
      with T.Dependencies do
        begin
          AddUnit('fpgtk');
        end;
    T.ResourceStrings := True;
    T:=P.Targets.AddUnit('fpgtk.pp');
      with T.Dependencies do
        begin
          AddUnit('fpglib');
        end;
    T.ResourceStrings := True;

    P.ExamplePath.Add('examples');
    P.Targets.AddExampleProgram('examples/lister.pp');
    P.Targets.AddExampleProgram('examples/testgtk.pp');
    // 'examples/Makefile
    // 'examples/Makefile.fpc
    // 'examples/testgtk.ppr

{$ifndef ALLPACKAGES}
    Run;
    end;
end.
{$endif ALLPACKAGES}
