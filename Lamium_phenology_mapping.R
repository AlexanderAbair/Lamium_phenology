#install_github('pjhanly/iNatTools')
library(dplyr)
library(raster)
library(ggplot2)
library(maps)
library(remotes)
library(iNatTools)

Lamium_amplexicaule_North_America_df <- iNat(taxon_id = 55459,            # Lamium amplexicaule
                                             place_id = 1,                # USA
                                             quality_grade = "research",
                                             term_id = 12,                # has phenology annotation
                                             term_value_id = 13,          # flowering
                                             acc_below = 10000,
                                             geoprivacy = "open",
                                             d1 = "2018-09-30",
                                             d2 = "2019-10-01",
                                             nelat = 48, nelng = 0, swlat = -20, swlng = -130)

# Preparing iNaturalist output dataframe

Lamium_amplexicaule_North_America_with_coordinates <- mutate(Lamium_amplexicaule_North_America_df,
                                                             long = unlist(Lamium_amplexicaule_North_America_df$geojson.coordinates)[ c(TRUE,FALSE) ],
                                                             lat  = unlist(Lamium_amplexicaule_North_America_df$geojson.coordinates)[ c(FALSE,TRUE) ])
LAMAMP_data.week_over_32 <- filter(Lamium_amplexicaule_North_America_with_coordinates,
                                   observed_on_details.week > 33)
LAMAMP_data.week_over_32.adjusted <- mutate(LAMAMP_data.week_over_32, 
                                            observed_on_details.week.adjusted = observed_on_details.week - 33)
LAMAMP_data.week_under_33 <- filter(Lamium_amplexicaule_North_America_with_coordinates,
                                    observed_on_details.week < 34)
LAMAMP_data.week_under_33.adjusted <- mutate(LAMAMP_data.week_under_33,
                                             observed_on_details.week.adjusted = observed_on_details.week + 18)
LAMAMP_data <- rbind(LAMAMP_data.week_over_32.adjusted,
                     LAMAMP_data.week_under_33.adjusted)

# US distribution mapping

us_map = map("usa")

LAMAMP_US_distribution <- ggplot() +
  geom_polygon(data = us_map,
               aes(x = long, y = lat, group = group),
               fill = "grey") +
  coord_quickmap() +
  geom_point(data = LAMAMP_data,
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red") +
  theme(plot.title       = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border     = element_blank(),
        panel.background = element_blank(),
        axis.text.x      = element_blank(),
        axis.text.y      = element_blank(),
        axis.ticks       = element_blank()) +
  labs(x = NULL,
       y = NULL,
       title = NULL)

ggsave(LAMAMP_US_distribution, 
       filename = "plots/LAMAMP_US_distribution.png",
       width = 6)

# Weekly phenology mapping
us_map = map("usa")

temp_plot <- ggplot() +
  geom_polygon(data = us_map,
               aes(x = long, y = lat, group = group),
               fill = "grey") +
  coord_quickmap() +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 50),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.25) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 51),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.5) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 52),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.75) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 1),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red") +
  theme(plot.title = element_blank(),
        axis.title.x = element_blank(), 
        axis.title.y = element_blank())

ggsave(temp_plot, 
       filename=paste("plots/", "weekly_subplots/", "LAMAMP_flowering_week_01.png", sep=""),
       width = 6)

temp_plot <- ggplot() +
  geom_polygon(data = us_map,
               aes(x = long, y = lat, group = group),
               fill = "grey") +
  coord_quickmap() +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 51),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.25) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 52),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.5) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 1),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red",
             alpha = 0.75) +
  geom_point(data = filter(LAMAMP_data, 
                           observed_on_details.week.adjusted == 2),
             mapping = aes(x = as.numeric(long),
                           y = as.numeric(lat)),
             color = "red") +
  theme(plot.title = element_blank(),
        axis.title.x = element_blank(), 
        axis.title.y = element_blank())

ggsave(temp_plot, 
       filename=paste("plots/", "weekly_subplots/", "LAMAMP_flowering_week_02.png", sep=""),
       width = 6)

for (week_number in c(3:9)){
  temp_plot <- ggplot() +
    geom_polygon(data = us_map,
                 aes(x = long, y = lat, group = group),
                 fill = "grey") +
    coord_quickmap() +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 3),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.25) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 2),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.5) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 1),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.75) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red") +
    theme(plot.title = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank())
  
  ggsave(temp_plot, 
         filename=paste("plots/", "weekly_subplots/", "LAMAMP_flowering_week_0", week_number, ".png", sep=""),
         width = 6)
}

for (week_number in c(10:52)){
  temp_plot <- ggplot() +
    geom_polygon(data = us_map,
                 aes(x = long, y = lat, group = group),
                 fill = "grey") +
    coord_quickmap() +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 3),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.25) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 2),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.5) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number - 1),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red",
               alpha = 0.75) +
    geom_point(data = filter(LAMAMP_data, 
                             observed_on_details.week.adjusted == week_number),
               mapping = aes(x = as.numeric(long),
                             y = as.numeric(lat)),
               color = "red") +
    theme(plot.title = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank())
  
  ggsave(temp_plot, 
         filename = paste("plots/", "weekly_subplots/", "LAMAMP_flowering_week_", week_number, ".png", sep = ""),
         width = 6)
}

# Making a density chart

for (week_number in c(1:9)){
  temp_density_plot <- ggplot() +
    geom_density(data = LAMAMP_data,
                 mapping = aes(x = observed_on_details.week.adjusted),
                 fill = "red") +
    theme(plot.title = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank()) +
    geom_vline(xintercept = 0, size = .01, alpha = .99) + # Keeps the grid to scale
    geom_vline(xintercept = 53, size = .01, alpha = .99) + # Keeps the grid to scale
    geom_vline(xintercept = week_number,
               color = "black",
               size = 3) +
    theme(plot.title = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border     = element_blank(),
          panel.background = element_blank(),
          axis.text.x      = element_blank(),
          axis.text.y      = element_blank(),
          axis.ticks       = element_blank())
  
  ggsave(temp_density_plot,
         filename = paste("plots/", "density_subplots/", "LAMAMP_flowering_week_0", week_number, "_density.png", sep = ""),
         width = 6,
         height = 1)
  }

for (week_number in c(10:52)){
  temp_density_plot <- ggplot() +
    geom_density(data = LAMAMP_data,
                 mapping = aes(x = observed_on_details.week.adjusted),
                 fill = "red") +
    theme(plot.title = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank()) +
    geom_vline(xintercept = 0, size = .01, alpha = .99) + # Keeps the grid to scale
    geom_vline(xintercept = 53, size = .01, alpha = .99) + # Keeps the grid to scale
    geom_vline(xintercept = week_number,
               color = "black",
               size = 3) +
    theme(plot.title       = element_blank(),
          axis.title.y     = element_blank(),
          axis.title.x     = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border     = element_blank(),
          panel.background = element_blank(),
          axis.text.x      = element_blank(),
          axis.text.y      = element_blank(),
          axis.ticks       = element_blank())
  
  ggsave(temp_density_plot,
         filename = paste("plots/", "density_subplots/", "LAMAMP_flowering_week_", week_number, "_density.png", sep = ""),
         width = 6,
         height = 1)
}
