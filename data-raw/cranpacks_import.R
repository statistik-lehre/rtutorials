
cranpacks <- rvest::read_html("https://cran.r-project.org/web/packages/available_packages_by_date.html") |>
    rvest::html_table() |>
    purrr::pluck(1) |>
    dplyr::arrange(Date) |>
    dplyr::mutate(id = dplyr::row_number(),
                  date = lubridate::as_date(Date),
                  package = Package,
                  title = Title) |>
    dplyr::select(id, date, package, title)

usethis::use_data(cranpacks, version = 3, overwrite = TRUE)
