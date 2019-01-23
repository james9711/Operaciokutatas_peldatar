#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 1. feladat
#
# Hotel transylvania.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó lesz
lpmodel<-make.lp(0,16)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(40,20,34,14,35,18,28,10,50,22,26,20,40,24,26,18))

#Megadom a feltételeket.
#Egy emberhez egy feladat
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "=", 1)

#Egy feladathoz egy ember
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#96 ennyi ideig tart egy szoba kitakarítása.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) 

solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("Rosszcsont","Lábcsont","Koponya","Gerincke"),c("Porszívózás","Rendrakás","Fürdöszobatakarítás","Ágyneműcsere"))

solution
#           Porszívózás Rendrakás Fürdöszobatakarítás Ágyneműcsere
#Rosszcsont           0         1                   0            0
#Lábcsont             0         0                   0            1
#Koponya              0         0                   1            0
#Gerincke             1         0                   0            0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************