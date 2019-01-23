#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 08. feladat - Útszéli hamburgerező
#
#***********************************************************************************

library(lpSolveAPI)

lpmodel<-make.lp(0,2)

lp.control(lpmodel,sense='max')

# a. megoldás

#set.objfn(lpmodel,c(1,1))

#Feltételekben egységesen dkg-ot használok mértékegységként
#Buci
#add.constraint(lpmodel, c(1,1), type = "<=", 80)
#Csirkehús
#add.constraint(lpmodel, c(10,0), type = "<=", 500)
#Marhahús
#add.constraint(lpmodel, c(0,13), type = "<=", 400)
#Sajt
#add.constraint(lpmodel, c(4,8), type = "<=", 200)
#Zöldség
#add.constraint(lpmodel, c(10,8), type = "<=", 350)
#Bevétel
#add.constraint(lpmodel, c(800,1100), type = "=", 30000)


#c. megoldás
set.objfn(lpmodel,c(800,1100))

#Feltételekben egységesen dkg-ot használok mértékegységként
#Buci
add.constraint(lpmodel, c(1,1), type = "<=", 80)
#Csirkehús
add.constraint(lpmodel, c(10,0), type = "<=", 500)
#Marhahús
add.constraint(lpmodel, c(0,13), type = "<=", 400)
#Sajt
add.constraint(lpmodel, c(4,8), type = "<=", 200)
#Zöldség
add.constraint(lpmodel, c(10,8), type = "<=", 350)

#Hogy egész értékű megoldást kapjunk.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

solve(lpmodel) 

#Optimális megoldás
get.objective(lpmodel) #33500 -> Ennyi lesz a napi bevétele.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #24 13  -> 24 csirkehamburger és 13 marhahamburger adna el ekkor.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************