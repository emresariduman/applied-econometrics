setwd("./") #script's directory
library(rmarkdown)

'the textbook suggests only miktex but a problem happened and tinytex
solved it. so, tinytext might be required.'

#miktex can be downloaded from own website
#tinytex can be installed with three steps:

'install.packages("tinytex")
library(tinytex)
install_tinytex()'

render("article.Rmd", "pdf_document")
