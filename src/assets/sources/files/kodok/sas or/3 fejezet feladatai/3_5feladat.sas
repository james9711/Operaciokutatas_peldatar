/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 5. feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 2*x + 2*y <= 8;
	con F2: 3*x +   y >= 8;
	con F3: 2*x <= 6;
	con F4:   y <= 3;

    /*Maximalizációs célfv. meghatározása*/
	min z = 2*x + 3*y; /*3*/

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x; /*3*/
	print y; /*-1*/
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;