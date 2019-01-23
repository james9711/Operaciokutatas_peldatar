#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 10. feladat - Csatárigazolás.
# 
#***********************************************************************************

library(lpSolveAPI)

#6 darab döntési változó van.
lpmodel<-make.lp(0,6)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(140000,80000,130000,132000,145000,125000))

#Adjuk meg a feltételeket.
#Cselezés
add.constraint(lpmodel, c(5,1,3,4,3,4), type = ">", 12.7)
#Magasság
add.constraint(lpmodel, c(206,181,175,210,199,211), type = ">", 600)
#Kapura lövés
add.constraint(lpmodel, c(4,2,2,5,3,4), type = ">", 12.4)
#3 játékost kell kiválasztanunk
add.constraint(lpmodel, c(1,1,1,1,1,1), type = "=", 3)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:6,"binary")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#397000 -> Ennyi lesz a 3 új játékos fizetése.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 1 0 0 1 0 1 
#Azaz a három leigazolt játékos: Sándor, Ákos és József.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************