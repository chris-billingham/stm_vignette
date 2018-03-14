library(tidyverse)
library(jsonlite)
library(lubridate)

# download the amazon video games review file from here
if(!file.exists("data/data.gz")) {
  download.file("http://snap.stanford.edu/data/amazon/productGraph/categoryFiles/reviews_Video_Games_5.json.gz","data/data.gz")
}
# import the raw json data, split out helpful then drop it,
# then fix up the reviewTime

data <- file("data/data.gz") %>% 
  jsonlite::stream_in(.) %>%
  dplyr::mutate(yes_help = purrr::map_int(helpful, 1), all_help = purrr::map_int(helpful, 2)) %>%
  dplyr::select(-helpful) %>%
  dplyr::mutate(reviewTime =  lubridate::mdy(reviewTime))