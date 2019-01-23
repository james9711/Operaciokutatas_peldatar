#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 4. feladat - Whisky főzés.
# 
#***********************************************************************************

library(lpSolveAPI)

#3 darab döntési változó van.
lpmodel<-make.lp(0,3)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(300,700,480))

#Adjuk meg a feltételeket.
#Kukorica
add.constraint(lpmodel, c(1,3,1.3), type = "<=", 1500)
#Búza
add.constraint(lpmodel, c(1,1,5), type = "<=", 3000)
#Árpa
add.constraint(lpmodel, c(1.4,0.8,1.6), type = "<=", 2000)
#Lepárlóüst kapacitása
add.constraint(lpmodel, c(1,1,1), type = "<=", 1500)
#35 fokos minimum
add.constraint(lpmodel, c(0,1,1), type = ">=", 500)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#40700 forint lesz a haszna a játékgyárnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 27 48 22 -> Ennyit gyártunk a macikból külön-külön.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************