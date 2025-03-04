% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_questions.R
\name{extract_type_orientation}
\alias{extract_type_orientation}
\title{Extract Type and Orientation}
\usage{
extract_type_orientation(type)
}
\arguments{
\item{type}{A character string indicating the type of a question, which may optionally
include an orientation separated by \code{"<|>"}. For example: \code{"ordering<|>h"},
\code{"ordering<|>v"}, or just \code{"ordering"}.}
}
\value{
A list with two elements:
\describe{
\item{type}{The main question type as a character string.}
\item{orientation}{The orientation of the type as a character string. Defaults to \code{"v"}.}
}
}
\description{
This function takes a string representing a question type and its optional orientation
(e.g., \code{"ordering<|>h"}) and splits it into two separate components: the type and
the orientation. If the orientation is not provided, it defaults to \code{"v"}.
}
\keyword{internal}
