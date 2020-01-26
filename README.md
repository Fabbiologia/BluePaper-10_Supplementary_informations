# Code instructions 

We assume some basic knowledge of the R programming language. If instructions are followed, this should be fully reproducible using R studio. For further comments on the results of this analysis please refer to the main paper, or please find [**the contacts informations**][Contacts] to get in touch with the authors to report bugs or problems. 

Data and R code scripts to replicate figures and analysis can be downloaded from [**here**](https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations).

Wrangled datasets of all the data mentioned in Table SI and SII are available in the [`data`](https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations/tree/master/data) folder.

Download an .Rmd version of this file from [**here**](https://raw.githubusercontent.com/Fabbiologia/BluePaper-10_Supplementary_informations/master/01-Supplementary_material.Rmd).

The R code was built with `r getRversion()` and was written using R-studio IDE (v.1.2.5033), as well as this document, using the following packages that can be installed in R or through R-studio using the following commands: 

- `install.packages("dplyr")`
- `install.packages("ggplot2")`
- `install.packages("readr")`
- `install.packages("cowplot")`
- `install.packages("ggthemes")`
- `install.packages("broom")`
- `install.packages("knitr")`
- `install.packages("RCurl")`

Datasets are stored in the `data` folder and are five `.csv` text files:

- `habitat_data`: which contains all the habitat extensions in squared kilometers for each country, as well as the area of each country Exclusive Economic Zone (EEZ) and total MPA area both in squared kilometers;
- `habitat_protected`: which contains how much of each habitat within each country is protected (protected);
- `International_agreements`: which contains information about the international conventions / agreements made over the years to protect marine and oceanic waters; 
- `pressures_gdp_biodiversity`: which contains the environmental pressures, the total GDP (Gross Domestic Product in USD) and the estimated biodiversity for each of the country;
- `wilderness_protected`: which contains % of wilderness within each of the habitat selected (wilderness is from Jones et al., 2018); and how much of the habitat is under protection globally (expressed as a %). 


---

While all data used are available open source, some have rules for their use. 
Therefore, these data cannot be shared without explicit permission from the data providers. 

Additional info can be found in the supplementary material [text](https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations/blob/master/Supplementary_material_Marine_biodiversity_in_a_changing_world.pdf). 


# Contacts: 
- favoretto.fabio@gmail.com
- jkumagai96@gmail.com

