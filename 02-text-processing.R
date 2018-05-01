# initial text processing
options(scipen=999)
library(stm)
library(textstem)

# lemmatise text because i hate stemming
data$review_lemma <- textstem::lemmatize_strings(data$reviewText)

# use caret to split the data set for a sample 10%, we're going to use for the initial
# modelling to speed things up.
split_index <- caret::createDataPartition(data$overall, p = 0.1, list = FALSE)

data_train <- data[split_index,]
data_test <- data[-split_index,]

# run through the processed data step, stripping out html and leaving only characters
processed_data <- stm::textProcessor(data_train$review_lemma, metadata = data_train, 
                                     striphtml = TRUE, 
                                     stem = FALSE,
                                     onlycharacter = TRUE)



# what's the effect of removing low frequency tokens
stm::plotRemoved(processed_data$documents, seq(1, 100, by=1))

# text processing
out <- stm::prepDocuments(documents = processed_data$documents,
                     vocab = processed_data$vocab,
                     meta = processed_data$meta,
                     lower.thresh = 15)



