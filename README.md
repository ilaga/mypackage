
<!-- README.md is generated from README.Rmd. Please edit that file -->

# How to Create an R Package

<!-- badges: start -->

<!-- badges: end -->

While the `mypackage` package calculates columns and row variances for a
matrix in R, this GitHub page and documents are meant to providie a
minimal working example and walkthrough for how to create an R package.
The main walkthrough is provided in the Walkthrough.pdf powerpoint and
relies heavily on [R Packages book](https://r-pkgs.org/index.html) by
Hadley Wickham and Jenny Bryan. This workshop shortens the contents of
the book into a 45 minute presentation.

# Steps to Create an R Package

## Step 0: Install and Load Library

``` r
install.packages(c("devtools","roxygen2", "usethis"))
library(devtools)
library(roxygen2)
library(usethis)
```

## Step 1: Create your package

``` r
usethis::create_package("mypackage")
```

## Step 2: Create Functions

``` r
usethis::use_r("myVars")
```

And copy these functions into that .R script.

``` r
colVars <- function(x) {
  apply(x, 2, stats::var)
}

rowVars <- function(x) {
  apply(x, 1, stats::var)
}
```

## Step 3: Test package

Let’s load the package in and run a check.

``` r
devtools::load_all()
devtools::check()
```

## Step 4: Edit DESCRIPTION FILE

Use `Ctrl + .` and type DESCRIPTION, or open it in the file pane. Fill
in all of the missing information, except for the license. To fill in
the license, use one of the following commands (there are more options,
but these are the most common).

``` r
usethis::use_mit_license()
usethis::use_gpl_license()
usethis::use_ccby_license()
```

## Step 5: Add Function Documention

Put your curse in the top function and go to “Code \> Insert roxygen
skeleton”. Fill in the information and run devtools::document() to
preview the file.

``` r
#' @name Vars
#' @title Calculate column and row variances
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


devtools::document()
help(Vars)
help(colVars)
help(rowVars)
```

## Step 6: Test the Install

``` r
devtools::install()
```

## Step 7: Write tests

``` r
usethis::use_testthat()
usethis::use_test("Vars")


test_that("colVar works", {
  mat <- rbind(
    c(1, 2, 7),
    c(3, 5, 9),
    c(5, 6, 1)
  )

  expect_equal(colVars(mat), c(var(c(1, 3, 5)), var(c(2, 5, 6)), var(c(7, 9, 1))))
  expect_equal(rowVars(mat), c(var(c(1, 2, 7)), var(c(3, 5, 9)), var(c(5, 6, 1))))
})


devtools::test()
devtools::check()
```

## Step 8: Importing Functions

``` r
use_package("lme4")
use_package("lme4", "Suggests")
```

## Step 9: Build Your Package

``` r
devtools::check()
devtools::build()
```
