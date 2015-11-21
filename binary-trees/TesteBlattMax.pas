program TesteBlattMax (input, output);

type
  tNatZahl = 1..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               Wert:tNatZahl;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;
           
var
  Wurzel : tRefBinBaum;
  blaetterSindMax : Boolean;
  
function BlattMax ( inRefWurzel : tRefBinBaum; pfadMax : tNatZahl) : Boolean;
  { prüft ob alle Blätter des Baumes die Maxima der Pfade zu ihnen sind }
  { il parametro aggiuntivo è pfadMax all prima aufruf lo inizializiamo ad 1 ossia al valore piu piccolo assegnabile ad un nodo}
  {Der zusaetzliche Uebergabeparameter pfadMax ist beim ersten Aufruf mit dem Wert 1 zu belegen(, weil 1 der kleinste Wert, der ein Knoten bekommen kann, ist)}
  {the smallest acceptable value for a node}

var 
  isMax : Boolean; 

begin
  if (inRefWurzel^.links = nil) and (inRefWurzel^.rechts = nil) then 
    if inRefWurzel^.Wert > pfadMax then 
      BlattMax := true 
    else 
      BlattMax := false
  else 
  begin 
    if inRefWurzel^.Wert > pfadMax then
      pfadMax := inRefWurzel^.Wert; 
    
    if inRefWurzel^.links <> nil then   
      isMax := BlattMax(inRefWurzel^.links, pfadMax);

    if isMax = true then 
      if inRefWurzel^.rechts <> nil then 
        isMax := BlattMax(inRefWurzel^.rechts, pfadMax);

    BlattMax := isMax;
  end;
end; 

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
            if RefSohn^.Wert = inZahl then
                gefunden := true
            else
            begin
                RefVater := RefSohn;
                if inZahl < RefSohn^.Wert then
                    RefSohn := RefSohn^.links
                else
                    RefSohn := RefSohn^.rechts
            end
        end; { while }
    
    if not gefunden then
    { neuen Knoten anlegen }
    begin
        new (RefSohn);
        RefSohn^.Wert := inZahl;
        RefSohn^.links := nil;
        RefSohn^.rechts := nil;
        { neu angelegten Knoten einfuegen }
        if ioRefWurzel = nil then
        { Baum war leer, neue Wurzel zurueckgeben }
            ioRefWurzel := RefSohn
        else
            if inZahl < RefVater^.Wert then
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
        write(inRefWurzel^.Wert); 
        write(' L '); 
        BBHauptreihenfolge (inRefWurzel^.links);
        write(' R '); 
        BBHauptreihenfolge (inRefWurzel^.rechts)

    end
end; { BBHauptreihenfolge }

procedure BaumAufbauen (var outWurzel : tRefBinBaum) ;
  var 
    index,
    Zahl : integer;
    elter, neuerKnoten : tRefBinBaum;    
     
  function KnotenVonIndex (baum : tRefBinBaum; index : integer) : tRefBinBaum;
    var
      elter : tRefBinBaum;
    begin
      if (index = 1) then
        KnotenVonIndex := baum
      else
      begin
        elter := KnotenVonIndex(baum, index div 2);
        if ( (index mod 2 ) = 0 ) then
          KnotenVonIndex := elter^.links
        else
          KnotenVonIndex := elter^.rechts
      end;
    end;

  begin
    read (index);

    new (outWurzel);
    read (Zahl);
    outWurzel^.Wert := Zahl;

    read (index);
    while (index <> 0) do
    begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
       
      writeln('elter : ', elter^.Wert);

      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  

      if ( (index mod 2 ) = 0 ) then
      begin
        writeln('adding left : ', neuerKnoten^.Wert);
        elter^.links := neuerKnoten
        end
      else
      begin
        writeln('adding right : ', neuerKnoten^.Wert);
        elter^.rechts := neuerKnoten;
           end; 
      read (index);      
    end;    
  end; { BaumAufbauen }



begin
  writeln('Bitte Baum in level-order eingeben Eingabeformat: Immer erst der Index eines Knotens, dann dessen Wert:');
  BaumAufbauen (Wurzel);
  
  writeln('albero: ');
  BBHauptreihenfolge(Wurzel); 
  writeln(); 


  blaetterSindMax := BlattMax(Wurzel, 1);
  
  if blaetterSindMax then
    writeln ('Alle Blaetter sind groesser als alle Knoten auf den jeweiligen Pfaden zu ihnen.')
  else
    writeln ('Mind. ein Blatt ist nicht groesser als alle Knoten auf seinem Pfad.');

end. { TesteBBKnotenzahl }