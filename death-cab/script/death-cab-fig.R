## Tracey Mangin
## October 20, 2022
## Death Cab For Cutie set list

## attach libraries
library(tidyverse)
library(here)
library(viridis)

## file
setlist_file <- 'sb_bowl_101922.csv'

## read in file
setlist_df <- read_csv(paste0(here(), '/death-cab/data/', setlist_file)) %>%
  mutate(label = paste0(album, ' (', year, ')'))


## factor setlist songs
setlist_df$label <- factor(setlist_df$label, levels = c("Something About Airplanes (1998)",
                                                        "We Have the Facts and Were Voting Yes (2000)",
                                                        "The Photo Album (2001)",
                                                        "Transatlanticism (2003)",
                                                        "Plans (2005)",
                                                        "Narrow Stairs (2008)",
                                                        "Codes and Keys (2011)",
                                                        "Kintsugi (2015)",
                                                        "Thank You For Today (2018)",
                                                        "Asphalt Meadows (2022)"))

## figure
ggplot(setlist_df, aes(x = song_n, y = year, color = label)) +
  geom_point(size = 2) +
  geom_hline(yintercept = 1998, size = 0.6, lty = 1, color = "grey") +
  geom_hline(yintercept = 2011, size = 0.6, lty = 1, color = "grey") +
  geom_hline(yintercept = 2004, size = 1, lty = 2, color = "black") +
  geom_hline(yintercept = 2010, size = 1, lty = 2, color = "black") +
  geom_hline(yintercept = 2022.5, size = 1, lty = 2, color = "black") +
  annotate("text", x = 5, y = 1998.5, label = "Something About Airplanes (1998)", size = 2, color = 'grey') +
  annotate("text", x = 4, y = 2011.5, label = "Codes and Keys (2011)", size = 2, color = 'grey') +
  annotate("text", x = 9, y = 2003.5, label = "Dinosaurs", size = 3, color = 'black') +
  annotate("text", x = 9, y = 2009, label = "Medium old", size = 3, color = 'black') +
  annotate("text", x = 9, y = 2021, label = "New", size = 3, color = 'black') +
  labs(x = 'Song position',
       y = 'Album year') +
  # scale_color_viridis() +
  ylim(1998, 2023) +
  theme_bw() +
  theme(legend.position = 'bottom',
        legend.title = element_blank())

