library(tidyverse)
library(patchwork)

### Data loading and wrangling ----

toplot <- read.csv(text = getURL('https://github.com/Fabbiologia/BluePaper-10_Supplementary_informations/blob/master/data/HabitatProtectedDataset.csv')) %>%
        filter(Cat %in% c('Total','mpa_all', 'mpa_all_m', 'mpa_all_nt')) %>% 
        pivot_wider(names_from = Cat, values_from = Pixel_count) %>% 
        replace(is.na(.), 0) %>% 
        mutate_at(vars(mpa_all:mpa_all_nt), list(~(./Total)*100)) %>% 
        filter(Total > 0) %>%   #This filter out absent habitats
        group_by(Habitat) %>% 
        mutate(mean_all = mean(mpa_all), median_all = median(mpa_all), 
                  mean_m = mean(mpa_all_m), median_m = median(mpa_all_m),
                  mean_nt = mean(mpa_all_nt), median_nt = median(mpa_all_nt)) %>% 
        ungroup() %>% 
        mutate(Habitat = factor(.$Habitat, 
                                labels=c("Cold Corals", 
                                         "Coral Reefs",
                                         "Estuaries", 
                                         "Kelp", 
                                         "Mangroves", 
                                         "Ridges",
                                         "Saltmarshes", 
                                         "Seagrasses",
                                         "Seamounts and Guyots", 
                                         "Shelf and Canyons",
                                         "Trenches",
                                         "Hydrothermal vents")))

toplot$Habitat <-
        factor(toplot$Habitat, levels = c(
                "Estuaries",
                "Mangroves",
                "Saltmarshes",
                "Seagrasses",
                "Coral Reefs",
                "Kelp",
                "Shelf and Canyons",
                "Cold Corals",
                "Seamounts and Guyots",
                "Trenches",
                "Hydrothermal vents",
                "Ridges"
        ))


toplot

### Data plotting -------

# day/night colours
night_colour <- c("aquamarine")
day_colour <- c("darkblue")


source("GeneratedGradientData.R")
# generate data for a one-hour sunrise gradient
sunrise_pd <- GenerateGradientData(start_hour = 0,
                                   stop_hour = 13,
                                   start_colour = night_colour,
                                   stop_colour = day_colour,
                                   x_resolution = 1000)

p1 <- ggplot(toplot, aes(x = Habitat, y = mpa_all, col=as.integer(Habitat), group=Habitat)) +
        geom_rect(xmin=0, xmax=13, ymin=-Inf, ymax=Inf, fill=day_colour)+
        # gradient backgrounds for sunrise and sunset
        geom_rect(data = sunrise_pd,
                  mapping = aes(xmax = xmax,
                                xmin = xmin,
                                ymax = ymax,
                                ymin = ymin),
                  fill = sunrise_pd$grad_colours,
                  inherit.aes = FALSE) +
        geom_jitter(size = 2, alpha = 0.5, width = 0.2, col="black", fill="white")+
        geom_hline(yintercept = 30, col="white", size=0.9)+
        geom_segment(aes(x = Habitat, xend = Habitat,
                         y = mean_all, yend = median_all), size = 0.1, col="white")+
        geom_point(aes(y= mean_all), size = 3, pch=21, fill="blue") +
        geom_point(aes(y= median_all), size = 3, pch=21, fill="red") +
        labs(x = NULL, y = "Area %") +
        ylim(0,100)+
        theme(legend.position = "none",
              panel.background = element_blank(),
              panel.grid = element_blank(), 
              axis.text.x = element_text(angle=90))
p1


### uncomment to save ------

# ggsave('figs/Figure_11.pdf')
# ggsave('figs/Figure_11.tiff')


# END OF SCRIPT ------
