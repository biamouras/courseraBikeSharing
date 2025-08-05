# _targets.R file
library(targets)
tar_source()

list(
  tar_target(download, download_zip()),
  tar_target(tab_day, import_day_file()),
  tar_target(tab_hour, import_hour_file())
)