/*********************************************************************************
Operációkutatás szoftveres példatár
I. Grafikusan megoldható feladatok

1. fejezet 6. feladat - Tejgazdaság
**********************************************************************************/

proc optmodel;
    /*Változók*/
    number n;
    var x{1..n};
 	n= 2;

    /*Feltételek definiálása*/
	con HELY: 5*(10+x[1]) + 4*(20+x[2]) <= 160,
		KTG:  5*(10+x[1]) + 3*(20+x[2]) <= 150,
		TEHEN: 	 10+x[1] 				>= 0,
		KECSKE: 			   20+x[2]  >= 0;

    /*Maximalizációs célfv. lekérdezése*/
	MAX z = 10*100*(10+x[1]) + 3*150*(20+x[2]);

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
	print x;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/