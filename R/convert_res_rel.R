convert_res_rel = function(datasetKey="ce4fe924-1ddf-4546-856f-b3319aded91b",
                           v="4.3",
                           link=NULL) {

    if(is.null(link)) {
    # endpoint
      ep = rgbif::datasets(uuid=datasetKey)$data$endpoints %>%
      filter(type == "DWC_ARCHIVE") %>%
      pull(url)
      link = paste0(ep,"&v=",v)
    }

    print(link)
    # "http://gbif.ru:8080/ipt/archive.do?r=plots_with_iris_aphylla_in_european_russia&v=1.6"
    temp = tempfile()
    download.file(link,temp,mode="wb")
    data = read.table(unz(temp, "resourcerelationship.txt"),sep="\t",quote="",header=TRUE,fill=TRUE)
    unlink(temp)

    # ids.csv should be old,new
    data %>%
    select(resourceID,relatedResourceID) %>%
    write.table(file="C:/Users/ftw712/Desktop/update_ids/ids.csv",
                sep=",",
                col.names=FALSE,
                row.name=FALSE,
                quote=FALSE)
}
