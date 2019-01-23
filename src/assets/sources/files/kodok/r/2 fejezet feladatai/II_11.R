#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 11. feladat - Rendőrőrs.
# 
#***********************************************************************************

library(lpSolveAPI)

#6 darab döntési változó van.
lpmodel<-make.lp(0,6)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,1,1,1,1,1))

#Adjuk meg a feltételeket.
#0-4
add.constraint(lpmodel, c(1,0,0,0,0,1), type = ">=", 7)
#4-8
add.constraint(lpmodel, c(1,1,0,0,0,0), type = ">=", 11)
#8-12
add.constraint(lpmodel, c(0,1,1,0,0,0), type = ">=", 10)
#12-16
add.constraint(lpmodel, c(0,0,1,1,0,0), type = ">=", 15)
#16-20
add.constraint(lpmodel, c(0,0,0,1,1,0), type = ">=", 16)
#20-24
add.constraint(lpmodel, c(0,0,0,0,1,1), type = ">=", 13)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:6,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#39 -> 39 rendőrrel lehet ezt megoldani.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 11  0 12  3 13  0 <- Ennyien kezdenek az adott időben. 
#Pl. 0-4 óra -> 11 rendőr kezdi el a munkaidejét 0 órakor.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************