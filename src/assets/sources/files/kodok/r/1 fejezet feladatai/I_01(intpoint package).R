#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 01. feladat - Szekrény, asztal gyártás
# 
#***********************************************************************************

library(intpoint)

#A célfüggvényem együtthatói
c=c(75000,55000)
#A feltételeim jobb oldali értékei 
bm=c(1300,400,70)
#A feltételeim együtthatói mátrixban megadva.
m=matrix(c(10,15,5,3,0,1),nrow = 3, byrow = TRUE)
#Grafikus megoldás (t=1 <- maximailzálás)
# m és bm <- "<="
# M és bM <- ">="
# A és bA <- "="
solve2dlp(t=1, m=m, bm=bm, c=c)

#The Optimal Point is ( 46.66667 , 55.55556 ) and Zopt= 6555556 

#With the interior point method, the optimal value for Z is 6553518 
#The Solution X is  ( 46.649 , 55.543 ) and 
#the number of iterations is 18

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
