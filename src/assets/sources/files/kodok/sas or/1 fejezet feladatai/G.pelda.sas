/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

1. fejezet 1. példa - Bútorgyártás
x1 - szekrény: hány darab szekrényt gyártunk 1 év alatt 
x2 - asztal:   hány darab asztalt gyártunk 1 év alatt
**********************************************************************************/

proc optmodel;
    /*Változók*/
	number n;
    var x{1..n} integer;
 	n=2;

	/*Feltételek definiálása*/
	con munka:   10*x[1] + 15*x[2] <= 1300,
	    butorlap: 5*x[1] +  3*x[2] <= 400 ,
	    asztal:               x[2] <= 70  ,
   	    nonneg {i in 1..n}:   x[i] >=0;

    /*Maximalizációs célfv. meghatározása*/
	max z= (100000-25000)*x[1] + (75000-20000)*x[2] ;  /*6550000*/

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/