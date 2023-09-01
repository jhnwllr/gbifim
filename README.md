
R package for handling GBIF ingestion management issues. 

https://github.com/gbif/ingestion-management/issues

Mostly for internal use within GBIF. 

## installation 

```R 
devtools::install_github("jhnwllr/gbifim")
```

## usage 

```R 
library(gbifim)
report("7fe1bc0e-f762-11e1-a439-00145eb45e9a")

compare_ids("7fe1bc0e-f762-11e1-a439-00145eb45e9a",v=1.13)

```

Get all the issues in the ingestion management repo for filtering. 

```R 
gh_issues()
```
