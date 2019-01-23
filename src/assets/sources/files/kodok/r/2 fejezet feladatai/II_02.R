#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 2. feladat - Takarmányozás.
# 
#***********************************************************************************

library(lpSolveAPI)

#2 darab döntési változó van.
lpmodel<-make.lp(0,2)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1500,1800))

#Adjuk meg a feltételeket.
#Kukorica
add.constraint(lpmodel, c(600,700), type = ">=", 4000)
#Búza
add.constraint(lpmodel, c(170,60), type = ">=", 1000)
#Zab
add.constraint(lpmodel, c(180,60), type = ">=", 750)
#Árpa
add.constraint(lpmodel, c(50,180), type = ">=", 1250)

set.type(lpmodel,1:2,"integer")
#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#16800 ennyi lesz az összár.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 4 6 -> 4 kg-ot kell vennie az első, 6 kg-ot a második csomagból.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************