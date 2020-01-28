meus_pacotes <- readLines("links.txt")
i = 0
for(links in meus_pacotes){
  for(a in links){
    if(i == 10){
      Sys.sleep(3)
      i = 0
      
      download.file(a, destfile="site.html",method="libcurl")
    }else{
      download.file(a, destfile="site.html",method="libcurl")
      i = i + 1 
    }
  }
}

download.file(meus_pacotes[4], destfile='./site.html',method="libcurl")
#I must think about a way to concatenate the pacage name from the website with the current location
