    procedure BBHauptIter (inRefWurzel : tRefBinBaum);
    { durchlaeuft iterativ in Hauptreihenfolge die Knoten
    des Binaerbaumes, auf dessen Wurzel inRefWurzel
    zeigt }
    { zuerst die Typdefinitionen und Operationen fuer
    den Stapel, in dem Zeiger auf Knoten des Baumes
    gestapelt werden }
    type
        tRefStack = ^tStack;
        tStack = record
                    Zeiger : tRefBinBaum;
                    next : tRefStack
                end;
    var
        RefStackAnf : tRefStack;{ Zeiger auf Stapelanfang }
        Zeiger : tRefBinBaum;

    procedure push (
        inZeiger : tRefBinBaum;
        var ioRefStackAnf : tRefStack);
{ legt den Knotenzeiger inZeiger auf dem Stapel mit
Anfangszeiger ioRefStackAnf ab }
    var
        RefNeu : tRefStack;
    begin
        new (RefNeu);
        RefNeu^.Zeiger := inZeiger;
        RefNeu^.next := ioRefStackAnf;
        ioRefStackAnf := RefNeu
    end; { push }

    function top (
            inRefStackAnf : tRefStack) : tRefBinBaum;
    { liefert das oberste Stapelelement eines nicht-
    leeren Stapels mit Anfangszeiger inRefStackAnf }
    begin
        top := inRefStackAnf^.Zeiger
    end; { top }

    procedure pop (var ioRefStackAnf : tRefStack);
    { entfernt aus einem nichtleeren Stapel mit
    Anfangszeiger ioRefStackAnf das oberste Element }
    var
        RefLoesch : tRefStack;
    begin
        RefLoesch := ioRefStackAnf;
        ioRefStackAnf := ioRefStackAnf^.next;
        dispose (RefLoesch)
    end; { pop }

    function isempty (
        inRefStackAnf : tRefStack) : boolean;
    { liefert true, falls der Stapel mit Anfangszeiger
    inRefStackAnf leer ist, sonst false }
    begin
        isempty := (inRefStackAnf = nil)
    end; { isempty }

begin
    RefStackAnf := nil; { leeren Stapel initialisieren }
    if inRefWurzel <> nil then
    { Baum ist nicht leer; Wurzel stapeln }
    push (inRefWurzel, RefStackAnf);
    while not isempty (RefStackAnf) do
    begin { naechste Wurzel aus dem Stapel holen und
    entfernen }
        Zeiger := top (RefStackAnf);
        pop (RefStackAnf);
        { jetzt koennte der Knotenwert z.B. durch
        write (Zeiger^.info, ' ');
        ausgegeben werden }
        if Zeiger^.rechts <> nil then
        { rechten Nachfolger stapeln }
            push (Zeiger^.rechts, RefStackAnf);
        if Zeiger^.links <> nil then225
            { linken Nachfolger stapeln }
            push (Zeiger^.links, RefStackAnf)
    end
end; { BBHauptIter }
