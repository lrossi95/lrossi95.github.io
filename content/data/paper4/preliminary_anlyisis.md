---
title: "Bologna Città 30"
author: "Luca Rossi"
Description: "Analisi Preliminare Incidenti nel comune di Bologna"

Summary: "Analisi Preliminare Incidenti nel comune di Bologna"
output: 
  blogdown::html_page:
    keep_md: true  # Ensure the Markdown file retains YAML metadata
categories: ["Policy Evaluation"]
tags: ["policy", "evaluation"]
---







``` r
# Load custom font
font_add_google("Lato")
showtext_auto()
```

#### Age pyramids 

<img src="images/Age Pyramid-1.png" width="960" style="display: block; margin: auto;" />

#### Stacked Bar Charts
##### Valori Effettivi

<img src="images/Stacked bar counts-1.png" width="960" style="display: block; margin: auto;" />

##### In percentuale

<img src="images/Stacked bar percent-1.png" width="960" style="display: block; margin: auto;" />




#### Serie Storica
# Valori Effettivi

<img src="images/Grafico incidenti-1.png" width="960" style="display: block; margin: auto;" />

##### Percentuale
<img src="images/Grafico proporzione incidenti -1.png" width="960" style="display: block; margin: auto;" />

<iframe src="image_comparison.html" width="100%" height="600px" style="border:none;"></iframe>

# TODO: Treated - Untreated

<!-- #### Grafico sulla gravita degli incidenti -->

<!-- Ad un primo sguardo sembrano scendere i codici rossi ed aumentare i codici gialli dopo 2 mesi dall'introduzione di "Bologna citta 30" -->

<!-- ```{r, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # OLD VERSION -->
<!-- custom_colors <- c("V" = "green4", "G" = "yellow2", "R" = "red") -->

<!-- # 🚀 Plot using ggplot -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = proportion, -->
<!--     color = as.factor(CRITICITA_ASSEG), -->
<!--     group = as.factor(CRITICITA_ASSEG))) +  -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   # scale_color_manual(values = custom_colors) +  # Apply custom colors -->

<!--   scale_y_continuous(labels = percent_format()) +  # Convert y-axis to percentages -->

<!--   # X-axis formatting: Ensure months are displayed chronologically -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   labs( -->
<!--     title = "Monthly Trends of Incidents by Seriousness and Year", -->
<!--     x = "", -->
<!--     y = "Percentage of Incidents (on monthly total)", -->
<!--     color = "Seriousness Level" -->
<!--   ) + -->

<!--   geom_vline(xintercept = as.Date("2024-01-01"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) -->
<!-- ``` -->

<!-- ```{r, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- custom_colors <- c("V" = "green4", "G" = "yellow2", "R" = "red") -->

<!-- # 🚀 Plot using ggplot -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = count, -->
<!--     color = as.factor(CRITICITA_ASSEG), -->
<!--     group = as.factor(CRITICITA_ASSEG))) +  -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   scale_color_manual(values = custom_colors) +  # Apply custom colors -->

<!--   # X-axis formatting: Ensure months are displayed chronologically -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   labs( -->
<!--     title = "Monthly Trends of Incidents by Seriousness and Year", -->
<!--     x = "", -->
<!--     y = "Percentage of Incidents (on monthly total)", -->
<!--     color = "Codice Colore" -->
<!--   ) + -->

<!--   geom_vline(xintercept = as.Date("2024-01-01"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) -->
<!-- ``` -->

<!-- ```{r Seriousness Year - Separated, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # Load Data -->
<!-- ssn_data <- read_feather(here("..", "datasets", "ssn_new.feather")) -->

<!-- # Convert `DATA_ARRIVO_CHIAM` to Date format and extract time components -->
<!-- ssn_data <- ssn_data %>% -->
<!--   mutate( -->
<!--     DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM),  # Ensure it's a Date -->
<!--     year = year(DATA_ARRIVO_CHIAM), -->
<!--     month = floor_date(DATA_ARRIVO_CHIAM, "month")  # Extract month (rounded) -->
<!--   ) -->

<!-- # 🚀 Fix `VAL_SAN_EMERGENZA` -->
<!-- ssn_data <- ssn_data %>% -->
<!--   filter(VAL_SAN_EMERGENZA != -1) %>%  # Remove incorrect value -->
<!--   mutate(VAL_SAN_EMERGENZA = ifelse(VAL_SAN_EMERGENZA == 4, 3, VAL_SAN_EMERGENZA))  # Convert 4 → 3 -->

<!-- # Aggregate data by (year, month, CRITICITA_ASSEG) -->
<!-- monthly_counts <- ssn_data %>% -->
<!--   mutate(month = floor_date(DATA_ARRIVO_CHIAM, "month")) %>% -->
<!--   group_by(month) %>% -->
<!--   mutate(month_count = n()) %>% -->
<!--   group_by(year, month, VAL_SAN_EMERGENZA) %>% -->
<!--     mutate(count = n(), .groups = "drop") %>% -->
<!--     mutate(proportion = count / month_count) %>%  # Normalize by total counts of that year -->
<!--     mutate(year = year) -->

<!-- # Convert `month` to readable format (abbreviations like "Jan", "Feb", etc.) -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(month_label = format(month, "%b")) -->

<!-- # Define Custom Colors for Categories -->
<!-- custom_colors <- c( -->
<!--   "2023 - 0" = "gray", "2024 - 0" = "darkgray", -->
<!--   "2023 - 1" = "green", "2024 - 1" = "darkgreen", -->
<!--   "2023 - 2" = "orange", "2024 - 2" = "darkorange", -->
<!--   "2023 - 3" = "red", "2024 - 3" = "darkred" -->
<!-- ) -->

<!-- # 🚀 Plot using ggplot -->
<!-- serie_storica <- ggplot(monthly_counts, aes( -->
<!--     x = month_label, y = proportion, -->
<!--     color = interaction(year, VAL_SAN_EMERGENZA, sep = " - "), -->
<!--     group = interaction(year, VAL_SAN_EMERGENZA))) + -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->
<!--   scale_x_discrete(limits = month.abb) +  # Ensure months appear in order -->
<!--   scale_color_manual(values = custom_colors) +  # Apply custom colors -->
<!--   scale_y_continuous(labels = percent_format()) +  # Convert y-axis to percentages -->

<!--   labs( -->
<!--     title = "Monthly Trends of Incidents by Seriousness and Year", -->
<!--     x = "", -->
<!--     y = "Percentage of Incidents (on monthly total)", -->
<!--     color = "Year - Seriousness" -->
<!--   ) + -->
<!--   theme_minimal() + -->
<!--   theme(plot.title = element_text(hjust = 0.5, size = 16))  # Center the title -->

<!-- ``` -->

<!-- ```{r Policy Change Descriptive Valutazione Sanitaria Proporzione, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # Load Data -->
<!-- ssn_data <- read_feather(here("..", "datasets", "ssn_new.feather")) -->

<!-- # Convert `DATA_ARRIVO_CHIAM` to Date format and extract time components -->
<!-- ssn_data <- ssn_data %>% -->
<!--   mutate( -->
<!--     DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM),  # Ensure it's a Date -->
<!--     year = year(DATA_ARRIVO_CHIAM), -->
<!--     month = floor_date(DATA_ARRIVO_CHIAM, "month")  # Extract month (rounded) -->
<!--   ) -->

<!-- # 🚀 Fix `VAL_SAN_EMERGENZA` -->
<!-- ssn_data <- ssn_data %>% -->
<!--   filter(VAL_SAN_EMERGENZA != -1) %>%  # Remove incorrect value -->
<!--   mutate(VAL_SAN_EMERGENZA = ifelse(VAL_SAN_EMERGENZA == 4, 3, VAL_SAN_EMERGENZA))  # Convert 4 → 3 -->

<!-- monthly_counts <- ssn_data %>% -->
<!--   mutate(month = floor_date(DATA_ARRIVO_CHIAM, "month")) %>% -->
<!--   group_by(month) %>% -->
<!--   mutate(month_count = n()) %>% -->
<!--   group_by(year, month, VAL_SAN_EMERGENZA) %>% -->
<!--     mutate(count = n(), .groups = "drop") %>% -->
<!--     mutate(proportion = count / month_count) %>%  # Normalize by total counts of that year -->
<!--     mutate(year = year) -->

<!-- # Convert `month` to a formatted label "MMM YYYY" (e.g., "Jan 2023") -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(month_label = format(month, "%b %Y")) -->

<!-- # Define Custom Colors for Categories -->
<!-- custom_colors <- c( -->
<!--   "0" = "darkgray", -->
<!--   "1" = "green4", -->
<!--   "2" = "darkorange", -->
<!--   "3" = "red" -->
<!-- ) -->

<!-- # 🚀 Plot using ggplot -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = proportion, -->
<!--     color = as.factor(VAL_SAN_EMERGENZA), -->
<!--     group = as.factor(VAL_SAN_EMERGENZA))) + -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   scale_color_manual(values = custom_colors) +  # Apply custom colors -->
<!--   scale_y_continuous(labels = percent_format()) +  # Convert y-axis to percentages -->

<!--   # X-axis formatting: Ensure months are displayed chronologically -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   labs( -->
<!--     title = "Monthly Trends of Incidents by Seriousness and Year", -->
<!--     x = "", -->
<!--     y = "Percentage of Incidents (on monthly total)", -->
<!--     color = "Seriousness Level" -->
<!--   ) + -->

<!--   geom_vline(xintercept = as.Date("2024-01-01"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) + -->
<!--   geom_vline( -->
<!--     xintercept = as.Date("2024-01-01"), -->
<!--     linetype = "dotted", -->
<!--     color = "grey40", -->
<!--     linewidth = 0.8 -->
<!--   ) -->


<!-- ``` -->

<!-- ```{r Policy Change Descriptive Valutazione Sanitaria Nominali, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # 🚀 Plot using ggplot -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = count, -->
<!--     color = as.factor(VAL_SAN_EMERGENZA), -->
<!--     group = as.factor(VAL_SAN_EMERGENZA))) + -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   scale_color_manual(values = custom_colors) +  # Apply custom colors -->

<!--   # X-axis formatting: Ensure months are displayed chronologically -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   labs( -->
<!--     title = "Monthly Trends of Incidents by Seriousness and Year", -->
<!--     x = "", -->
<!--     y = "Percentage of Incidents (on monthly total)", -->
<!--     color = "Seriousness Level" -->
<!--   ) + -->

<!--   geom_vline(xintercept = as.Date("2024-01-01"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) -->
<!-- ``` -->

<!-- ```{r Barplot codes data analysis, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # Load necessary libraries -->
<!-- library(arrow) -->
<!-- library(dplyr) -->
<!-- library(tidyr) -->
<!-- library(ggplot2) -->

<!-- # Read the dataset -->
<!-- ssn_data <- read_feather(here("..","datasets", "ssn_new.feather")) -->

<!-- # Define factor mapping for CRITICITA_ASSEG -->
<!-- factor_mapping <- c("V" = 1, "G" = 2, "R" = 3) -->

<!-- # Map CRITICITA_ASSEG to numerical factors -->
<!-- ssn_data <- ssn_data %>% -->
<!--   mutate(CRITICITA_ASSEG_FACTOR = factor_mapping[CRITICITA_ASSEG]) -->

<!-- # Group by year and CRITICITA_ASSEG_FACTOR, then count occurrences -->
<!-- plot_data <- ssn_data %>% -->
<!--   group_by(year, CRITICITA_ASSEG_FACTOR) %>% -->
<!--   summarise(counts = n(), .groups = "drop") -->

<!-- # Group by year and CRITICITA_ASSEG_FACTOR, then count occurrences -->
<!-- plot_data <- plot_data %>% -->
<!--   group_by(year) %>% -->
<!--   mutate(somma = sum(counts)) %>% -->
<!--   mutate(perc = (counts / somma)) -->
<!-- # Convert data to long format for ggplot -->
<!-- plot_data <- plot_data %>% -->
<!--   mutate(CRITICITA_ASSEG_FACTOR = factor(CRITICITA_ASSEG_FACTOR, levels = c("1", "2", "3"), -->
<!--                                          labels = c("Verde", "Giallo", "Rosso"))) -->

<!-- # Define custom colors -->
<!-- custom_colors <- c("Verde" = "#77DD77", "Giallo" = "#FFDD55", "Rosso" = "#FF6961") -->
<!-- ``` -->


<!-- #### number of incidents -->

<!-- The number of incidents seems to be approximately the same -->

<!-- ```{r Barplot codes actual, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->
<!-- # Read the dataset -->
<!-- ssn_data <- read_feather(here("..","datasets", "ssn_new.feather")) -->

<!-- # Define factor mapping for CRITICITA_ASSEG -->
<!-- factor_mapping <- c("V" = 1, "G" = 2, "R" = 3) -->

<!-- # Map CRITICITA_ASSEG to numerical factors -->
<!-- ssn_data <- ssn_data %>% -->
<!--   mutate(CRITICITA_ASSEG_FACTOR = factor_mapping[CRITICITA_ASSEG]) -->

<!-- # Group by year and CRITICITA_ASSEG_FACTOR, then count occurrences -->
<!-- plot_data <- ssn_data %>% -->
<!--   group_by(year, CRITICITA_ASSEG_FACTOR) %>% -->
<!--   summarise(counts = n(), .groups = "drop") -->

<!-- # Create stacked bar plot -->
<!-- ggplot(plot_data, aes(x = factor(year), y = counts, fill = CRITICITA_ASSEG_FACTOR)) + -->
<!--   geom_bar(stat = "identity", position = "stack") + -->
<!--   scale_fill_manual(values = custom_colors) + -->
<!--   labs( -->
<!--     title = "Stacked bar plot of incidents in numbers", -->
<!--     x = "Year", -->
<!--     y = "Counts", -->
<!--     fill = "Criticità" -->
<!--   ) + -->
<!--   theme_minimal() + -->
<!--   theme(legend.position = "bottom")  + -->
<!--   theme(plot.title = element_text(hjust = 0.5,size = 16))  # Center the title -->
<!-- ``` -->


<!-- #### number of incidents in percentage -->


<!-- The number of red codes decreases and it increases the number of green code -->


<!-- ```{r Barplot codes percentage, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} -->




<!-- brks <- seq(0,1,0.1) -->

<!-- # Create stacked bar plot -->
<!-- ggplot(plot_data, aes(x = factor(year), y = perc, fill = CRITICITA_ASSEG_FACTOR)) + -->
<!--   geom_bar(stat = "identity", position = "stack") + -->
<!--   scale_y_continuous(breaks = brks, labels = scales::percent(brks)) + -->
<!--   scale_fill_manual(values = custom_colors) + -->
<!--   labs( -->
<!--     title = "Stacked bar plot of incidents in %", -->
<!--     x = "Year", -->
<!--     y = "Percentage", -->
<!--     fill = "Criticità" -->
<!--   ) + -->
<!--   theme_minimal() + -->
<!--   theme(legend.position = "bottom")  + -->
<!--   theme(plot.title = element_text(hjust = 0.5,size = 16))  # Center the title -->



<!-- ``` -->

<!-- Ad un primo sguardo gli incidenti sembrano essere nelle stesse aree -->
<!--   - 0 indica zone che non sono in citta 30  -->
<!--   - 1 indica zone che sono in citta 30 -->

<!-- La proporzione degli incidenti e 80 / 20 per le zone che oggi sono in citta 30C -->




<!-- ```{r Before_After_graph,echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center',results='hide',fig.keep='all'} -->
<!-- # Read the GeoJSON file -->
<!-- citta30_final <- suppressMessages(st_read(here("..", "datasets", "citta30_final.geojson"))) -->

<!-- # Convert date column to Date format -->
<!-- citta30_final <- citta30_final %>% -->
<!--   mutate(DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM)) -->

<!-- monthly_counts <- citta30_final %>% -->
<!--   mutate(month = floor_date(DATA_ARRIVO_CHIAM, "month")) %>% -->
<!--   group_by(month) %>% -->
<!--   mutate(month_count = n()) %>% -->
<!--   group_by(year, month, treated) %>% -->
<!--     mutate(count = n(), .groups = "drop") %>% -->
<!--     mutate(proportion = count / month_count) %>%  # Normalize by total counts of that year -->
<!--     mutate(year = year) -->


<!-- # Ensure months are properly labeled for x-axis -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(month_label = format(month, "%b %Y"))  # Convert to "Jan 2023", "Feb 2023", etc. -->

<!-- # Define custom colors -->
<!-- custom_colors <- c("0" = "red", "1" = "blue") -->

<!-- # 🚀 Plot using ggplot2 -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = proportion,  -->
<!--     color = interaction(treated))) + -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   # Ensure x-axis labels show proper months with years -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   # scale_color_manual(values = custom_colors) +  # Apply custom colors -->
<!--   scale_y_continuous(labels = percent_format()) +  # Convert y-axis to percentages -->
<!--   labs( -->
<!--     title = "Monthly Proportion of Incidents in Citta30 Areas", -->
<!--     x = "Month-Year", -->
<!--     y = "Percentage (on monthly total)", -->
<!--     color = "Same Limit" -->
<!--   ) + -->

<!--     geom_vline(xintercept = as.Date("2024-01-07"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) -->
<!-- ``` -->


<!-- ```{r} -->
<!-- # Read the GeoJSON file -->
<!-- citta30_final <- suppressMessages(st_read(here("..", "datasets", "citta30_final.geojson"))) -->

<!-- # Convert date column to Date format -->
<!-- citta30_final <- citta30_final %>% -->
<!--   mutate(DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM)) -->

<!-- monthly_counts <- citta30_final %>% -->
<!--   mutate(month = floor_date(DATA_ARRIVO_CHIAM, "month")) %>% -->
<!--   group_by(month) %>% -->
<!--   mutate(month_count = n()) %>% -->
<!--   group_by(year, month, treated) %>% -->
<!--     mutate(count = n(), .groups = "drop") %>% -->
<!--     mutate(proportion = count / month_count) %>%  # Normalize by total counts of that year -->
<!--     mutate(year = year) -->


<!-- # Ensure months are properly labeled for x-axis -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(month_label = format(month, "%b %Y"))  # Convert to "Jan 2023", "Feb 2023", etc. -->

<!-- # Define custom colors -->
<!-- custom_colors <- c("0" = "red", "1" = "blue") -->

<!-- # 🚀 Plot using ggplot2 -->
<!-- ggplot(monthly_counts, aes( -->
<!--     x = month, y = count,  -->
<!--     color = treated)) + -->
<!--   geom_line(size = 1) + -->
<!--   geom_point() + -->

<!--   # Ensure x-axis labels show proper months with years -->
<!--   scale_x_date( -->
<!--     date_labels = "%b %Y",  # Format labels as "Jan 2023", "Feb 2023", etc. -->
<!--     date_breaks = "1 month",  # Ensure monthly breaks -->
<!--     expand = c(0.01, 0.01)  # Prevents cutting off first and last labels -->
<!--   ) + -->

<!--   # scale_color_manual(values = custom_colors) +  # Apply custom colors -->
<!--   labs( -->
<!--     title = "Monthly Proportion of Incidents in Citta30 Areas", -->
<!--     x = "Month-Year", -->
<!--     y = "Percentage (on monthly total)", -->
<!--     color = "Treated" -->
<!--   ) + -->

<!--     geom_vline(xintercept = as.Date("2024-01-07"), linetype = "dashed", color = "black") +  # Dashed line for clarity -->

<!--   theme_minimal() + -->
<!--   theme( -->
<!--     plot.title = element_text(hjust = 0.5, size = 16),  # Center the title -->
<!--     axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels for readability -->
<!--   ) -->
<!-- ``` -->

<!-- ```{r} -->
<!-- # Load necessary packages -->
<!-- library(dplyr) -->
<!-- library(lubridate) -->
<!-- library(fixest) -->

<!-- # ============================================================================= -->
<!-- # 1. Prepare the Data -->
<!-- # ============================================================================= -->
<!-- # Assume your original data (citta30_final) has a DATE column and a year variable. -->
<!-- # Convert date column to Date format and compute the month, as done previously. -->
<!-- citta30_final <- citta30_final %>% -->
<!--   mutate(DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM), -->
<!--          month = floor_date(DATA_ARRIVO_CHIAM, "month")) -->

<!-- # Assume the policy change occurs on January 1, 2024. -->
<!-- policy_date <- as.Date("2024-01-01") -->

<!-- # Create an event time variable (in months relative to the policy change). -->
<!-- # Negative values: pre-policy; positive values: post-policy. -->
<!-- monthly_counts <- citta30_final %>% -->
<!--   mutate(event_time = as.numeric(interval(policy_date, month) / months(1))) %>% -->
<!--   group_by(year, month, treated, event_time) %>% -->
<!--   summarise(count = n(), .groups = "drop") %>% -->
<!--   # Compute total accidents per month across treated and control groups. -->
<!--   group_by(month) %>% -->
<!--   mutate(month_total = sum(count)) %>% -->
<!--   ungroup() %>% -->
<!--   # Compute the proportion of accidents in each cell. -->
<!--   mutate(proportion = count / month_total) -->

<!-- # ============================================================================= -->
<!-- # 2. Run the Event Study Regression with fixest -->
<!-- # ============================================================================= -->
<!-- # The fixest 'i()' operator creates dummy variables for each event time, -->
<!-- # interacted with the treated indicator. -->
<!-- # We choose event_time = -1 as the reference period. -->
<!-- event_model <- feols(count ~ i(event_time, ref2 = "untreated", -1), data = monthly_counts) -->

<!-- # ============================================================================= -->
<!-- # 3. Plot the Event Study Coefficients -->
<!-- # ============================================================================= -->
<!-- # fixest provides iplot() to plot the coefficients for the interaction terms. -->
<!-- iplot(event_model) -->
<!-- ``` -->

<!-- ```{r} -->
<!-- library(dplyr) -->
<!-- library(lubridate) -->
<!-- library(fixest) -->

<!-- # ----------------------------------------------------------------------------- -->
<!-- # Assume monthly_counts is already created and includes: -->
<!-- # - proportion: the outcome variable (proportion of accidents) -->
<!-- # - treated: originally a factor with levels "treated" and "untreated" -->
<!-- # - post: a numeric indicator for post-policy (1 for 2024, 0 for 2023) -->
<!-- # ----------------------------------------------------------------------------- -->

<!-- # Recode the 'treated' variable to numeric (0 for "untreated", 1 for "treated") -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(treated = ifelse(treated == "treated", 1, 0)) -->

<!-- # Optionally, ensure that the post variable is numeric (if not already) -->
<!-- monthly_counts <- monthly_counts %>% -->
<!--   mutate(post = as.numeric(post)) -->

<!-- # ----------------------------------------------------------------------------- -->
<!-- # Run the Difference-in-Differences Regression Using fixest -->
<!-- # ----------------------------------------------------------------------------- -->
<!-- did_model <- feols(proportion ~ treated * post, data = monthly_counts) -->
<!-- summary(did_model) -->

<!-- # The model output now displays coefficients for: -->
<!-- # - treated: the baseline difference between treated and control (when post = 0) -->
<!-- # - post: the time trend for the control group -->
<!-- # - treated:post: the DiD effect -->
<!-- etable(did_model) -->
<!-- ``` -->





<!-- <!-- ```{r Seriousness graph, echo=FALSE, fig.height=6, fig.width=10, message=FALSE, warning=FALSE, paged.print=FALSE,fig.align = 'center'} --> -->
<!-- <!-- ssn_data <- read_feather(here("..","datasets", "ssn_new.feather")) --> -->

<!-- <!-- # Convert `DATA_ARRIVO_CHIAM` to Date format if necessary --> -->
<!-- <!-- ssn_data <- ssn_data %>% --> -->
<!-- <!--   mutate( --> -->
<!-- <!--     DATA_ARRIVO_CHIAM = as.Date(DATA_ARRIVO_CHIAM),  # Ensure it's a Date --> -->
<!-- <!--     year = year(DATA_ARRIVO_CHIAM),   # Extract year --> -->
<!-- <!--     month = floor_date(DATA_ARRIVO_CHIAM, "month")   # Extract month (rounded) --> -->
<!-- <!--   ) --> -->

<!-- <!-- # Aggregate data by (year, month, CRITICITA_ASSEG) --> -->
<!-- <!-- monthly_counts <- ssn_data %>% --> -->
<!-- <!--   mutate(month = floor_date(DATA_ARRIVO_CHIAM, "month")) %>% --> -->
<!-- <!--   group_by(month) %>% --> -->
<!-- <!--   mutate(month_count = n()) %>% --> -->
<!-- <!--   group_by(year, month, CRITICITA_ASSEG) %>% --> -->
<!-- <!--     mutate(count = n(), .groups = "drop") %>% --> -->
<!-- <!--     mutate(proportion = count / month_count) %>%  # Normalize by total counts of that year --> -->
<!-- <!--     mutate(year = year) --> -->

<!-- <!-- # Convert `month` to a readable format (abbreviations like "Jan", "Feb", etc.) --> -->
<!-- <!-- monthly_counts <- monthly_counts %>% --> -->
<!-- <!--   mutate(month_label = format(month, "%b")) --> -->

<!-- <!-- custom_colors <- c("2023 - V" = "green", "2024 - V" = "darkgreen", "2023 - G" = "yellow2", "2024 - G" = "orange", "2023 - R" = "red", "2024 - R" = "darkred") --> -->


<!-- <!-- # Plot using ggplot --> -->
<!-- <!-- ggplot(monthly_counts, aes(x = month_label, y = proportion,  --> -->
<!-- <!--                            color = interaction(year, CRITICITA_ASSEG, sep = " - "), --> -->
<!-- <!--                            group = interaction(year, CRITICITA_ASSEG))) + --> -->
<!-- <!--   geom_line(size = 1) + --> -->
<!-- <!--   geom_point() + --> -->
<!-- <!--   scale_x_discrete(limits = month.abb) +  # Ensure months appear in order --> -->
<!-- <!--   scale_color_manual(values = custom_colors) +  # Apply custom colors --> -->
<!-- <!--   scale_y_continuous(labels = percent_format()) +  # Convert y-axis to percentages --> -->
<!-- <!--   labs( --> -->
<!-- <!--     title = "Monthly Trends of Incidents by Criticità Asseg and Year", --> -->
<!-- <!--     x = "", --> -->
<!-- <!--     y = "Percentage of Incidents (on monthly total)", --> -->
<!-- <!--     color = "Year - Criticità" --> -->
<!-- <!--   ) + --> -->
<!-- <!--   theme_minimal() + --> -->
<!-- <!--   theme(plot.title = element_text(hjust = 0.5,size = 16))  # Center the title --> -->
<!-- <!-- ``` --> -->



