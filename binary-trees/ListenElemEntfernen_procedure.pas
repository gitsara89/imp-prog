// Wir geben eine rekursive Prozedur für das Entfernen eines Elementes aus einer Lis-
// te an. Die entsprechende iterative Prozedur finden Sie als Beispiel 5.4.2.5 . Die fol-
// gende Prozedur zeigt eindrucksvoll, wie eine rekursive Lösung die
// Programmkomplexität drastisch reduzieren kann.

procedure ListenElemEntfernen (
                inZahl : integer;
                var ioRefAnfang : tRefListe;
                var outGefunden : boolean);
{ entfernt aus einer Liste mit Anfangszeiger
ioRefAnfang das Element mit dem Wert inZahl, bei
erfolgreicher Entfernung wird outGefunden auf true
gesetzt, sonst auf false }
var
    Zeiger : tRefListe;
    gefunden : boolean;6. Programmierkonzepte orientiert an Pascal (Teil 4)
begin
    if ioRefAnfang = nil then
        gefunden := false
    else
        if ioRefAnfang^.info = inZahl then
    { Element gefunden, also entfernen }
            begin
                Zeiger := ioRefAnfang;
                ioRefAnfang := ioRefAnfang^.next;
                dispose (Zeiger);
                gefunden := true
            end
        else
    { Element noch nicht gefunden, es folgt das
    rekursive Durchsuchen des Listenrestes }
            ListenElemEntfernen
            (inZahl, ioRefAnfang^.next, gefunden);
            outGefunden := gefunden
end; { ListenElemEntfernen }


// Beachten Sie, dass ioRefAnfang nur verändert wird, falls das erste Listenele-
// ment entfernt wird. Bei dem rekursiven Aufruf (und bei den folgenden rekursiven
// Aufrufen) wird ioRefAnfang nicht verändert, denn es wird mit ioRefAn-
// fang^.next und nicht mit ioRefAnfang aufgerufen.
