library(tidyverse)
library(patchwork)
library(RCurl)

### Reading data and wrangling -------

toplot2 <- read.csv(text = getURL('https://raw.githubusercontent.com/Fabbiologia/BluePaper-10_Supplementary_informations/master/data/world_wilderness_protected.csv')) %>% 
        mutate_at(vars(Wilderness:mpa_marine_nt), list(~(./Total)*100)) %>% 
        select(-Total) %>% 
        pivot_longer(-Habitat, names_to = "type", values_to = "percent") %>% 
        mutate(Habitat = factor(.$Habitat, 
                                labels=c("Cold Corals", 
                                         "Coral Reefs",
                                         "Estuaries", 
                                         "Hydrothermal vents",
                                         "Kelp", 
                                         "Mangroves", 
                                         "Ridges",
                                         "Saltmarshes", 
                                         "Seagrasses",
                                         "Seamounts and Guyots", 
                                         "Shelf and Canyons",
                                         "Trenches")))


toplot2$Habitat <-
        factor(toplot2$Habitat, levels = c(
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


toplot2$type <- factor(
        toplot2$type,
        labels = c(
                'All PAs',
                'All PAs Managed',
                'All PAs NT',
                'Coastal PAs',
                'Coastal PAs Managed',
                'Coastal PAs NT',
                'Marine MPAs',
                'MPAs Managed',
                'MPAs NT', 
                'Wilderness'
        )
)       


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


p1 <- ggplot(filter(toplot2, type == "Wilderness"), aes(x=Habitat, y=percent, fill=type))+
        geom_rect(xmin=0, xmax=13, ymin=-Inf, ymax=Inf, fill=day_colour)+
        # gradient backgrounds for sunrise and sunset
        geom_rect(data = sunrise_pd,
                  mapping = aes(xmax = xmax,
                                xmin = xmin,
                                ymax = ymax,
                                ymin = ymin),
                  fill = sunrise_pd$grad_colours,
                  inherit.aes = FALSE) +
        geom_col(aes(fill=type), position = "dodge", col="black" , alpha=0.3)+
        scale_fill_manual(values=c("gray10"), labels = c("% of wilderness area"))+
        labs(x="", y="% of area worldwide", title = "B")+
        theme(legend.position = "bottom",
              legend.title = element_blank(),
              panel.grid = element_blank(), 
              strip.background = element_blank(), 
              axis.text.x = element_text(angle=90))

p2 <- ggplot(filter(toplot2, type %in% c('All PAs','All PAs Managed', 'All PAs NT')), aes(x=Habitat, y=percent, fill=type))+
        geom_rect(xmin=0, xmax=13, ymin=-Inf, ymax=Inf, fill=day_colour)+
        # gradient backgrounds for sunrise and sunset
        geom_rect(data = sunrise_pd,
                  mapping = aes(xmax = xmax,
                                xmin = xmin,
                                ymax = ymax,
                                ymin = ymin),
                  fill = sunrise_pd$grad_colours,
                  inherit.aes = FALSE) +
        geom_col(aes(fill=type), position = "dodge", col="black" , alpha=0.3)+
        scale_fill_manual(values=c("white", "gray50", "black"), labels = c(" % within MPAs", "% within managed MPAs", "% within fully MPAs"))+
        labs(x="", y="% of area worldwide", title = "A")+
        theme(legend.position = "top",
              legend.title = element_blank(),
              panel.grid = element_blank(), 
              strip.background = element_blank(), 
              axis.text.x = element_blank())

p2/p1

### uncomment to save ------
ggsave('figs/Figure_9.pdf', width = 5, height = 8)
# ggsave('figs/Figure_9.tiff', dpi=300, width = 5, height = 8)


# END OF SCRIPT ------