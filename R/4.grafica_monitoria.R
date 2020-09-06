
source("R/style.R")
## Grafica de criterios realizados

df_monitoria = df_raw %>%
  pivot_longer(starts_with("m_")) %>%
  select(name, value) %>%
  group_by(name) %>%
  summarise(value = sum(value), .groups = 'drop') %>%
  mutate(freq = round(value/nrow(df_raw) *100, digits = 1)) %>%
  arrange(freq) %>%
  mutate(name = if_else(name == "m_frecuencia", "Frecuencia respiratoria", name),
         name = if_else(name == "m_hemograma", "Hemograma + Plaquetas", name),
         name = if_else(name == "m_isotonicas", "Soluciones isotónicas calentadas", name),
         name = if_else(name == "m_oxigeno", "Oxígeno vía catéter", name),
         name = if_else(name == "m_presion", "Presión arterial", name),
         name = if_else(name == "m_pulso", "Pulso", name),
         name = if_else(name == "m_tansfusion", "Transfusión ", name),
         name = if_else(name == "m_tipificacion", "Tipificación sanguínea", name))


chart_monitoria = ggplot(data = df_monitoria,
       aes(x=freq,
           y = reorder(name, freq))
)+
  geom_bar(stat= 'identity',
           fill = blue_IDB) +
  geom_text(aes(label=paste0(freq, "%")),
            nudge_x = -8,
            color = "white") +
  ylab("") +
  xlab("(%) Porcentaje de casos") +
  xlim(0,100) +
  labs(caption = paste("Total de casos registrados en el sistema:" ,nrow(df_raw))) +
  tema

txt_presion_arterial = paste0(df_monitoria$freq[df_monitoria$name == "Presión arterial"],"%")

txt_titulo_chart_monitoria = "Porcentaje de casos en el que se realizo cada uno de los 8 criterios"
txt_explicacion_chart_monitoria = paste("*La gráfica se interpreta de la siguiente manera:",
                                        "en el", txt_presion_arterial, "de los casos registrados en el sistema se tomó la presion arterial."
)

txt_explicacion_chart_criterios
