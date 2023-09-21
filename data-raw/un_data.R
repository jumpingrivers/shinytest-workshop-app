## code to prepare `un_data` dataset goes here
pkgload::load_all()

un_path <- file.path("data-raw", "country_profile_variables.csv")

# The UN data has encoded all missing numeric values as -99, they are converted to NA at import
un_data <- un_path |>
  readr::read_csv(
    col_types = readr::cols(),
    na = c("", "NA", "-99")
  ) |>
  clean_names2()

usethis::use_data(un_data, overwrite = TRUE)
