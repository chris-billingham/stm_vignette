# initial text processing

library(stm)

# use stm base processing all initial settings but stripping some html
# and removing any mad characters
processed_data <- stm::textProcessor(data$reviewText, metadata = data, 
                                     striphtml = TRUE, onlycharacter = TRUE)
