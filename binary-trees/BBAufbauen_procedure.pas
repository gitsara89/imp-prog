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
