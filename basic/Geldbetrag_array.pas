program Geldbetrag_FOR(input, output);

type
	tIndex = 1..6;
	tCoin = array [tIndex] of Integer;
	tOutIndex = 1..6;
	tOutCoin = array [tOutIndex] of Integer;

var
	CentBetrag: Integer;
	i: tIndex;
	Coin: tCoin;
	j: tOutIndex;
	OutCoin: tOutCoin;


begin
	Coin[1] := 50;
	Coin[2] := 20;
	Coin[3] := 10;
	Coin[4] := 5;
	Coin[5] := 2;
	Coin[6] := 1;


writeln('Centbetrag eingeben  ');
	readln (CentBetrag);

i:=1;
j:=1; 

while CentBetrag > 0 do
	begin 
	if (CentBetrag >= Coin[i]) then
		begin
		OutCoin[j]:=1;
		Centbetrag := (CentBetrag - Coin[i]);
		//Writeln('here', CentBetrag, j:4, i:4, Coin[i]:4);

		if (CentBetrag >= Coin[i]) then
			begin
			OutCoin[j]:=2;
			Centbetrag := CentBetrag - Coin[i] ;
			i:= (i+1);
			j:= j+1;
			//Writeln('here2', CentBetrag, j:4, OutCoin[j]:4,  i:4);
			end

		else
			begin
			i:= (i+1);
			j:= j+1;
			//Writeln('here', CentBetrag, j:4, i:4);
			end;

		end;
	
	for j := 1 to 6 do
		writeln (OutCoin[j]);
end;

end.

