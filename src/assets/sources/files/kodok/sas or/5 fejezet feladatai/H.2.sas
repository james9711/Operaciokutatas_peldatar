/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 2. feladat - Tilosban parkolás
**********************************************************************************/;

proc optmodel;
    set <str> AUTO = /Auto1, Auto2, Auto3, Auto4/;
    set <str> HELY = /hely1, hely2, hely3, hely4/;
    set UTAK={AUTO, HELY};
    num ktg{UTAK} =[11.3, 4.3, 6.3, 8.4,
                     9.2, 5.1, 7.4, 7.1,
                    10.6, 4.8, 7.1, 8.9,
                     9.8, 3.9, 5.9, 10.2];

    var x{UTAK} >=0 ;

    min obj=sum{i in AUTO, j in HELY} ktg[i,j]*x[i,j];

    con Felt1{i in AUTO}: sum{j in HELY} x[i,j] <= 1;
    con Felt2{j in HELY}: sum{i in AUTO} x[i,j] >= 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;