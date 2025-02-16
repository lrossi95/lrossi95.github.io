---
title: "Analisi preliminare dell'Impatto del Progetto 'Bologna Città 30' sugli Incidenti Stradali"
author: "Luca Rossi"
output:
  blogdown::html_page:
    keep_md: true  # Ensure the Markdown file retains YAML metadata
categories: ["Policy Evaluation"]
tags: ["policy", "evaluation"]
---











### 1. Numero Totale di Incidenti
- Il numero complessivo di incidenti **non ha subito variazioni significative** tra il 2023 e il 2024.
- Ciò suggerisce che l'impatto del progetto "Città 30" potrebbe essere più sulla **gravità** che sulla **frequenza** degli incidenti.


<img src="images/Barplot codes percentage-1.png" width="960" style="display: block; margin: auto;" />

### 2. Codici di Gravità degli Incidenti
- **Riduzione dei codici rossi** (incidenti più gravi) rispetto al 2023.
- **Aumento dei codici gialli**, indicando una gravità media inferiore degli incidenti.
- **Leggero aumento dei codici verdi**, ma meno significativo rispetto ai gialli.


<img src="images/Barplot codes actual-1.png" width="960" style="display: block; margin: auto;" />

### 3. Andamento Mensile degli Incidenti in "Città 30"
- La percentuale di incidenti nelle aree a **30 km/h è stabile o in leggero aumento**.
- Le zone **fuori da "Città 30"** mantengono un numero di incidenti inferiore.
- Questo suggerisce che il progetto non ha ancora ridotto il numero totale di incidenti, ma ha contribuito a diminuirne la gravità.

<img src="images/Seriousness_graph-1.png" width="960" style="display: block; margin: auto;" />




### 4. Distribuzione Spaziale degli Incidenti
- Gli incidenti continuano a verificarsi nelle **stesse aree** rispetto all'anno precedente.
- **"0"** indica zone **fuori da Città 30**, mentre **"1"** indica zone **all'interno di Città 30**.
- La **proporzione degli incidenti è 80% - 20%** tra le zone che oggi fanno parte di "Città 30" e quelle esterne.

<img src="images/Before_After_graph-1.png" width="960" style="display: block; margin: auto;" />

#### Mappa slider con prima e dopo

<div style="background-color:white; padding:10px;">
  <iframe src="image_comparison.html"
          width="100%"
          height="500px"
          style="border:none; background:white;">
  </iframe>
</div>