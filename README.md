# RwebScrapping

 `In this repository I am developping a R web scrapping system which collect informations about Bioconductor Packages.`

* ## I am loking for:

  * ### ` How the packages interact with each other; `

  * ### ` How the packages popularity are increasing; `

### This repository contains only the collect information part, I am going to submit another repository to study the collected information. 

* ## Explaing the workflow:

  * ***extrai_links.R:*** `This R script gets all links from the page links2.html located in the same directory, and write a table containing these links and exports this as a file.txt.`
  
  * ***get_pacotes.R:*** `This is a way to do GET using R, but I thought the best way is do it from bash. In therefore, this script only print each link from links.txt` 

  * ***download_packages.sh:*** `The which I really did a GET from each contained link in links.txt. I needed the sleep function to create a delay between many GETs that I did, because the bioconductor could block my ip, since the code was doing GET too many times.`
  
  * ***scrap_params.R:*** `The script where I can do webscrap of the package params, returning this as a data.frame.`
  
  * ***unique_dataframe.R:*** `The script where I run the scrap_function in each package link in the links2.txt, and returns this as a single dataframe.`

  * ***all_functions.R:*** `The script where I share every function, every other R files are only reusing the function contained here.`
 
  * ***OBS:*** `It isn't necessary to have the pages in your local machine, I mean, I could did it scraping directly from the page links without download the pages, but as I was trying many different ways to scrap the informations, I thought GET these pages would be a good idea to avoid problems with the bioconductor security system.`
  
* ## Step-by-Step:
 
  * ***Extract links from bioconductor release version:*** `Using the extrai_links.R script to extract package links from bioconductor release version.`

  * ***Getting a data_frame by each package page:*** `Using obtained links in the previous step or even the download packages pages, the scrap_params.R's function to get a data_frame by each package page.`

  * ***Obtaining a list of all data_frames:*** `In the unique_dataframe.R script is obtained a list with all data_frames, and this variable is exported as a .RData file.`
 
  * ***Obtaining a unique data_frame:*** `The file named unique_df.RData is a dataframe of every package params. This file is going to be used in the next repository.`
 
  
  