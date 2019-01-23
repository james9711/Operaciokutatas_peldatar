/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

1. fejezet 3. feladat - Ruházati vállalat
**********************************************************************************/

proc optmodel;
    /*Változók*/
    number n;
    var x{1..n};
 	n= 2;

    /*Feltételek definiálása*/
   	con nonneg {i in 1..n}: x[i] >=0;
	con szab:   x[1] + x[2] <= 40,
		varr: 2*x[1] + x[2] <= 60;

    /*Maximalizációs célfv. lekérdezése*/
	MAX z = 4*x[1] + 3*x[2];

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
	print x;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/