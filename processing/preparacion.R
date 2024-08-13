# 0. Preparacion encuesta estudiantes ola 1. Se realiza un procesamiento de variables 
#referidas al merito, meritocracia en la escuela y justificacion de la desigualdad 

# 1. cargar librerias ---------------------------------------------------------

#install.packages("pacman")
pacman::p_load(dplyr, sjmisc, car, sjlabelled, stargazer, haven)


# 2. cargar bbdd --------------------------------------------------------------
rm(list=ls())       # borrar todos los objetos en el espacio de trabajo
options(scipen=999) # valores sin notación científica


datos <- read_sav("input/data/original/310524_BDD_edumer.sav")


# 3. seleccionar variables ----------------------------------------------------

proc_datos <- datos %>% select()
#renombrar 
proc_datos <- proc_datos %>% rename()


