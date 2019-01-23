/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 11. feladat - Rendelésfelvételi hiba
**********************************************************************************/;

proc optmodel;
    set <str> RAKTAR   = /R1, R2, F1/;
    set <str> RENDELO  =/R1, R2, R3, R4/;
    set UTAK={RAKTAR, RENDELO};
    num kap{RAKTAR}    = [35, 50, 20];
    num igeny{RENDELO} = [30, 26, 25, 24];
    num ktg{UTAK} = [7,8,5,6,
                     9,7,7,8,
                     100,130,105,120];

    var x{UTAK} >=0 ;

    min obj=sum{i in RAKTAR, j in RENDELO} ktg[i,j]*x[i,j];

    con kapFelt{i in RAKTAR}:   sum{j in RENDELO} x[i,j] <= kap[i];
    con igenyFelt{j in RENDELO}:sum{i in RAKTAR}  x[i,j] >= igeny[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;

