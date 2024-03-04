## Fish conspecific social behaviour meta-analyses search deduplication 

rm(list= ls())


## Load Packages
pacman::p_load(tidyverse,
               synthesisr,
               tidystringdist,
               bibliometrix,
               here)

# Load file with all searcges combined 
dat <-  read.csv(here("literature_search", "all_search_combined", "all_search_combined_with_duplicates.csv"), skip = 0)
dim(dat)

# Remove all punctuation
dat$title2 <- str_replace_all(dat$title,"[:punct:]","") %>% 
  str_replace_all(.,"[ ]+", " ") %>% 
  tolower()

# Remove exact titles
dat2 <- distinct(dat, title2, .keep_all = TRUE) 
dim(dat2) # 4292 remain 


# Save file
write_csv(dat2, here("literature_search", "all_search_combined", "fish_soc_ma_abstracts_for_screening_deduplicated.csv"))


