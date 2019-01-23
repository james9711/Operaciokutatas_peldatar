#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 4. feladat
#
# Szobafestés.
# 
#***********************************************************************************

library(lpSolveAPI)

#20 darab döntési változó lesz
lpmodel<-make.lp(0,25)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(46,23,43,79,41,41,21,39,81,43,36,29,41,84,37,39,27,40,81,39,44,31,46,92,48))

#Megadom a feltételeket.
#Egy ember csak egy fázist csinálhat
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "=", 1)
#Egy fázist csak egy ember csinálhat
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = "=", 1)
#Egyéb feltétel (ki mit nem csinálhat)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 0)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0), type = "=", 0)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#228.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) 

solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("András","Béla","Zoltán","Sándor","Olívér"),c("kipakolás","falhiba javítás","alapozás","festés","visszapakolás"))

solution 
#       kipakolás falhiba javítás alapozás festés visszapakolás
#András         0               1        0      0             0
#Béla           0               0        0      1             0
#Zoltán         0               0        1      0             0
#Sándor         0               0        0      0             1
#Olívér         1               0        0      0             0

#228 + 3 óra várakozás -> 408 perc alatt csinálják meg az egész szobát.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************