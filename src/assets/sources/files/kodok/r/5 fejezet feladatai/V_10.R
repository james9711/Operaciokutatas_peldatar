#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 9. feladat
#
# Délutáni olvasás.
# 
#***********************************************************************************

library(lpSolveAPI)

#25 darab döntési változó lesz
lpmodel<-make.lp(0,25)

#Beállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(84,73,46,73,90,76,78,80,84,77,68,73,83,92,88,82,79,91,94,72,62,68,64,75,73))

#Megadom a feltételeket.
#Egy gyerek csak egy könyvet kaphat
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "=", 1)
#Egy könyvet csak egyvalaki kaphat
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#418 -> Ennyi ideig olvasnak a gyerekek összesen.

solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("Sári","Jancsi","Sanyika","Márti","Pistike"),c("1.könyv","2.könyv","3.könyv","4.könyv","5.könyv"))

solution 
#        1.könyv 2.könyv 3.könyv 4.könyv 5.könyv
#Sári          1       0       0       0       0
#Jancsi        0       1       0       0       0
#Sanyika       0       0       0       1       0
#Márti         0       0       1       0       0
#Pistike       0       0       0       0       1

# Optimális esetben Sanyika olvas a leghosszabb ideig, 92 percig.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************