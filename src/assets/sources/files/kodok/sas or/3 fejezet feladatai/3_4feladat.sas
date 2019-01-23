/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 4. feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
    var y integer;

	/*Feltételek definiálása*/
	con F1: 4*x + 3*y >= 8;
	con F2: 2*x - 3*y >= 2;
	con F3: x <= 5;
	con F4: y >= 1;

    /*Maximalizációs célfv. meghatározása*/
	max z = 2*x - 4*y; /*6*/

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x; /*5*/
	print y; /*1*/
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;