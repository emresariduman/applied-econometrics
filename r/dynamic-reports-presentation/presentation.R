# R in Action Chapter 22                                                   #
# Creating dynamic reports                                                 #
# requires packages knitr, odfWeave, r2wd, car (for the dataset)           #
# install.packages(c("knitr", "odfWeave", "r2wd", "car", "rmarkdown"),     # 
#                    depend=TRUE)                                          #
#--------------------------------------------------------------------------#

setwd("./")

library(pander) #to open windows files directly from R

# Creating web page with rmarkdown
library(rmarkdown)
render("women.Rmd", "html_document")
openFileInOS("women.html")
openFileInOS("women.Rmd")

#bonus 
render("3dplot.Rmd", "html_document")
openFileInOS("3dplot.html")
openFileInOS("3dplot.Rmd")


## Creating publication ready documents with R and LaTeX //pdf
library(knitr) #Package for Dynamic Report
knit2pdf("drugs.Rnw")
openFileInOS("drugs.pdf")
openFileInOS("drugs.RNW")

#bonus
browseURL("https://en.wikibooks.org/wiki/LaTeX/Document_Structure")

## Creating dynamic reports with R and Microsoft Word
# you will need to have Microsoft Word installed

# Listing 22.3 - R script for inserting results in salary.docx
require(R2wd)
require(car)

#r2wd requires RDCOMClient
#install.packages("devtools") 
library("devtools") #to install packages from github
#install_github("omegahat/RDCOMClient")

df <- Salaries
n <- nrow(df)
fit <- lm(salary ~ rank*sex, data=df)
aovTable <- Anova(fit, type=3)
aovTable <- round(as.data.frame(aovTable), 3)
aovTable[is.na(aovTable)] <- ""

openFileInOS("salaryTemplate2.docx")
wdGet("salarytemplate2.docx", method="RDCOMClient")
wdGoToBookmark("n")                                          
wdWrite(n )

wdGoToBookmark("aovTable")                                   
wdTable(aovTable, caption="Two-way Analysis of Variance", 
        caption.pos="above", pointsize=12, autoformat=4)

wdGoToBookmark("effectsPlot")                                
myplot <- function(){
  require(effects)
  par(mar=c(2,2,2,2))
  plot(allEffects(fit), main="")
}
wdPlot(plotfun=myplot, caption="Mean Effects Plot",                      
       height=4, width=5, method="metafile")
wdSave("SalaryReport2.docx")  #does not work
wdQuit()



#Making of dashboards

#shiny

"#flexdashboard                   #shinydashboard
  R Markdown	                      Shiny UI code
  Super easy	                      Not quite as easy
  Static or dynamic                	Dynamic
  CSS flexbox layout	              Bootstrap grid layout"

library(flexdashboard)
library(rmarkdown)

draft("dashboard.Rmd",
      template = "flex_dashboard",
      package = "flexdashboard")

openFileInOS("dashboard.Rmd")

render("dashboard.Rmd", flex_dashboard())
openFileInOS("dashboard.html")

#Further:
browseURL("https://pkgs.rstudio.com/flexdashboard/articles/using.html")


#EXAMPLES:
browseURL("https://jjallaire.shinyapps.io/shiny-crandash/")
browseURL("https://beta.rstudioconnect.com/jjallaire/htmlwidgets-waste-sites/htmlwidgets-waste-sites.html")
browseURL("https://beta.rstudioconnect.com/jjallaire/htmlwidgets-rbokeh-iris/htmlwidgets-rbokeh-iris.html")
browseURL("https://beta.rstudioconnect.com/jjallaire/htmlwidgets-d3heatmap/htmlwidgets-d3heatmap.html")

library(shiny)
library(shinydashboard)         
 
############Blank Dashboard:

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody() )

server <- function(input, output) { }

shinyApp(ui, server)

############Basic Dashboard:

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard", ),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50))))
  
  
  )


server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)

####################################################################################  with message menu
ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard",dropdownMenu(type = "messages",
                                                         messageItem(
                                                           from = "Sales Dept",
                                                           message = "Sales are steady this month."
                                                         ),
                                                         messageItem(
                                                           from = "New User",
                                                           message = "How do I register?",
                                                           icon = icon("question"),
                                                           time = "13:45"
                                                         ),
                                                         messageItem(
                                                           from = "Support",
                                                           message = "The new server is ready.",
                                                           icon = icon("life-ring"),
                                                           time = "2014-12-01"
                                                         )
  ) ),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50))))
  
  
)


server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)

#######################

browseURL("http://rstudio.github.io/shinydashboard/structure.html#header")

#Examples:
browseURL("https://kevinrue.shinyapps.io/isee-shiny-contest/?_ga=2.135064369.1262808534.1623750391-1455993083.1620280245#")
browseURL("https://jennadallen.shinyapps.io/pet-records-app/?_ga=2.102162561.1262808534.1623750391-1455993083.1620280245")
browsURL("https://nsgrantham.shinyapps.io/tidytuesdayrocks/?_ga=2.159852349.1262808534.1623750391-1455993083.1620280245")


