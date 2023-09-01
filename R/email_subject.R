
email_subject = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b") {

 x = rgbif::datasets(uuid=datasetKey)$data$title

 cat("\n")
 cat("\n")
 cat("GBIF - ", x, "dataset ingestion paused due to occurrenceID changes")
 cat("\n")
}
