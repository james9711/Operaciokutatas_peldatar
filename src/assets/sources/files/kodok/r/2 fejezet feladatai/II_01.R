#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 1. feladat - Homokbányászat.
# 
#***********************************************************************************

library(lpSolveAPI)

#2 darab döntési változó van.
lpmodel<-make.lp(0,2)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(130000,160000))

#Adjuk meg a feltételeket a homok fajtáinak megfelelően.
#Durva
add.constraint(lpmodel, c(3,7), type = ">=", 20)
#Normál
add.constraint(lpmodel, c(5,2), type = ">=", 9)
#Finom
add.constraint(lpmodel, c(6,2), type = ">=", 15)

set.type(lpmodel,1:2,"integer")
#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#580000 ennyi lesz az összköltsége a kitermelésnek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 2 2 -> 2 napot kell az egik gyárban, 2 napot a másik gyárban dolgozni.
#Azaz heti 4 napot kell dolgozni, hogy meglegyen az egy hétre tervezett mennyiség.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************