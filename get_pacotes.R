#função para fazer download dos pacotes

#link <- "teste"
#download.file("https://www.math.ucla.edu/~anderson/rw1001/library/base/html/download.file.html", "teste")
#---------------------------------------------------------------------#
#loop para poder baixar todos os pacotes num intervalo de tempo que não dê problema
i = 0
meus_pacotes <- readLines("links.txt")
for(links in meus_pacotes){
  for(a in links){
    if(i == 10){
      Sys.sleep(10)
      i = 0
      print(a)
    }
    print(a)
    i = i + 1
  }
  }
#-----------------------------------------------------------------------#
#gerar o nome dos pacotes, que entrará no parâmetro destfile
b <- "https://www.bioconductor.org/packages/release/bioc/html/MTseeker.html"
a <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "", b)
download.file((b), (a))
#getwd()
