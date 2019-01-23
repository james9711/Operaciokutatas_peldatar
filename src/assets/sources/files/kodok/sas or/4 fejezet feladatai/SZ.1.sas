/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 1. feladat - RailCargo Hungaria
**********************************************************************************/;

proc optmodel;
    set <str> TELEPHELY = /ZÁH, BÉK, SZE/;
    set <str> UZEM = /SZÉKESF, KAPOSVÁR, NAGYKA, GYÕR/;
    set UTAK = {TELEPHELY, UZEM};
    num kap{TELEPHELY} = [10, 19, 11];
    num igeny{UZEM} =[11,6,14,9];
    num ktg{UTAK} =[10000,21000,17000,13000,
                    20000,11000,16000,24000,
                    13000,15000,21000,30000];
    var x{UTAK} >=0 ;

    min obj=sum{i in TELEPHELY, j in UZEM} ktg[i,j]*x[i,j];

    con KapFelt{i in TELEPHELY}:  sum{j in UZEM} x[i,j]      <= kap[i];
    con IgenyFelt{j in UZEM}:     sum{i in TELEPHELY} x[i,j] >= igeny[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;