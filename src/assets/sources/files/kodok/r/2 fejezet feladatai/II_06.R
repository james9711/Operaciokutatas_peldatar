#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 6. feladat - Tanárfelvétel.
# 
#***********************************************************************************

library(lpSolveAPI)

#8 darab döntési változó van.
lpmodel<-make.lp(0,8)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(127,130,150,133,100,126,152,80))

#Adjuk meg a feltételeket.
#Fizika
add.constraint(lpmodel, c(1,0,1,0,0,0,1,0), type = ">=", 1)
#Földrajz
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0), type = ">=", 1)
#Kémia
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0), type = ">=", 1)
#Testnevelés
add.constraint(lpmodel, c(0,1,0,0,1,0,0,0), type = ">=", 1)
#Matematika
add.constraint(lpmodel, c(1,0,1,0,0,1,0,0), type = ">=", 1)
#Magyar
add.constraint(lpmodel, c(0,0,0,1,1,0,0,0), type = ">=", 1)
#Angol
add.constraint(lpmodel, c(0,1,0,1,0,0,0,1), type = ">=", 2)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:8,"binary")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#413 -> 413 ezer forint lesz az újonnan felvett tanárok fizetése.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 0 1 1 1 0 0 0 0 -> Jánost, Évát és Erikát kell felvennünk.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************