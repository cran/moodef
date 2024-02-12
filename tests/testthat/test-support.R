test_that("support", {
  s <- vector_to_string(c('Addition', '+'))
  s2 <- vector_to_string(NULL)
  s3 <- vector_to_string("")

  df <- create_question_data_frame()

  file <- tempfile(fileext = '.csv')
  f <- create_question_csv(file = file)

  file2 <-
    system.file("extdata", "questions.csv", package = "moodef")
  df2 <- read_question_csv(file = file2)

  expect_equal(s, "Addition<|>+")
  expect_equal(s2, "")
  expect_equal(s3, "")

  expect_equal(df,
               structure(
                 list(
                   type = character(0),
                   question = character(0),
                   image = character(0),
                   image_alt = character(0),
                   answer = character(0),
                   a_1 = character(0),
                   a_2 = character(0),
                   a_3 = character(0)
                 ),
                 class = "data.frame",
                 row.names = integer(0)
               ))

  expect_equal(file, f)

  expect_equal(nrow(df2), 11)

  expect_equal(names(df2),
               c(
                 "type",
                 "question",
                 "image",
                 "image_alt",
                 "answer",
                 "6",
                 "7",
                 "8"
               ))

})