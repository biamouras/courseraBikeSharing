# _targets.R file
library(targets)
tar_source()

list(
  tar_target(download, download_zip()),
  tar_target(import_day, import_day_file()),
  tar_target(import_hour, import_hour_file()),
  tar_target(tab_day, label_date_tags(import_day)),
  tar_target(tab_hour, label_date_tags(import_hour))
)