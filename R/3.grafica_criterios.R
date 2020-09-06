
## Hacer grafica de % de casos que realizan criterios

source("R/style.R")
## datos para chart de criterios
df_chart_criterios = df_raw %>%
  group_by(criterios_realizados) %>%
  summarise(n = n()) %>%
  mutate(freq = round((n/sum(n))*100, digits = 1))


chart_criterios = ggplot(data = df_chart_criterios,
       aes(x = criterios_realizados,
           y = freq)) +
  geom_bar(stat = 'identity',
           fill = blue_IDB) +
  geom_text(aes(label = paste0(freq,"%")),
            nudge_y = 5) +
  ylim(0,100) +
  xlab("Número de acciones  estándar realizadas durante el caso") +
  ylab("% de casos") +
  labs(caption = paste("Total de casos registrados en el sistema:" ,nrow(df_raw))) +
  tema


#Texto para la grafica
txt_total_casos = nrow(df_raw)
txt_titulo_chart_criterios = paste("Distribucion del numero de criterios realizados en cada uno de los", 
                                   txt_total_casos, "casos reportados" )

txt_perc_casos = paste0(df_chart_criterios$freq[df_chart_criterios$criterios_realizados==8],"%")

txt_explicacion_chart_criterios=paste("*La gráfica se interpreta de la siguiente manera:",
                                      "en el", txt_perc_casos, " de los",
                                      txt_total_casos, "casos registrados en el sistema se han realizado 8 de las 8 acciones estándar de manejo de complicaciones obstétricas por hemorragia.")



