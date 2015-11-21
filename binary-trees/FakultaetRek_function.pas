function FakultaetRek (
    inZahl : tNatZahl) : tNatZahl;
{ berechnet die Fakultaet von inZahl >= 0 }
begin
    if inZahl = 0 then { Abbruchbedingung erfuellt }
        FakultaetRek := 1
    else
        FakultaetRek :=
        inZahl * FakultaetRek (inZahl - 1)
end; { FakultaetRek }

//dichiarazioni da fare prima : !!
// type
// tNatZahl = 0..maxint;
// voraussetzen.
//PAGINA 206

//QUESTA ERA UNA REKURSIVE fUNKTION
//segue una ITERATIVE fUNKTION

function FakultaetIt (
inZahl : tNatZahl): tNatZahl;
{ berechnet die Fakultaet von inZahl >= 0 }
var
    i : integer;
    temp : tNatZahl;
begin
    temp := 1;
    for i := 2 to inZahl do
        temp := i * temp;
        FakultaetIt := temp
end; { FakultaetIt }
