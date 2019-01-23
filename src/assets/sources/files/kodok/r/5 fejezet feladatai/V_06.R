#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 6. feladat
#
# Kertészet.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó lesz
lpmodel<-make.lp(0,16)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(72,42,36,69,64,46,40,75,66,38,35,63,68,46,41,67))

#Megadom a feltételeket.
#Egy ember csak egy kertészfeladatot csinálhat
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "=", 1)
#Minden feladatot csak egy ember csinálhathat
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#205 -> Ennyi lesz az összidő percben, ami alatt rendberaknak egy kertet.

solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("1.kertész","2.kertész","3.kertész","4.kertész"),c("Gazolás","Ültetés","Locsolás","Növényvágás"))

solution 
#          Gazolás Ültetés Locsolás Növényvágás
#1.kertész       0       0        1           0
#2.kertész       1       0        0           0
#3.kertész       0       1        0           0
#4.kertész       0       0        0           1

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************