################# Script tarea 7.1 clase Bioinformatica 2018-2 ######################
## Majo Monteverde-Suarez

#Libreria para guardar como html
library(rmarkdown)
library(dplyr)

## Tarea: Escribe un script que haga y responda lo siguiente:


## 1) Cargar en una df llamada fullmat el archivo "Prac_Uni7/maices/meta/maizteocintle_SNP50k_meta_extended.txt"

getwd()  #obtener directorio en el que estamos (script esta guardado en Unidad 7)
# "/home/majo"

setwd("/home/majo/Escritorio/BioinfinvRepro/Unidad7/Prac_Uni7/maices/bin") ##cambiar directorio de trabajo a Unidad7 (pestaña session Set working directory to file location)

# Crear df llamada fullmat
fullmat <- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")


## 2) ¿Que tipo de objeto creamos al cargar la base?
class (fullmat)
# Es un data.frame

## 3) ¿Como se ven las primeras 6 lineas del archivo?
head(fullmat) # muestra las primeras 6 lineas del archivo

## 4) ¿Cuantas muestras hay?
str (fullmat) #165 muestras

## 5) ¿De cuantos estados se tienen muestra?
unique(fullmat$Estado)  #19 estados


## 6) ¿Cuantas muestras fueron colectadas antes de 1980?
x <- subset (fullmat, A.o._de_colecta < 1980)
str(x)   #8 muestras colectadas antes de 1980

## 7) ¿Cuantas muestras hay de cada raza?
colnames(fullmat)
summary(fullmat$Raza)  # muestra el numero de veces (freq) que se repite el nombre de cada raza

## 8) En promedio, ¿a que altitud fueron colectadas las muestras?
mean(fullmat$Altitud)
# Promedio de la latitud de todas las muestras: 1519.242

## 9) ¿A que altitud maxima y minima fueron colectadas?
max(fullmat$Altitud)
# Altitud maxima: 2769
min(fullmat$Altitud)
# Altitud minima: 5

## 10) Crea una nueva df de datos solo con las muestras de la raza Olotillo
olotillo <- subset(fullmat, Raza=="Olotillo")
class (olotillo)  #data.frame

## 11) Crea una nueva df de datos solo con las muestras de la raza Reventador, Jala y Ancho
tresrazas <- subset(fullmat, Raza==c("Reventador", "Jala", "Ancho"))

## 12) Escribe la matriz anterior a un archivo llamado submat.csv en /meta
write.csv (tresrazas, file="../meta/submat.csv")

#session info
sessionInfo() 

