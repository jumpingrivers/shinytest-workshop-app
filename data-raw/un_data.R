## code to prepare `un_data` dataset goes here
pkgload::load_all()

un_path <- file.path("data-raw", "country_profile_variables.csv")
un_data <- un_path |>
  readr::read_csv(col_types = readr::cols()) |>
  clean_names2()

usethis::use_data(un_data, overwrite = TRUE)
