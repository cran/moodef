% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/question_category.R
\name{define_extended_question}
\alias{define_extended_question}
\alias{define_extended_question.question_category}
\title{Define an extended question}
\usage{
define_extended_question(
  qc,
  category,
  type,
  fraction,
  id,
  name,
  author,
  fb_general,
  fb_correct,
  fb_partially,
  fb_incorrect,
  question,
  image,
  image_alt,
  answer,
  a_1,
  a_2,
  a_3,
  a_4,
  a_5,
  a_6,
  a_7,
  fb_answer,
  fb_a_1,
  fb_a_2,
  fb_a_3,
  fb_a_4,
  fb_a_5,
  fb_a_6,
  fb_a_7,
  tag_1,
  tag_2,
  tag_3,
  tag_4,
  tag_5,
  tag_6,
  tag_7,
  tag_8,
  tag_9
)

\method{define_extended_question}{question_category}(
  qc,
  category = "",
  type = "",
  fraction = 0,
  id = "",
  name = "",
  author = "",
  fb_general = "",
  fb_correct = "",
  fb_partially = "",
  fb_incorrect = "",
  question = "",
  image = "",
  image_alt = "",
  answer = "",
  a_1 = "",
  a_2 = "",
  a_3 = "",
  a_4 = "",
  a_5 = "",
  a_6 = "",
  a_7 = "",
  fb_answer = "",
  fb_a_1 = "",
  fb_a_2 = "",
  fb_a_3 = "",
  fb_a_4 = "",
  fb_a_5 = "",
  fb_a_6 = "",
  fb_a_7 = "",
  tag_1 = "",
  tag_2 = "",
  tag_3 = "",
  tag_4 = "",
  tag_5 = "",
  tag_6 = "",
  tag_7 = "",
  tag_8 = "",
  tag_9 = ""
)
}
\arguments{
\item{qc}{A question category object. It should have a \code{questions} data frame
where new questions will be added.}

\item{category}{A character string specifying the category of the question.}

\item{type}{A character string indicating the type of the question.}

\item{fraction}{A number between 0 and 1.}

\item{id}{A unique identifier for the question.}

\item{name}{A character string representing the name of the question.}

\item{author}{The name of the author of the question.}

\item{fb_general}{General feedback for the question.}

\item{fb_correct}{Feedback displayed when the correct answer is selected.}

\item{fb_partially}{Feedback displayed for partially correct answers.}

\item{fb_incorrect}{Feedback displayed for incorrect answers.}

\item{question}{The text of the question.}

\item{image}{Path to an image file associated with the question.}

\item{image_alt}{Alternative text describing the image for accessibility.
Required if an image is provided.}

\item{answer}{The correct answer to the question.}

\item{a_1}{Additional possible answer.}

\item{a_2}{Additional possible answer.}

\item{a_3}{Additional possible answer.}

\item{a_4}{Additional possible answer.}

\item{a_5}{Additional possible answer.}

\item{a_6}{Additional possible answer.}

\item{a_7}{Additional possible answer.}

\item{fb_answer}{Feedback for the correct answer.}

\item{fb_a_1}{Feedback for additional answer.}

\item{fb_a_2}{Feedback for additional answer.}

\item{fb_a_3}{Feedback for additional answer.}

\item{fb_a_4}{Feedback for additional answer.}

\item{fb_a_5}{Feedback for additional answer.}

\item{fb_a_6}{Feedback for additional answer.}

\item{fb_a_7}{Feedback for additional answer.}

\item{tag_1}{Tag to categorize the question.}

\item{tag_2}{Tag to categorize the question.}

\item{tag_3}{Tag to categorize the question.}

\item{tag_4}{Tag to categorize the question.}

\item{tag_5}{Tag to categorize the question.}

\item{tag_6}{Tag to categorize the question.}

\item{tag_7}{Tag to categorize the question.}

\item{tag_8}{Tag to categorize the question.}

\item{tag_9}{Tag to categorize the question.}
}
\value{
Returns the updated question category object.
}
\description{
This function allows users to define an extended question, including metadata,
feedback and optional image data.
}
\details{
Parameter values that are not defined are taken from the category definition,
if they are defined there.

The \code{fraction} attribute is used in various question types to determine how a
specific answer impacts the question's score. Specifically, for incorrect answers
in the \code{multichoice} and \code{truefalse} types, the value calculated by dividing
\code{fraction} by the number of incorrect answers available is considered as the
amount deducted in case of an incorrect response.

In the example provided, we have intentionally used the same structure as in
the \code{define_question()} function to demonstrate that any parameters not needed
do not need to be explicitly defined.
}
\examples{

qc <- question_category(category = 'Initial test') |>
  define_extended_question(
    question = 'What are the basic arithmetic operations?',
    answer = 'Addition, subtraction, multiplication and division.',
    a_1 = 'Addition and subtraction.',
    a_2 = 'Addition, subtraction, multiplication, division and square root.'
  )

}
\seealso{
Other question definition functions: 
\code{\link{define_question}()},
\code{\link{define_questions_from_csv}()},
\code{\link{define_questions_from_data_frame}()},
\code{\link{define_questions_from_excel}()},
\code{\link{generate_xml}()},
\code{\link{generate_xml_file}()},
\code{\link{question_category}()}
}
\concept{question definition functions}
