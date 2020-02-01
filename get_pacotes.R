meus_pacotes <- readLines("links2.txt")
download_packages <- function(linksfile){
  i <- 0
  for(link in linksfile){
    if(i == 10){
      t <- runif(1, 1.0, 4.0)
      Sys.sleep(t)
      link2 <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "" ,link)
      download.file(link, destfile=paste('./pages/', link2), method="libcurl")
      i <- i + 1
    }else{
      i <- i + 1
      link2 <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "" ,link)
      download.file(link, paste('./pages/', link2), method="libcurl")
    }
  }
}
download_packages(meus_pacotes[1:20])
