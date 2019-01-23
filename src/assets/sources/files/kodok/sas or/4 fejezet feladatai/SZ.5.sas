/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 5. feladat - Csekkfeldolgozás
**********************************************************************************/;

proc optmodel;
    set <str> CSEKKEK = /Eladói, Fizetési, Személyi/;
    set <str> IRODA =/I, II, III/;
    set FELDOLGOZAS={CSEKKEK, IRODA};
    num erkezik{CSEKKEK} = [6000,7200,6000];
    num hetente{IRODA} =[8500,6100,4600];
    num ktg{FELDOLGOZAS} =[100,120,110,
                            90, 95, 80,
                           100, 90, 85];

    var x{FELDOLGOZAS} >=0 ;

    min obj=sum{i in CSEKKEK, j in IRODA} ktg[i,j]*x[i,j];

    con erkezikFelt{i in CSEKKEK}: sum{j in IRODA} x[i,j]    = erkezik[i];
    con hetenteFelt{j in IRODA}:   sum{i in CSEKKEK} x[i,j] <= hetente[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;