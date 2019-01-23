/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 8.a feladat - Napló
**********************************************************************************/;

proc optmodel;
    set <str> NYOMDA = /NY1, NY2, NY3/;
    set <str> BOLT =/B1, B2, B3, B4/;
    set UTAK={NYOMDA, BOLT};
    num kap{NYOMDA} = [250, 150, 190];
    num igeny{BOLT} = [150, 195, 120, 125];
    num ktg{UTAK} =[2,4,2,1,
                    3,3,5,2,
                    4,4,1,3];

    var x{UTAK} >=0 ;

    min obj=sum{i in NYOMDA, j in BOLT} ktg[i,j]*x[i,j];

    con kapFelt{i in NYOMDA}:  sum{j in BOLT} x[i,j] <= kap[i];
    con igenyFelt{j in BOLT}:sum{i in NYOMDA} x[i,j] >= igeny[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;


