/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 4. feladat - Földárverezés
**********************************************************************************/;

proc optmodel;
    set <str> GAZDALKODO = /István, Béla, Pál, Attila, Imre/;
    set <str> FOLD =/I, II, III/;
    set LICIT={GAZDALKODO, FOLD};
    num igeny{GAZDALKODO} = [60, 60, 60, 60, 60];
    num hektar{FOLD} =[100,100,80];
    num ktg{LICIT} =[102,120,130,
                     105,137,125,
                     114,131,121,
                     108,123,113,
                     106,129,121];

    var x{LICIT} >=0 ;

    max obj=sum{i in GAZDALKODO, j in FOLD} ktg[i,j]*x[i,j];

    con igenyFelt{i in GAZDALKODO}: sum{j in FOLD} x[i,j]       <= igeny[i];
    con hektarFelt{j in FOLD}:      sum{i in GAZDALKODO} x[i,j]  = hektar[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;