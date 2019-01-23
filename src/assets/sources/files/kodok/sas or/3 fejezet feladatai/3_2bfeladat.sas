/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 2./b feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 4*x + 14*y >= 14;
	con F2:   x -  4*y <= 14;
	con F3: 4*x +  3*y <= 15;
	con F4:-11*x + 5*y >= 55;

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