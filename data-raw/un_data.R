## code to prepare `un_data` dataset goes here

un_data <- readr::read_csv("data-raw/country_profile_variables.csv")

usethis::use_data(un_data, overwrite = TRUE)
