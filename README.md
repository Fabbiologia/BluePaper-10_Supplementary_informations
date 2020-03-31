# Code instructions 

We assume some basic knowledge of the R programming language. If instructions are followed, this should be fully reproducible using R studio. For further comments on the results of this analysis please refer to the main paper, or please find [**the contacts informations**][Contacts] to get in touch with the authors to report bugs or problems. 

Data and R code scripts to replicate figures and analysis can be downloaded from [**here**](https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations).

Wrangled datasets of all the data mentioned in Table SI and SII are available in the [`data`](https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations/tree/master/data) folder.


The R code was built with `r getRversion()` and was written using R-studio IDE (v.1.2.5033), as well as this document, using the following packages that can be installed in R or through R-studio using the following commands: 

- `install.packages("tidyverse")`
- `install.packages("readr")`
- `install.packages("cowplot")`
- `install.packages("ggthemes")`
- `install.packages("broom")`
- `install.packages("knitr")`
- `install.packages("RCurl")`
- `install.packages("janitor")`
- `install.packages("vegan")`
- `install.packages("ggfortify")`
- `install.packages("cluster")`
- `install.packages("factoextra")`
- `install.packages("FactoMineR")`
- `install.packages("stringr")`
- `install.packages("igraph")`
- `install.packages("tools")`


Datasets are stored in the `data` folder and are five `.csv` text files:

- `HabitatProtectedDataset`: which contains all the habitat extensions in pixels for each country, as well as the area of each country Exclusive Economic Zone (EEZ);
- `International_agreements`: which contains information about the international conventions / agreements made over the years to protect marine and oceanic waters; 
- `pressures_gdp_biodiversity`: which contains the environmental pressures, the total GDP (Gross Domestic Product in USD) and the estimated biodiversity for each of the country;
- `world_wilderness_protected`: which contains % of wilderness within each of the habitat selected (wilderness is from Jones et al., 2018); and how much of the habitat is under protection globally (expressed as number of pixels). 


---

While all data used are available open source, some have rules for their use. 
Therefore, these data cannot be shared without explicit permission from the data providers. 


# Contacts: 
- favoretto.fabio@gmail.com
- jkumagai96@gmail.com

