/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 1. feladat - Hotel transylvania
**********************************************************************************/;

proc optmodel;
    set <str> SZORNY =    /Rosszcsont, Labcsont, Koponya, Gerincke/;
    set <str> TAKARITAS = /Porszivozas, Rendrakas, Fürdoszoba_takaritas, Agynemucsere/;
    set FELADAT={SZORNY, TAKARITAS};
    num ktg{FELADAT} =[40, 20, 34, 14,
                       35, 18, 28, 10,
                       50, 22, 26, 20,
                       40, 24, 26, 18];

    var x{FELADAT} >=0 ;

    min obj=sum{i in SZORNY, j in TAKARITAS} ktg[i,j]*x[i,j];

    con Felt1{i in SZORNY}:    sum{j in TAKARITAS} x[i,j] <= 1;
    con Felt2{j in TAKARITAS}: sum{i in SZORNY}    x[i,j] >= 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;