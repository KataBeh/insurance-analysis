# Försäkringskostnader – analysera vilka faktorer som hänger ihop med kostnader

Du arbetar som analytiker på ett försäkringsbolag. Företaget har historiska data över kunder och kostnader, men vill bättre förstå om prissättningen verkar följa rimliga mönster och vilka faktorer som driver kostnader mest. De vill också undersöka om en regressionsmodell kan användas som stöd vid framtida prissättning av liknande kunder. Bolaget har samlat in information om kunder, livsstilsfaktorer, hälsorelaterade variabler och tidigare historik. Din uppgift är att analysera datat för att undersöka vilka variabler som verkar hänga ihop med försäkringskostnaderna mest. Målet är inte bara att beskriva datat, utan också att genomföra en regressionsanalys i R, tolka resultaten och diskutera hur modellen fungerar som beslutsstöd.

## Filer

-   `scripts/01_load_data.R`läser in data
-   `scripts/02_prepare_data.R`städar och förbereder data
-   `scripts/03_analysis.R`gör analysen
-   `scripts/04_figures.R`skapar och sparar figuren
-   `run_analysis.R`kör hela projektet

## Så kör du projektet

Öppna projektet i RStudio och kör `run_analysis.R`

## Tolkning och slutsatser

En huvudfil för rapport och sammanställning hittas i `report/results_report.qmd`

## Paket

-   tidyverse

## Output

Figurer sparas i `output/figures/`.

## Uppdrag

Din uppgift är att analysera vilka faktorer som verkar hänga ihop med försäkringskostnad och att bygga minst en regressionsmodell i R.

Du ska genomföra en analys där du:

-   undersöker och beskriver datat

-   städar och förbereder datat

-   gör statistiska sammanfattningar och visualiseringar

-   bygger och tolkar minst en regressionsmodell

-   diskuterar modellens styrkor, svagheter och begränsningar
