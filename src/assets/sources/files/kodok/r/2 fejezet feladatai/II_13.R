#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 13. feladat - Turmix készítés.
# 
#***********************************************************************************

library(lpSolveAPI)

#6 darab döntési változó van.
lpmodel<-make.lp(0,6)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(50,65,40,70,65,60))

#Adjuk meg a feltételeket.
#A-vitamin
add.constraint(lpmodel, c(20,10,30,10,10,20), type = ">=", 100)
#B-vitamin
add.constraint(lpmodel, c(30,20,30,40,10,20), type = ">=", 100)
#C-vitamin
add.constraint(lpmodel, c(10,10,20,40,50,30), type = ">=", 180)
#Legalább 3 gyümölcsfajta
#add.constraint(lpmodel, c(0,0,0,0,0,0), type = ">=", 15)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:6,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************