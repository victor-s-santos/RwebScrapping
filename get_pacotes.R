meus_pacotes <- readLines("links2.txt")
download_packages <- function(linksfile){
  for(links in meus_pacotes){
    for(a in links){
      if(i == 10){
        link <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "" ,a)
        Sys.sleep(3)
        i = 0
        
        download.file(a, destfile=link,method="libcurl")
      }else{
        download.file(a, destfile=link,method="libcurl")
        i = i + 1 
      }
    }
  }
}
download_packages(meus_pacotes)
#download.file(meus_pacotes[4], destfile='./site.html',method="libcurl")
#I must think about a way to concatenate the pacage name from the website with the current location
