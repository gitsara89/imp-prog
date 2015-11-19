program Matrix (input, output);
{ gibt die Zeilen- und Spaltensumme einer
3x4 Matrix von integer-Zahlen aus }

const
	ZEILENMAX = 3;
	SPALTENMAX = 4;

type
	tZeile = 1..ZEILENMAX;
	tSpalte = 1..SPALTENMAX;
	tMatrix = array [tZeile, tSpalte] of integer;
	tZeilensumme = array [tZeile] of integer;
	tSpaltensumme = array [tSpalte] of integer;
var
	Eingabe: Integer;
	A : tMatrix;
	B : tZeilensumme;
	C : tSpaltensumme;
	i : tZeile;
	j : tSpalte;

begin
{ Lesen der Matrixwerte in A }
	for i := 1 to ZEILENMAX do
		for j := 1 to SPALTENMAX do
		readln (A[i, j]);

repeat 
	write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX, ') (anderes = Ende) ');
 	readln (Eingabe); 

if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then 
		begin 
{ Berechnen der Zeilensumme in B }
			i := Eingabe; 
			

			B[i] := 0;
			for j := 1 to SPALTENMAX do
				B[i] := B[i] + A[i, j]
		end;
{ Berechnen der Spaltensumme in C }
	for j := 1 to SPALTENMAX do
		begin
			C[j] := 0;
			for i := 1 to ZEILENMAX do
				C[j] := C[j] + A[i, j];
		end;

{ Drucken von A, B und C in geeigneter Form }
	writeln;
	for i := 1 to ZEILENMAX do
		begin
			for j := 1 to SPALTENMAX do
				write (A[i, j]:5);
			writeln (B[i]:10);
		end;

	writeln;
	for j := 1 to SPALTENMAX do
		writeln (C[j]:5);


	if C[j] < B[i] then
		writeln('vero')
	else
		writeln('falso');



until (Eingabe <= 0) or (Eingabe > ZEILENMAX);	
	
	writeln;

end. { Matrix }