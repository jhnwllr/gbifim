potential_contacts = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b") {

  cat("\n")
  cat("\n")

  print(rgbif::datasets(uuid=datasetKey)$data$contacts[c("type","email")])
  cat("\n")

}
