program CreaAlbBin (input, ouput);


type
    tRefBinBaum = ^tBinBaum;
    tBinBaum = record
        info : integer;
        links : tRefBinBaum;
        rechts : tRefBinBaum
    end;

var 
    wurzel : tRefBinBaum; 


procedure BBKnotenEinfuegen (
                inZahl : integer;
                var ioRefWurzel : tRefBinBaum);
{ fuegt in den Suchbaum, auf dessen Wurzel ioRefWurzel
zeigt, ein Blatt mit Wert inZahl an }
    var
        RefSohn,
        RefVater : tRefBinBaum;
        gefunden : boolean;
begin
    RefSohn := ioRefWurzel;
    gefunden := false;
    
    while (RefSohn <> nil) and (not gefunden) do
        begin
            if RefSohn^.info = inZahl then
                gefunden := true
            else
            begin
                RefVater := RefSohn;
                if inZahl < RefSohn^.info then
                    RefSohn := RefSohn^.links
                else
                    RefSohn := RefSohn^.rechts
            end
        end; { while }
    
    if not gefunden then
    { neuen Knoten anlegen }
    begin
        new (RefSohn);
        RefSohn^.info := inZahl;
        RefSohn^.links := nil;
        RefSohn^.rechts := nil;
        { neu angelegten Knoten einfuegen }
        if ioRefWurzel = nil then
        { Baum war leer, neue Wurzel zurueckgeben }
            ioRefWurzel := RefSohn
        else
            if inZahl < RefVater^.info then
            { Sohn links anhaengen }
                RefVater^.links := RefSohn
            else
            { Sohn rechts anhaengen }
                RefVater^.rechts := RefSohn
    end
end; { BBKnotenEinfuegen }


procedure BBAufbauen (var outRefWurzel : tRefBinBaum);
{ baut fuer eine Eingabe von integer-Zahlen <> 0 einen
Suchbaum auf und gibt einen Zeiger auf dessen Wurzel
in outRefWurzel zurueck }
var
    Zahl : integer;
begin
    { outRefWurzel mit leerem Baum initialisieren }
    outRefWurzel := nil;
    readln (Zahl);

    while Zahl <> 0 do
        begin
            BBKnotenEinfuegen (Zahl, outRefWurzel);
            readln (Zahl)
        end
end; { BBAufbauen }


procedure BBHauptreihenfolge (inRefWurzel : tRefBinBaum);
{ durchlaeuft rekursiv in Hauptreihenfolge die Knoten
des Binaerbaumes, auf dessen Wurzel inRefWurzel
zeigt }
begin
    if inRefWurzel <> nil then
    begin
    { betrachte die Wurzel, d.h. fuehre die
    problemabhaengigen Arbeitsschritte fuer
    die Wurzel aus }
        writeln(inRefWurzel^.info); 
        BBHauptreihenfolge (inRefWurzel^.links);
        BBHauptreihenfolge (inRefWurzel^.rechts)

    end
end; { BBHauptreihenfolge }

procedure SymAusgabeA (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
     write (inRefWurzel^.info);
     if inRefWurzel^.links <> nil  then
       SymAusgabeA(inRefWurzel^.links);
     if inRefWurzel^.rechts <> nil then
       SymAusgabeA(inRefWurzel^.rechts)
  end
end; {SymAusgabe}

procedure SymAusgabeB (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel^.links <> nil  then
    SymAusgabeB(inRefWurzel^.links);
  write(inRefWurzel^.info);
  if inRefWurzel^.rechts <> nil then
    SymAusgabeB(inRefWurzel^.rechts)
end; {SymAusgabe}

procedure SymAusgabeC (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    SymAusgabeC(inRefWurzel^.links);
    write (inRefWurzel^.info);
    SymAusgabeC(inRefWurzel^.rechts)
  end
end; {SymAusgabe}

procedure SymAusgabeD (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabeD(inRefWurzel^.links);
    if inRefWurzel^.rechts <> nil then
      SymAusgabeD(inRefWurzel^.rechts);
  write (inRefWurzel^.info)
  end
end; {SymAusgabe}

procedure SymAusgabeE (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabeE(inRefWurzel^.links);

    write (inRefWurzel^.info);
    if inRefWurzel^.rechts <> nil then
      SymAusgabeE(inRefWurzel^.rechts)
  end
end; {SymAusgabe}

begin
    BBAufbauen(wurzel);

    writeln('lettura principale: '); 
    BBHauptreihenfolge(wurzel);

    write('A'); 
    SymAusgabeA(wurzel);
    writeln();
    write('B'); 
    SymAusgabeB(wurzel);
    writeln();
    write('C'); 
    SymAusgabeC(wurzel);
    writeln();
    write('D'); 
    SymAusgabeD(wurzel);
    writeln();
    write('E'); 
    SymAusgabeE(wurzel);
    writeln();

end.