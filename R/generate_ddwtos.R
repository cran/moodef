#' Generate `ddwtos` question
#'
#' @param answer A vector of strings.
#' @param a_values A vector, rest of answers.
#' @param correct_feedback A string.
#' @param incorrect_feedback A string.
#' @param partially_correct_feedback A string.
#'
#' @return A string.
#' @keywords internal
generate_ddwtos <-
  function(answer,
           a_values,
           correct_feedback,
           incorrect_feedback,
           partially_correct_feedback) {
    question <- glue::glue(
      '

    <shuffleanswers>1</shuffleanswers>
    <correctfeedback format="html">
      <text>{correct_feedback}</text>
    </correctfeedback>
    <partiallycorrectfeedback format="html">
      <text>{partially_correct_feedback}</text>
    </partiallycorrectfeedback>
    <incorrectfeedback format="html">
      <text>{incorrect_feedback}</text>
    </incorrectfeedback>
    <shownumcorrect/>
    <dragbox>
      <text>{answer}</text>
      <group>1</group>
    </dragbox>
'
    )

    others <- NULL
    for (r in a_values) {
      others <- paste0 (others,
                        glue::glue('

    <dragbox>
      <text>{r}</text>
      <group>1</group>
    </dragbox>
'))
    }

    question_body <- paste0(question, others)
    question_body
  }
