#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 12. feladat - Pénztárosok alkalmazása.
# 
#***********************************************************************************

library(lpSolveAPI)

#7 darab döntési változó van.
lpmodel<-make.lp(0,7)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,1,1,1,1,1,1))

#Adjuk meg a feltételeket.
#Hétfő
add.constraint(lpmodel, c(1,0,0,1,1,1,1), type = ">=", 21)
#Kedd
add.constraint(lpmodel, c(1,1,0,0,1,1,1), type = ">=", 25)
#Szerda
add.constraint(lpmodel, c(1,1,1,0,0,1,1), type = ">=", 17)
#Csütörtök
add.constraint(lpmodel, c(1,1,1,1,0,0,1), type = ">=", 19)
#Péntek
add.constraint(lpmodel, c(1,1,1,1,1,0,0), type = ">=", 28)
#Szombat
add.constraint(lpmodel, c(0,1,1,1,1,1,0), type = ">=", 26)
#Vasárnap
add.constraint(lpmodel, c(0,0,1,1,1,1,1), type = ">=", 20)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:7,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
# 32 <- 32 pénztárost kell felvennie az áruháznak

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 4 8 3 2 11 2 2  <- Hétfőn kezd 4 pénztáros, kedden 8, ... 

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************