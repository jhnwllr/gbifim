browse_pages = function(datasetKey=NULL) {

  # GBIF
  browseURL(paste0("https://www.gbif.org/dataset/",datasetKey))

  # IPT or something
  rgbif::datasets(uuid=datasetKey)$data$identifiers %>%
    dplyr::filter(type=="URL") %>%
    pull(identifier) %>%
    unique() %>%
    `[`(1) %>% browseURL()

}
