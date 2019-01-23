/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

1. fejezet 4. feladat - Jones farmer
**********************************************************************************/

proc optmodel;
    /*Változók*/
    number n;
    var x{1..n};
 	n= 2;
    con nonneg {i in 1..n}: x[i] >=0;

    /*Feltételek definiálása*/
   	con Sutes: 20*x[1] + 40*x[2] <= 480,
		Tojas:  4*x[1] +    x[2] <= 30;

    /*Maximalizációs célfv. lekérdezése*/
	MAX z = x[1] + 0.5*x[2];

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
	print x;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/