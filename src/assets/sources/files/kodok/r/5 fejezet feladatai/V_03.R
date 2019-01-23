#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 3. feladat
#
# 4x100 méteres vegyes váltó.
# 
#***********************************************************************************

library(lpSolveAPI)

#20 darab döntési változó lesz
lpmodel<-make.lp(0,20)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(69.4,78.4,63.2,66.4,71.2,76.3,65.9,67.3,68.6,81.3,66.4,69.8,68.8,76.5,61.5,67.1,68.9,77.9,65.1,67.2))

#Megadom a feltételeket.
#Egy úszásnemet csak egy lány úszhat
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#272.8 -> 4 perc 32.8 mp alatt ússza le a 4 lány a 4x100-as vegyest.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) 

solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("Ági","Éva","Sára","Edina","Olívia"),c("Hát","Mell","Gyors","Pillangó"))

solution 
#       Hát Mell Gyors Pillangó
#Ági      0    0     0        1
#Éva      0    1     0        0
#Sára     1    0     0        0
#Edina    0    0     1        0
#Olívia   0    0     0        0


#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************