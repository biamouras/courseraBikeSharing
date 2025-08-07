download_zip <- function() {
  url <- "https://archive.ics.uci.edu/static/public/275/bike+sharing+dataset.zip"
  download.file(url, "data-raw/bike_sharing_dataset.zip")
  unzip("data-raw/bike_sharing_dataset.zip", exdir  = "./data-raw")
}

import_day_file <- function() {
  vroom::vroom("data-raw/day.csv")
}

import_hour_file <- function() {
  vroom::vroom("data-raw/hour.csv")
}

label_date_tags <- function(tab){
  tab |>
    dplyr::mutate(
      season = factor(
        season,
        levels = 1:4,
        labels = c("Winter", "Spring", "Summer", "Fall")
      ),
      mnth = factor(
        mnth,
        levels = 1:12,
        labels = lubridate::month(1:12, label = TRUE, locale = "en_US")
      ),
      weekday = factor(
        weekday,
        levels = 0:6,
        labels = lubridate::wday(1:7, label = TRUE, locale = "en_US")
      ),
      holiday = factor(
        holiday,
        labels = c("No", "Yes")
      ),
      workingday = factor(
        workingday,
        labels = c("Working day", "Weekend or Holiday")
      ),
      weathersit = factor(
        weathersit,
        levels = 1:4,
        labels = c(
          "Clear",
          "Misty",
          "Light rain or snow",
          "Bad weather"
        )
      )
    )
}
