GenerateGradientData <- function(start_hour,
                                 stop_hour,
                                 start_colour,
                                 stop_colour,
                                 x_resolution = 100) {
        
        # define the colour palette
        colour_function <- colorRampPalette(
                c(start_colour, stop_colour),
                alpha = TRUE)
        
        # set up the rect coordinates
        x_range <- seq(start_hour,
                       stop_hour,
                       length.out = x_resolution + 1)
        grad_xmin <- x_range[-length(x_range)]
        grad_xmax <- x_range[c(1:x_resolution + 1)]
        
        # define colours
        grad_colours <- colour_function(x_resolution)
        
        # return data.frame
        data.frame(
                xmin = grad_xmin,
                xmax = grad_xmax,
                ymin = -Inf,
                ymax = Inf,
                grad_colours = grad_colours
        )
}

