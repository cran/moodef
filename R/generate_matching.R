

#' Generate `matching` question
#'
#' @param answer A vector of strings.
#' @param n An integer, number or answers.
#' @param rest A vector, rest of answers.
#' @param correct_feedback A string.
#' @param partially_correct_feedback A string.
#' @param incorrect_feedback A string.
#'
#' @return A string.
#' @keywords internal
generate_matching <-
  function(answer,
           n,
           rest,
           correct_feedback,
           partially_correct_feedback,
           incorrect_feedback) {
    question <- glue::glue(
      '

    <defaultgrade>1.0000000</defaultgrade>
    <penalty>0.3333333</penalty>
    <hidden>0</hidden>
    <idnumber></idnumber>
    <shuffleanswers>true</shuffleanswers>
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
    <subquestion format="html">
      <text><![CDATA[<p>{answer[1]}<br></p>]]></text>
      <answer>
        <text>{answer[2]}</text>
      </answer>
    </subquestion>
'
    )

    others <- NULL
    for (r in rest) {
      r <- string_to_vector(r)
      others <- paste0 (
        others,
        glue::glue(
          '

    <subquestion format="html">
      <text><![CDATA[<p>{r[1]}<br></p>]]></text>
      <answer>
        <text>{r[2]}</text>
      </answer>
    </subquestion>
'
        )
      )
    }

    question_body <- paste0(question, others)
    question_body
  }
