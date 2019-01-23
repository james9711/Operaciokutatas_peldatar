#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 8. feladat - Könyvkiadó.
# 
#***********************************************************************************

library(lpSolveAPI)

#4 darab döntési változó van.
lpmodel<-make.lp(0,4)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(340,440,380,380))

#Adjuk meg a feltételeket.
add.constraint(lpmodel, c(1,0,0,0), type = "<=", 140)
add.constraint(lpmodel, c(0,1,0,0), type = "<=", 106)
add.constraint(lpmodel, c(0,0,1,0), type = "<=", 92)
add.constraint(lpmodel, c(0,0,0,1), type = "<=", 112)
#Összesen
add.constraint(lpmodel, c(1,1,1,1), type = "<=", 350)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#63400 -> Ennyi lesz a haszna az üzemnek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 44 35 2 -> 1.terítőből 44 darabot, 2-ból 35 darabot, 3-ból 2 darabot kell készíteni.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************