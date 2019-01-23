/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 2./a feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 3*x + 2*y <= 4;
	con F2:   x -   y <= 2;
	con F3: 2*x -   y >= 3;
	con nonneg:    x >= 0;
	con nonneg2:   y >= 0;

    /*Maximalizációs célfv. meghatározása*/
	max z= x + y ;

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x;
	print y;
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;