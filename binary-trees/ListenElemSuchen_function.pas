// Wir suchen eine Zahl inZahl in einer linearen Liste. Die Situation ist die gleiche
// wie in Beispiel 5.4.2.3, aber jetzt wird die Liste rekursiv durchsucht.


function ListenElemSuchen (
            inRefAnfang : tRefListe;
            inZahl : integer) : tRefListe;
{ bestimmt das erste Element in einer Liste mit214
Kurseinheit IV
Anfangszeiger inRefAnfang, bei dem die info-
Komponente gleich inZahl ist }
var
    Zeiger : tRefListe;
begin
    Zeiger := inRefAnfang;
    if inRefAnfang <> nil then
        if inRefAnfang^.info <> inZahl then
        { nicht gefunden, suche weiter in der Restliste }
        Zeiger := ListenElemSuchen (inRefAnfang^.next, inZahl);
        ListenElemSuchen := Zeiger
end; { ListenElemSuchen }
