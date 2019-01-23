#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 14. feladat - Gabonapehely.
# 
#***********************************************************************************

library(lpSolveAPI)

#2 darab döntési változó van.
lpmodel<-make.lp(0,2)

#Állítsuk be a modellt minimalizációra.
lp.control(lpmodel,sense='min')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(500,850))

#Adjuk meg a feltételeket.
#Csoki
add.constraint(lpmodel, c(20,50), type = ">=", 40)
#Méz
add.constraint(lpmodel, c(40,15), type = "<=", 20)
#Aránnyal dolgozunk, azaz a gabonapelyhek arányainak összege 1.
add.constraint(lpmodel, c(1,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#780 -> Ennyibe kerül a 100 gramm gabonapehely előállítása a két csomagot felhasználva.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
#0.2 0.8 -> 20%-ban az első, 80%-ban a második csomagot kell kevernünk.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************