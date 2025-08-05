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
