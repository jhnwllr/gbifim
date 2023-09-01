# get table of github issues

gh_issues <- function() {

is_uuid <- function(x) ifelse(!is.null(x),grepl("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",x),FALSE)

extract_key <- function(x) {
  x %>%
    purrr::map(~ .x$labels) %>%
    purrr::flatten() %>%
    tibble::tibble(
      name = purrr::map_chr(., "name")
    ) %>%
    dplyr::filter(purrr::map_lgl(name,~ is_uuid(.x))) %>%
    dplyr::pull(name)
}

r = gh::gh(
"/repos/:owner/:repo/issues",
owner = "gbif",
repo = "ingestion-management",
state = "all",
.limit = Inf)

d = tibble::tibble(
number = purrr::map_int(r,"number"),
id = purrr::map_dbl(r,"id"),
title = purrr::map_chr(r,"title"),
state = purrr::map_chr(r, "state"),
dataset_key = extract_key(r),
created_at = purrr::map_chr(r, "created_at") %>% as.Date()
)

d
}
