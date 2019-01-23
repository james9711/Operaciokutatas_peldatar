#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 5. feladat - Autógyártás.
# 
#***********************************************************************************

library(lpSolveAPI)

#3 darab döntési változó van.
lpmodel<-make.lp(0,3)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(2.1,2.6,3))

#Adjuk meg a feltételeket.
#1. gép
add.constraint(lpmodel, c(100,60,75), type = "<=", 40*60)
#2. gép
add.constraint(lpmodel, c(80,50,55), type = "<=", 40*60)
#Acél
add.constraint(lpmodel, c(1.4,2.3,2.5), type = "<=", 50)
#Bőr
add.constraint(lpmodel, c(50,35,40), type = "<=", 1600)
#Műanyag
add.constraint(lpmodel, c(45,40,35), type = "<=", 2000)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#65.8 millió forint lesz a árbevétele az autógyárnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 16 2 9 -> 16 Hatchback-et, 2 Sedan-t és 9 Kombit kell gyártani.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************