## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(moodef)

qc <- question_category(category = 'Initial test',
                        copyright = 'Copyright © 2024 Universidad de Granada',
                        license = 'License Creative Commons Attribution-ShareAlike 4.0',
                        adapt_images = TRUE)

## -----------------------------------------------------------------------------
qc <- question_category(category = 'Initial test',
                        first_question_number = 1,
                        copyright = 'Copyright © 2024 Universidad de Granada',
                        license = 'License Creative Commons Attribution-ShareAlike 4.0',
                        correct_feedback = 'Correct.',
                        partially_correct_feedback = 'Partially correct.',
                        incorrect_feedback = 'Incorrect.',
                        adapt_images = TRUE,
                        width = 800,
                        height = 600)

## ----example1-----------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'Describe the addition operation.'
  )

## ----example2-----------------------------------------------------------------
qc <- qc |>
  define_question(
    type = 'x',
    question = 'Place the name of the operations as they appear in the figure.',
    image = system.file("extdata", "ops.png", package = "moodef"),
    image_alt = 'Operations',
    answer = 'Addition',
    a_1 = 'Multiplication',
    a_2 = 'Division',
    a_3 = 'Subtraction'
  )

## -----------------------------------------------------------------------------
file <- create_question_csv(file = tempfile(fileext = '.csv'))

## -----------------------------------------------------------------------------
file <- system.file("extdata", "questions.csv", package = "moodef")
qc <- qc |>
  define_questions_from_csv(file)

## -----------------------------------------------------------------------------
file <- system.file("extdata", "questions_image.csv", package = "moodef")
df <- read_question_csv(file = file)

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(df, split.table = Inf)

## -----------------------------------------------------------------------------
df[1, 'image'] <- system.file("extdata", "divide.png", package = "moodef")
df[2, 'image'] <- system.file("extdata", "ops.png", package = "moodef")

## -----------------------------------------------------------------------------
s <- vector_to_string(c('Addition', '+'))
s

## -----------------------------------------------------------------------------
qc <- qc |>
  define_questions_from_data_frame(df)

## -----------------------------------------------------------------------------
file <- tempfile(fileext = '.xml')
qc <- qc |>
  generate_xml_file(file)

## -----------------------------------------------------------------------------
file.size(file)

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'Describe the addition operation.'
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'The square root is a basic arithmetic operation.',
    answer = 'False'
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'What is the result of SQRT(4)?',
    answer = '2',
    a_1 = '-2'
  ) |>
  define_question(
    question = 'What is the result of 4/3?',
    answer = c('1.33', '0.03')
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'What basic operation does it have as a + symbol?',
    answer = 'Addition'
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'What are the basic arithmetic operations?',
    answer = 'Addition, subtraction, multiplication and division.',
    a_1 = 'Addition and subtraction.',
    a_2 = 'Addition, subtraction, multiplication, division and square root.'
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    type = 'h',
    question = 'Order the result from smallest to largest.',
    answer = '6/2',
    a_1 = '6-2',
    a_2 = '6+2',
    a_3 = '6*2'
  ) |>
  define_question(
    type = 'x',
    question = 'Order the result from smallest to largest.',
    answer = '6/2',
    a_1 = '6-2',
    a_2 = '6+2',
    a_3 = '6*2'
  ) 

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'The symbol for addition is [[1]], the symbol for subtraction is [[2]].',
    answer = '+',
    a_1 = '-'
  ) |>
  define_question(
    type = 'x',
    question = 'The symbol for addition is [[1]], the symbol for subtraction is [[2]].',
    answer = '+',
    a_1 = '-'
  )

## -----------------------------------------------------------------------------
qc <- qc |>
  define_question(
    question = 'Match each operation with its symbol.',
    answer = c('Addition', '+'),
    a_1 = c('Subtraction', '-'),
    a_2 = c('Multiplication', '*')
  )

