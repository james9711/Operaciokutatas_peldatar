#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 1. feladat
#
# RailCargo Hungaria.
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó van.
lpmodel<-make.lp(0,12)

#Állítsuk be minimalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(10000,21000,17000,13000,20000,11000,16000,24000,13000,15000,21000,30000))

#Adjuk meg a feltételeket.
#Gabonaszállítók száma
#Záhony
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 10)
#Békéscsaba
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 11)
#Szeged
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 19)

#Az üzemek igénye
#Székesfehérvár
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0), type = ">=", 11)
#Kaposvár
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0), type = ">=", 6)
#Nagykanizsa
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0), type = ">=", 14)
#Győr
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1), type = ">=", 9)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#585000 lesz a szállítási terv költsége.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("Záhony","Békéscsaba","Szeged"),c("Székesfehérvár","Kaposvár","Nagykanizsa","Győr"))

solution 
#           Székesfehérvár Kaposvár Nagykanizsa Győr
#Záhony                  0        0           1    9
#Békéscsaba              0        0          11    0
#Szeged                 11        6           2    0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
