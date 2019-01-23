/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 2. példa - LP feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 4*x + 3*y >= 7;
	con F2:  -x + 2*y <= 6;
	con F3: 4*x + 6*y <= 36;
	con F4:   x - 2*y <= 4;
	con nonneg:    x >= 0;
	con nonneg2:   y >= 0;

    /*Maximalizációs célfv. meghatározása*/
	max z = 10*x + 4*y; /*68*/

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x; /*6*/
	print y; /*2*/
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;