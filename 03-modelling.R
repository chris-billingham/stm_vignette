# base model stm

#review_fit <- stm(documents = out$documents,
#                  vocab = out$vocab,
#                  K = 20,
#                  prevalence = ~ s(overall) + s(yday(reviewTime)),
#                  max.em.its = 75,
#                  data = out$meta)

review_fit <- stm(documents = out$documents,
                  vocab = out$vocab,
                  prevalence = ~ s(overall),
                  K = 0,
                  max.em.its = 500,
                  reportevery = 5,
                  LDAbeta = FALSE,
                  data = out$meta)

labels <- labelTopics(review_fit)

sage <- sageLabels(review_fit)

test_email <- mime(
  To = "chris.billingham@gmail.com",
  From = "chris.billingham@gmail.com",
  Subject = "this is just a gmailr test",
  body = as.data.frame(labels$prob))

send_message(test_email)
  
  
  