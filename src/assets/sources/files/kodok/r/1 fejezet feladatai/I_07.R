#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 07. feladat - Kétféle termék gyártása
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

# a. megoldása
#Beállítjuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c(1,1))

#Feltételek
#Minimum
add.constraint(lpmodel, c(1,0), type = ">=", 12)
add.constraint(lpmodel, c(0,1), type = ">=", 8)
#Munkás
add.constraint(lpmodel, c(15,30), type = "<=", 600)
#Össztermelés
add.constraint(lpmodel, c(1,1), type = "<=", 400)
#Összhaszon
add.constraint(lpmodel, c(150000,220000), type = "=", 5000000)

#Állítsuk be egészre a változókat.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #5360000 -> Ennyi lesz a maximális nyereség.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) # 24 8 -> 24 raklapnyit az elsőből, 8 raklapnyit kell gyártani a másodikból.

# b. megoldása
#Beállítjuk a célfüggvény változók együtthatóit. 
#set.objfn(lpmodel,c(150000,220000))

#Feltételek
#Minimum
#add.constraint(lpmodel, c(1,0), type = ">=", 12)
#add.constraint(lpmodel, c(0,1), type = ">=", 8)
#Munkás
#add.constraint(lpmodel, c(15,30), type = "<=", 600)
#Össztermelés
#add.constraint(lpmodel, c(1,1), type = "<=", 400)

#Állítsuk be egészre a változókat.
#set.type(lpmodel,1,c("integer"))
#set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
#solve(lpmodel) 

#Célfüggvény értékének lekérése
#get.objective(lpmodel) #5360000 -> Ennyi lesz a maximális nyereség.

#A megoldást adó változók értékének lekérése
#get.variables(lpmodel) # 24 8 -> 24 raklapnyit az elsőből, 8 raklapnyit kell gyártani a másodikból.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************