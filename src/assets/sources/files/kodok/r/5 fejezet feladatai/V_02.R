#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 1. feladat
#
# Tilosban parkolás.
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó lesz
lpmodel<-make.lp(0,16)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(11.3,4.3,6.3,8.4,9.2,5.1,7.4,7.1,10.6,4.8,7.1,8.9,9.8,3.9,5.9,10.2))

#Megadom a feltételeket.
#Egy autó egy helyre mehet
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "=", 1)

#Egy helyen csak egy autószállító lehet
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
dimnames(solution)<-list(c("1.autó","2.autó","3.autó","4.autó"),c("1.hely","2.hely","3.hely","4.hely"))

solution
#       1.hely 2.hely 3.hely 4.hely
#1.autó      0      0      1      0
#2.autó      0      0      0      1
#3.autó      1      0      0      0
#4.autó      0      1      0      0


#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************