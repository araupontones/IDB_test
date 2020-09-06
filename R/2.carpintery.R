## Carpintery 

source("R/set_up.R")
source("R/1.download.R")
source("R/functions.R")


# READ DATA -------------------------------------

vars_drop = c("positivo", "negativo", "sin_respuesta",
              "no_hace_falta", "assignment__id",
              "sssys_irnd")

#numero de criterios a realizar

num_criterios = 8
df_raw = import(file.path(downloadDir, questionnaire)) %>%
  mutate(across(all_of(c("causas", "interview__status")), fn_labels)) %>%
  select(-vars_drop, -starts_with("txt_")) %>%
  rename(m_presion = general__1,
         m_pulso = general__2,
         m_frecuencia = general__3,
         m_hemograma = laboratorio__1,
         m_tipificacion = laboratorio__2,
         m_oxigeno = manejo__1,
         m_isotonicas = manejo__2,
         m_tansfusion  = manejo__3) %>%
  #Sum all the criterios
  mutate(criterios_realizados = rowSums(.[str_detect(names(.), "m_")]),
         criterios_realizados = factor(criterios_realizados,
                                       levels = seq(1,8,1)))




#crear grafica de numero de criterios realizados por caso
source("R/3.grafica_criterios.R")
source("R/4.grafica_monitoria.R")


