set.seed(20230928)
fo <- c("kreis", "quadrat", "dreieck")
fa <- c("lila", "türkis", "gelb")
colours <- c("lila" = "#440154FF", "türkis" = "#21908CFF", "gelb" = "#FDE725FF")

dat <- data.frame(
  form = sample(fo, 50, T),
  farbe = sample(fa, 50, T),
  groesse = sample(1:3, 50, T)
)


Und weils so Spaß und vllt. noch ein bisschen mehr Verständnis bringt, hier nochmal ein fiktiver Datensatz (`dat`), an dem wir fleißig rumfiltern können: Wir haben 50 Einträgen, drei Formen (Kreis, Quadrat, Dreieck [`form`]), drei Farben (lila, türlis, gelb [`farbe`]) und 3 Größen (1, 2, 3 [`groesse`]). Sieht bisschen so aus, wie so ein Baukasten:

  ```{r operatoren_4}
dat

library(ggplot2)

ggplot(dat, aes(x = as.factor(groesse), y = farbe, col = farbe, shape = form, size = groesse)) +
  geom_jitter() +
  facet_wrap(~form, nrow = 3) +
  scale_shape_manual(values = c("kreis" = 16, "quadrat" = 15, "dreieck" = 17)) +
  scale_colour_manual(values = colours) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "Vorhandene Formen",
    y = "Farbe",
    x = "Größe")
```

Und nun wollen wir fröhlich darin herumfiltern. Um grafisch zu schauen, ob es wie geplant funktioniert hat, kannst du folgenden Code ausführen. Dafür kannst du dein akturell gefiltertes Datenset als `filtered_data` definieren und dann den Plot ausführen.

```{r operatoren_6, eval = FALSE, echo=TRUE}
filtered_data <- dat %>% filter(form == "gelb" & groesse == 3)
filtered_data

gefilterte_daten <- dat %>% filter(form == "gelb" & groesse == 3)
gefilterte_daten




ggplot(filtered_data, aes(x = as.factor(groesse), y = farbe, col = farbe, shape = form, size = groesse)) +
  geom_jitter() +
  facet_wrap(~form, nrow = 3) +
  scale_shape_manual(values = c("kreis" = 16, "quadrat" = 15, "dreieck" = 17)) +
  scale_colour_manual(values = colours) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "Herausgefilterte Formen",
    y = "Farbe",
    x = "Größe")
```
