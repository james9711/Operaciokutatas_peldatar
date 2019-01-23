/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

1. fejezet 5. feladat - Bútorgyár asztalok
**********************************************************************************/

proc optmodel;
    /*Változók*/
    number n;
    var x{1..n} >= 0;
 	n= 2;

    /*Feltételek definiálása*/
    con Profit: x[1] + 2*x[2] >= 6, 
		Fpor:  -x[1] +   x[2] <= 3,
		Rag:    x[1] +   x[2] <= 10;

    /*Maximalizációs célfv. lekérdezése*/
	MAX z = 2*x[1] - 3*x[2];

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
	print x;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/