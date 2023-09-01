check_id = function(datasetKey="04b949ba-e65a-427c-acce-8a5df15605e8",v=9.2,id="OLA:OLA-BG:086/2011") {

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

  x = data %>% pull(occurrenceID)
  id %in% x

}
