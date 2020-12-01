#' @name Vars
#' @title Calculate column variances
#'
#' Form row and column variances for numeric arrays
#'
#' @param x a 2 dimensional numerical array
#'
#' @return A numeric or complex vector, of length equal to the number of columns (\code{colVars}) or rows (\code{rowVars}) of x. Each element contains the variance of the respective column or row.
#' @export colVars
#' @export rowVars
#'
#' @examples
#' mat <- matrix(rnorm(9), nrow = 3)
#' colVars(mat)
#' rowVars(mat)
colVars <- function(x) {
  apply(x, 2, stats::var)
}

#' @rdname Vars
rowVars <- function(x) {
  apply(x, 1, stats::var)
}

