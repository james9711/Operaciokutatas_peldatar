#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 5. feladat
#
# Csekkfeldolgozás.
# 
#***********************************************************************************

library(lpSolveAPI)

#9 darab döntési változó van.
lpmodel<-make.lp(0,9)

#Állítsuk be minimalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(100,120,110,90,95,80,100,90,85))

#Adjuk meg a feltételeket.
#Beérkező csekkek száma (A feladatban naponta beérkező mennyiség 
#van megadva, ide viszont heti kell!)
#Eladói csekkek (naponta 1000 db->hetente 6000 (vasárnap zárva!))
add.constraint(lpmodel, c(1,1,1,0,0,0,0,0,0), type = "<=", 6000)
#Fizetési csekkek
add.constraint(lpmodel, c(0,0,0,1,1,1,0,0,0), type = "<=", 7200)
#Személyi csekkek
add.constraint(lpmodel, c(0,0,0,0,0,0,1,1,1), type = "<=", 6000)

#Feldolgozási feltételek
#1. iroda ennyit képes egy héten feldolgozni
add.constraint(lpmodel, c(1,0,0,1,0,0,1,0,0), type = ">=", 8500)
#2. iroda
add.constraint(lpmodel, c(0,1,0,0,1,0,0,1,0), type = ">=", 6100)
#3. iroda
add.constraint(lpmodel, c(0,0,1,0,0,1,0,0,1), type = ">=", 4600)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#1742500 lesz az összköltség, amennyibe kerülni fog a csekkek feldolgozása.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("Eladói","Fizetési","Személyi"),c("1. iroda","2. iroda","3. iroda"))

solution
#         1. iroda 2. iroda 3. iroda
#Eladói       6000        0        0
#Fizetési     2500      100     4600
#Személyi        0     6000        0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************