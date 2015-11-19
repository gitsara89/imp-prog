program Geldbetrag(input, output);
{Der Program gibt für einen einzulesenden Geldbetrag in Euro aus, wie dieser Betrag auf möglichst wenige Geldmünzen(1, 2, 5, 10, 20, 50 Cent) verteilt wird}

var
	CentBetrag: Integer;
	a, b, c, d, e, f : Integer;

begin
	write('Centbetrag eingeben  ');
	readln (CentBetrag);


if (Centbetrag <= 99) and (CentBetrag >=50) then
	begin
	a := 1;
	CentBetrag := (CentBetrag - 50 );
	// writeln('here a', CentBetrag:4);
	end;

if (CentBetrag < 50) and (CentBetrag >= 20) then
	begin
	b := 1;
	CentBetrag := (CentBetrag - 20 );
	// writeln('here b', CentBetrag:4);
	if (CentBetrag >= 20) then
		begin
		b := 2;
		CentBetrag := (CentBetrag - 20 );
		// writeln('here b', CentBetrag:4);
		end;
	// else
	// 	CentBetrag := CentBetrag;
	// 	writeln('here b else', CentBetrag:4);

	end;

// writeln('here b', CentBetrag:4);
if (CentBetrag < 20) and (CentBetrag >= 10) then
	begin
	c := 1;
	CentBetrag := (CentBetrag - 10 );
	// writeln('here c');
	end;


if (CentBetrag < 10) and (CentBetrag >= 5) then
	begin
	d := 1;
	CentBetrag := (CentBetrag - 5 );
	// writeln('here d');
	end;


if (CentBetrag < 5) and (CentBetrag >= 2) then
	begin
	e := 1;
	CentBetrag := (CentBetrag - 2 );
	if (CentBetrag >= 2) then
		begin
		e := 2;
		CentBetrag := (CentBetrag - 2 );
		end;
	end;


if (CentBetrag < 2) and (CentBetrag >= 1) then
	f := 1;

writeln ( 'Ergebnis: ', a:2, b:2, c:2, d:2, e:2, f:2 );


end.
