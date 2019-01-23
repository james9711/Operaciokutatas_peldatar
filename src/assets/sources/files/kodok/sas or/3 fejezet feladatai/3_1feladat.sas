/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 1. feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 2*x + 3*y <= 6;
	con F2:   x -   y <= 1;
	con nonneg:    x >= 0;
	con nonneg2:   y >= 0;

    /*Maximalizációs célfv. meghatározása*/
	max z= x + y ;  /*2*/

    /*A felépített modell megoldása*/
	solve;

	/*A változók értékének a lekérdezése*/
	print x; /*1*/
	print y; /*1*/
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 				       			2016
**********************************************************************************/;