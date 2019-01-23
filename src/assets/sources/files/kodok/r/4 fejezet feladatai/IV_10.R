#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 10. feladat
#
# Tejszállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó van.
lpmodel<-make.lp(0,12)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(7,3,4,4,2,4,6,5,4,5,3,3))

#Adjuk meg a feltételeket (a jobb oldali érték mindig a bocik összes tejleadása szerepel)
#Termelői feltételek
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 35)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 80)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 20)

#Boltok igényei
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0), type = ">=", 32)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0), type = ">=", 24)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0), type = ">=", 43)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1), type = ">=", 36)

#Az 1. bolt nem kér tejet a 2. termelőtől

add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,0,0,0), type = "=", 0)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel) # 480 lesz a szállítás költsége.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("Termelő1","Termelő2","Termelő3"),c("Bolt1","Bolt2","Bolt3","Bolt4"))

solution 
#         Bolt1 Bolt2 Bolt3 Bolt4
#Termelő1    12     0    23     0
#Termelő2     0    24    20    36
#Termelő3    20     0     0     0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
