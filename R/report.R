report = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b") {

  id_sample(datasetKey)
  potential_contacts(datasetKey)
  email_subject(datasetKey)

  cat("\n","helpdesk@gbif.org","\n")
  Sys.sleep(5)
  browse_pages(datasetKey)

}

