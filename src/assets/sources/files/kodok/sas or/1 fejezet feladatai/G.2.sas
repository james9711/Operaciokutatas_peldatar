/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

3. fejezet 7. feladat - Szendvics készítés
x1 - elsõ fajta szendvics 
x2 - második fajta szendvics
**********************************************************************************/

proc optmodel;
    /*Változók*/
	number n;
    var x{1..n} integer;
 	n=2;

	/*Feltételek definiálása*/
	con vaj:     2*x[1] + 1*x[2]   <= 40;
	con sonka:   2*x[1]            <= 60;
	con szalami:        1.5*x[2]   <= 35;
	con sajt:    2*x[1] + 3*x[2]   <= 75;
	con uborka:  1*x[1] + 1*x[2]   <= 35;
   	con nonneg {i in 1..n}:   x[i] >=0;

    /*Maximalizációs célfv. lekérdezése*/
	max z= x[1]+x[2];

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x;
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;