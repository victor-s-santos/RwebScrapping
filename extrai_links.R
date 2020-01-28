library(rvest)
library(httr)

url <- 'links2.html'
webpage <- read_html(url) %>%
  html_nodes(webpage, 'table') %>%
  html_nodes(webpage, 'a') %>%
  html_attr(webpage, "href")
webpage
write.table(webpage,  "links2.txt", append = FALSE, quote = FALSE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double"))

