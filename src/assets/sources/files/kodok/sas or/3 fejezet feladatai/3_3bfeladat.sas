/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 3./b feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 2*x +   y > -2;
	con F2:   x + 6*y <= 4;
	con F3: 4*x - 2*y <= 4;
	con nonneg: x < 0;

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