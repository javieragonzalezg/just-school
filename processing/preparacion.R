# 0. Preparacion encuesta estudiantes ola 1. Se realiza un procesamiento del índice
#de evaluación de justicia en las notas

# 1. cargar librerias ---------------------------------------------------------

#install.packages("pacman")
pacman::p_load(dplyr, sjmisc, car, sjlabelled, stargazer, haven, SjPlot, summarytools)


# 2. cargar bbdd --------------------------------------------------------------
rm(list=ls())       # borrar todos los objetos en el espacio de trabajo
options(scipen=999) # valores sin notación científica


load("input/data/proc/ola1.RData")


# 3. procesamiento de variables -----------------------------------------------

# evaluacion de justicia ----

proc_datos <- proc_datos %>% mutate(justicia_nota = log(nota_obtenida/nota_pref))

summary(proc_datos$justicia_nota)

proc_datos <- proc_datos %>%
  mutate(
    justicia_nota = dplyr::case_when(
      justicia_nota < 0  ~ "injusticia sub-recompensa",
      justicia_nota == 0 | notas_merit == 2 ~ "justicia perfecta", 
      justicia_nota > 0  ~ "injusticia sobre-recompensa" 
    )
  ) 

# se deberian agregar en justicia perfecta los casos que contestaron haber 
# obtenido la nota que merecían? 
# o el indice de justicia lo que busca es ver 

frq(proc_datos$justicia_nota)  



# 4. base procesada -----------------------------------------------------------
proc_datos <-as.data.frame(proc_datos)
stargazer(proc_datos, type="text")

save(proc_datos,file = "input/data/proc/ola1.RData")
