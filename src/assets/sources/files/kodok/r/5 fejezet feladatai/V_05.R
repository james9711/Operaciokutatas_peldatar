#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 5. feladat
#
# Tételhúzás.
# 
#***********************************************************************************

library(lpSolveAPI)

#20 darab döntési változó lesz
lpmodel<-make.lp(0,25)

#Beállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(81,88,65,42,90,99,94,92,93,91,81,23,46,53,74,56,86,72,46,35,24,63,34,58,78))

#Megadom a feltételeket.
#Egy ember csak egy tételt húzhat
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "=", 1)
#Egy tételt csak egy ember húzhat
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#412 -> Ennyi az összázalék. Vagyis átlagosan egy diák 82.4 százalékot fog elérni.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) 

solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("Attila","Ágnes","Erika","Pál","Tibor"),c("1.tétel","2.tétel","3.tétel","4.tétel","5.tétel"))

solution 
#       1.tétel 2.tétel 3.tétel 4.tétel 5.tétel
#Attila       0       1       0       0       0
#Ágnes        0       0       0       1       0
#Erika        1       0       0       0       0
#Pál          0       0       1       0       0
#Tibor        0       0       0       0       1

#Valamit 2 darab 5-ös felett lesz így, ha a legjobb esetet feltételezzük. 

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************