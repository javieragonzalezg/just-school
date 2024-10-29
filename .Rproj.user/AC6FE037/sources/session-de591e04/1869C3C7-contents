# 0. Preparacion encuesta estudiantes Ola 2.
# 1. cargar librerias ---------------------------------------------------------

#install.packages("pacman")
pacman::p_load(dplyr, sjmisc, car, sjlabelled, stargazer, haven)


# 2. cargar bbdd --------------------------------------------------------------

datos <- read_sav("input/data/original/251024 Edumer Ola2 ID.sav")
names(datos)
frq(datos$p1_o2)

datos_exp <- datos %>% select(T_pex_1_1_o2, T_pex_1_2_o2,  T_pex_2_1_o2, T_pex_2_2_o2, 
                              T_pex_3_1_o2, T_pex_3_2_o2, T_pex_4_1_o2, T_pex_4_2_o2, 
                              T_pex_4_3_o2, T_pex_4_4_o2, p14_o2) %>% na.omit()

library(sjPlot)
plot_caso1 <- datos_exp %>% select(T_pex_1_1_o2, T_pex_1_2_o2) %>% 
  plot_stackfrq() + theme(legend.position="bottom") # tienden a darle (en la misma medida) mas a uno
  
plot_caso2 <- datos_exp %>% select(T_pex_2_1_o2, T_pex_2_2_o2) %>% 
  plot_stackfrq() + theme(legend.position="bottom") # esfuerzo, dieron en su mayoria 3 decima eA

plot_caso3 <- datos_exp %>% select(T_pex_3_1_o2, T_pex_3_2_o2) %>% 
  plot_stackfrq() + theme(legend.position="bottom") # esfuerzo y casa pequeña

plot_caso4 <- datos_exp %>% select(T_pex_4_1_o2:T_pex_4_4_o2) %>% 
  plot_stackfrq() + theme(legend.position="bottom")

view(dfSummary(datos_exp, headings = FALSE, method = "render"))

