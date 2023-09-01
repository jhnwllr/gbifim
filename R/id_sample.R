

id_sample = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b") {

x = rgbif::occ_search(datasetKey=datasetKey,limit=1000)$data %>%
  sample_n(10)  %>%
  pull(key) %>%
  as.numeric() %>%
  purrr::map_chr(~unique(rgbif::occ_get_verbatim(.x,fields="all")$identifier))

cat("id sample: ","\n")
cat(paste0(x,collapse = "\n"))
# x
}

id_sample_ = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b") {

  x = rgbif::occ_search(datasetKey=datasetKey,limit=1000)$data %>%
    pull(key) %>%
    as.numeric() %>%
    purrr::map_chr(~unique(rgbif::occ_get_verbatim(.x,fields="all")$identifier))
  x
}


