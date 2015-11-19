// Schreiben Sie ein PASCAL-Programm, das eine Temperaturangabe in Fahrenheit (F) einliest, 
// den Wert in Celsius (C) umwandelt und auf dem Bildschirm ausgibt. 
// Der Zusammenhang zwischen den Einheiten wird durch die Gleichung
//                              C = [5 * (F - 32)] / 9


program Temperatur (input, output);
{liest eine Temperaturangabe in Fahrenheit ein und gibt eine in Celsius aus}

var
	Fahrenheit: Real;
	Celsius: Real;


begin
	writeln('Fahrenheit Temperatur eingeben: ');
	readln (Fahrenheit);

	Celsius := ((5+(Fahrenheit-32))/9);

	writeln ('Celsius :  ', Celsius:2:2);

end.
