
<!-- README.md is generated from README.Rmd. Please edit that file -->

# unstats

<!-- badges: start -->
<!-- badges: end -->

This a golem-based shiny application for exploring UN statistics data
about various countries. It was developed to support a workshop on
testing shiny applications using {testthat}, `shiny::testServer` and
{shinytest2} in Summer 2023.

## Installation

If you are a workshop attendee, you should download the repository
either

- using RStudio
  - Go to “File -\> New Project”
  - Click on “Version Control: Checkout a project from a version control
    repository”
  - Click on “Git: Clone a project from a repository”
  - Fill in the URL of the project
    `https://github.com/jumpingrivers/shinytest-workshop-app.git`
- or using the command line (eg. the ‘terminal’ window in your RStudio
  session):

``` bash
# 1) Git over SSH:
git clone git@github.com:jumpingrivers/shinytest-workshop-app.git
# or 2) Git over HTTPs
git clone https://github.com/jumpingrivers/shinytest-workshop-app.git
# or 3) Downloading the .zip file from github: https://github.com/jumpingrivers/shinytest-workshop-app
```

Once you have cloned the project, and opened it in RStudio, you can
install all the dependencies used by the package, and required by the
workshop by using

``` r
install.packages("devtools")
devtools::install(dependencies = TRUE)
```

If you just want to use the application, you can install the development
version of unstats like so:

``` r
remotes::install_github("jumpingrivers/shinytest2-workshop-app")
```

## Example

To run the app

``` r
library("unstats")
run_app()
```
