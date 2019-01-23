/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 6. feladat
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x integer;
        var y integer;

	/*Feltételek definiálása*/
	con F1: -x +   y <= 1;
	con F2:  x - 2*y >= -4;
	con F3: x >= 0;
	con F4: y >= 0;

    /*Maximalizációs célfv. meghatározása*/
	max z = x + y;

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x;
	print y;
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;