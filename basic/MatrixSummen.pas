program MatrixSummen (input, output);
{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

const
ZEILENMAX = 3;
SPALTENMAX = 4;

type
tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

var
	Matrix : tMatrix;
	ZeilenNr,
	SpaltenNr,
	Eingabe : integer;
	Zeilensumme,
	Spaltensumme : Integer;

function ZeilenSummeKleiner (var inMatrix : tMatrix;
                                     inZeilenNr : integer) : boolean;
    { ergibt true, falls die Summe aller Elemente mit dem
      uebergebenen Zeilenindex kleiner ist als jede
      Spaltensumme }
begin
{ Berechnen der Zeilensumme }
	ZeilenNr:=Eingabe;
	Zeilensumme[ZeilenNr] := 0;
	for SpaltenNr := 1 to SPALTENMAX do
		Zeilensumme[ZeilenNr] := Zeilensumme[ZeilenNr] + Matrix[ZeilenNr, SpaltenNr];


	{ Berechnen der Spaltensumme }
		
	for SpaltenNr := 1 to SPALTENMAX do
		begin
			Spaltensumme[SpaltenNr] := 0;
			for ZeilenNr := 1 to ZEILENMAX do
				Spaltensumme[SpaltenNr] := Spaltensumme[SpaltenNr] + Matrix[ZeilenNr, SpaltenNr];
		end;

	
	if Zeilensumme[ZeilenNr] < Spaltensumme[SpaltenNr] then
		ZeilenSummeKleiner := true
	else
		ZeilenSummeKleiner := false;


end; { ZeilenSummeKleiner } 

begin { Matrixelemente einlesen } 
	for ZeilenNr := 1 to ZEILENMAX do 
		for SpaltenNr := 1 to SPALTENMAX do 

			read (Matrix[ZeilenNr, SpaltenNr]); 

repeat 
	write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX, ') (anderes = Ende) ');
 	readln (Eingabe); 

 	if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then 
		begin 
			ZeilenNr := Eingabe; 

{ hier wird die Funktion ZeilenSummeKleiner aufgerufen } 


			if ZeilenSummeKleiner(Matrix,ZeilenNr) then 
				writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
			else 
				writeln ('Es sind nicht alle Spaltensummen groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
		end;
 
until (Eingabe <= 0) or (Eingabe > ZEILENMAX)


end. { MatrixSummen } 