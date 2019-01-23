#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 9. feladat - Kanapégyártás.
# 
#***********************************************************************************

library(lpSolveAPI)

#4 darab döntési változó van.
lpmodel<-make.lp(0,4)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(14000,15500,13000,12500))

#Adjuk meg a feltételeket.
#Bőr
add.constraint(lpmodel, c(10,14,0,0), type = "<=", 250)
#Szövet
add.constraint(lpmodel, c(2,3,14,12), type = "<=", 350)
#Fa
add.constraint(lpmodel, c(25,22,19,18), type = "<=", 1000)
add.constraint(lpmodel, c(3,4,2,2.5), type = "<=", 200)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:4,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#632000 -> Ennyi lesz az árbevétele a vállalatnak a kanapékból.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 18 5 5 19 -> A különböző kanapéfajtákból ennyit kell készíteni.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************