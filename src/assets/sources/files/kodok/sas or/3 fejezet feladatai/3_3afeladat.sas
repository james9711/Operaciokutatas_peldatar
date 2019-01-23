/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 3./a feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1:   x +   y <= 6;
	con F2:-2*x + 6*y >  6;
	con F3:-5*x + 3*y <= 15;
	con nonneg:    x >= 0;
	con nonneg2:   y >  0;

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