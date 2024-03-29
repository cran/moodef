

#' Generate `ordering` question
#'
#' @param answer A vector of strings.
#' @param n An integer, number or answers.
#' @param rest A vector, rest of answers.
#' @param correct_feedback A string.
#' @param partially_correct_feedback A string.
#' @param incorrect_feedback A string.
#' @param orientation A string, 'h' or 'v'.
#'
#' @return A string.
#' @keywords internal
generate_ordering <-
  function(answer,
           n,
           rest,
           correct_feedback,
           partially_correct_feedback,
           incorrect_feedback,
           orientation) {
    if (orientation == 'h') {
      orientation <- 'HORIZONTAL'
    } else {
      orientation <- 'VERTICAL'
    }
    question <- glue::glue(
      '

    <defaultgrade>1</defaultgrade>
    <penalty>0.3333333</penalty>
    <hidden>0</hidden>
    <idnumber></idnumber>
    <layouttype>{orientation}</layouttype>
    <selecttype>ALL</selecttype>
    <selectcount>0</selectcount>
    <gradingtype>ABSOLUTE_POSITION</gradingtype>
    <showgrading>SHOW</showgrading>
    <numberingstyle>none</numberingstyle>
    <correctfeedback format="html">
      <text>{correct_feedback}</text>
    </correctfeedback>
    <partiallycorrectfeedback format="html">
      <text>{partially_correct_feedback}</text>
    </partiallycorrectfeedback>
    <incorrectfeedback format="html">
      <text>{incorrect_feedback}</text>
    </incorrectfeedback>
    <shownumcorrect>1</shownumcorrect>
    <answer fraction="1.0000000" format="moodle_auto_format">
      <text>{answer}</text>
    </answer>
'
    )

    others <- NULL
    i <- 1
    for (r in rest) {
      i <- i + 1
      fraction <- paste0(i, '.0000000')
      others <- paste0 (
        others,
        glue::glue(
          '

    <answer fraction="{fraction}" format="moodle_auto_format">
      <text>{r}</text>
    </answer>
'
        )
      )
    }

    question_body <- paste0(question, others, '
    <hint format="html">
      <text></text>
    </hint>
    <hint format="html">
      <text></text>
    </hint>')
    question_body
  }
