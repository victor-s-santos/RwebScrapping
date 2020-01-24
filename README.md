# RwebScrapping

 `In this repository I am developping a R web scrapping system which collect informations about Bioconductor Packages.`

* ## I am loking for:

  * ### ` How the packages interact with each other; `

  * ### ` How the packages popularity are increasing; `

### This repository contains only the collect information part, I am going to submit another repository to study the collected information. 

* ## Explaing the workflow:

  * ***extrai_links.R:*** `This R script gets all links from the page links.html located in the same directory, and write a table containing these links.`
  
  * ***get_pacotes.R:*** `This is a way to do GET using R, but I thought the best way is do it from bash. In therefore, this script only print each link from links.txt` 

  * ***download_packages.sh:*** `The which I really did a GET from each contained link in links.txt. I needed the sleep function to create a delay between many GETs that I did, because the bioconductor could block my ip, since the code was doing GET too many times.`
 
  * ***OBS:*** `It isn't necessary to have the pages in your local machine, I mean, I could did it scraping directly from the page links without download the pages, but as I was trying many different ways to scrap the informations, I thought GET these pages would be a good idea to avoid problems with the bioconductor security system`