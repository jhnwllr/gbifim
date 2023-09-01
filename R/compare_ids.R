compare_ids = function(datasetKey="514dc3dd-4723-48a6-a219-8a9ea062a537",v="1.6") {

  # endpoint
  ep = rgbif::datasets(uuid=datasetKey)$data$endpoints %>%
    filter(type == "DWC_ARCHIVE") %>%
    pull(url)

  link = paste0(ep,"&v=",v)
  print(link)
  # "http://gbif.ru:8080/ipt/archive.do?r=plots_with_iris_aphylla_in_european_russia&v=1.6"
  temp = tempfile()
  download.file(link,temp,mode="wb")
  data = read.table(unz(temp, "occurrence.txt"),sep="\t",quote="",header=TRUE,fill=TRUE)
  unlink(temp)

  x = sample_n(data,10) %>% pull(occurrenceID)

  cat("new ids: ","\n")
  cat(paste0(x,collapse = "\n"))

  cat("\n")
  cat("current ids:","\n")
  cat("\n")
  id_sample(datasetKey)

}
