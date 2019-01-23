#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 15. feladat - Utalvány.
# 
#***********************************************************************************

library(lpSolveAPI)

#5 darab döntési változó van.
lpmodel<-make.lp(0,5)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,1,1,1,1))

#Adjuk meg a feltételeket.
#Összesen
add.constraint(lpmodel, c(2000,1500,1000,700,300), type = "=", 17900)
#Minimum 8 darab
add.constraint(lpmodel, c(0,0,1,1,0), type = ">=", 8)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:5,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#14 -> Ennyi darab utalvány kell kiállítania a vezetőnek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
#6 0 1 7 0 -> 6 db 2000-es, 1 db 1000-es és 7 darab 700-as értékű utalványt.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************