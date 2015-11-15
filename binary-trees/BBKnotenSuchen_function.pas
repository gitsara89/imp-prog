program KnotenSuchen (input, output);








function BBKnotenSuchen (
    inZahl : integer;
    inRefWurzel : tRefBinBaum): tRefBinBaum;
{ liefert fuer den Suchbaum, auf dessen Wurzel
inRefWurzel zeigt, den Zeiger auf den Knoten,
dessen Wert gleich inZahl ist }
var
    Zeiger : tRefBinBaum;
    gefunden : boolean;
begin
    Zeiger := inRefWurzel;
    gefunden := false;
    while (Zeiger <> nil) and not gefunden do
        begin
            if inZahl = Zeiger^.info then
                gefunden := true
            else { nicht gefunden, daher links oder rechts
                weitermachen }
            if inZahl < Zeiger^.info then
                Zeiger := Zeiger^.links
            else
                Zeiger := Zeiger^.rechts
            end; { while }
    { Jetzt gilt Zeiger = nil oder gefunden = true.
    Falls gefunden = true, zeigt Zeiger auf den Knoten
    mit info-Komponente = inZahl, andernfalls hat
    Zeiger den Wert nil }
    BBKnotenSuchen := Zeiger
end; { BBKnotenSuchen }




begin

end.