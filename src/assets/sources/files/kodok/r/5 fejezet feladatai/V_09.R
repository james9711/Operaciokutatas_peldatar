#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 9. feladat
#
# Újságírók.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó lesz
lpmodel<-make.lp(0,16)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(4000,6000,3600,5000,5200,4600,3500,4400,4800,5700,5600,5000,5300,5600,4900,6200))

#Megadom a feltételeket.
#Egy ember csak egy heyszínre lehet kiküldeni
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "=", 1)
#Egy helyszínen csak egy újságíró lehet
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#18100 -> A Blikk vezetőjének ennyit kell fizetnie majd az újságíróknak.

solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("1.újságíró","2.újságíró","3.újságíró","4.újságíró"),c("1.hely","2.hely","3.hely","4.hely"))

solution 
#           1.hely 2.hely 3.hely 4.hely
#1.újságíró      1      0      0      0
#2.újságíró      0      0      1      0
#3.újságíró      0      0      0      1
#4.újságíró      0      1      0      0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************