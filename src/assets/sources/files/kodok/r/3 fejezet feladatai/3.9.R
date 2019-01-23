#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 3. fejezet 9. feladat 
#
# Gyáros
#
# a.) részének megoldása
#
#***********************************************************************************

library(lpSolveAPI)

lpmodel<-make.lp(0,2)

lp.control(lpmodel,sense='max')

set.objfn(lpmodel,c(1,1))

#A feltételekben dkg-ban vannak megadva a mértékegységek
#Nyereség ennyi legyen
add.constraint(lpmodel, c(150000,220000), type = "=", 5000000)
#Munkásigény
add.constraint(lpmodel, c(15,30), type = "<=", 600)
#Termelési korlát
add.constraint(lpmodel, c(1,1), type = "<=", 40)
#Minimum 1 termék (raklap)
add.constraint(lpmodel, c(1,0), type = ">=", 12)
#Minimum 2 termék (raklap)
add.constraint(lpmodel, c(0,1), type = ">=", 8)

# !Ha egész értékű megszorítást teszek a változókra, akkor nincs megoldása feladatnak.!

solve(lpmodel) 

#Optimális megoldás
get.objective(lpmodel) #29.6 -> Ennyi terméket kell majd gyártani, ha 5 millió Ft-os hasznot akarunk.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #21.6 8  -> 21.6 db-ot az elsőből, 8-at a második termékből.

#***********************************************************************************
#
# b.) részének megoldása
#
#***********************************************************************************

library(lpSolveAPI)

lpmodel<-make.lp(0,2)

lp.control(lpmodel,sense='max')

set.objfn(lpmodel,c(150000,220000))

#A feltételekben dkg-ban vannak megadva a mértékegységek
#Munkásigény
add.constraint(lpmodel, c(15,30), type = "<=", 600)
#Termelési korlát
add.constraint(lpmodel, c(1,1), type = "<=", 40)
#Minimum 1 termék (raklap)
add.constraint(lpmodel, c(1,0), type = ">=", 12)
#Minimum 2 termék (raklap)
add.constraint(lpmodel, c(0,1), type = ">=", 8)

set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

solve(lpmodel) 

#Optimális megoldás
get.objective(lpmodel) #5360000 -> Ennyi lesz a maximális nyereség.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #24 8  -> 24 az első terméékből, 8 a másdikból.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************