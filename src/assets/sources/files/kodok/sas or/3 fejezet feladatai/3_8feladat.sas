/*********************************************************************************
Cím... Operációkutatás szoftveres példatár

3. fejezet 8. feladat - Sós és édes süti rendelés 
x1 - édes sütemény
x2 - sós sütemény
**********************************************************************************/;

proc optmodel;
    /*Változók*/
	var x1 integer;
    var x2 integer;

	/*Feltételek definiálása*/
	con liszt:    0.6*x1 +      x2  <= 15;
	con élesztõ: 0.05*x1 + 0.08*x2  <= 1;
	con cukor:    0.3*x1 + 0.02*x2  <= 2;
	con celfv:   2000*x1 + 1500*x2  <= 25000;
	con nonneg:  x1 >= 5;
	con nonneg2: x2 >= 6;

    /*Maximalizációs célfv. lekérdezése*/
	max z = 2000*x1 + 1500*x2; /*24000*/

    /*A felépített modell megoldása*/
	solve;

    /*A változók értékének a lekérdezése*/
	print x1; /*6*/
	print x2; /*8*/
	
run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 							2016
**********************************************************************************/;