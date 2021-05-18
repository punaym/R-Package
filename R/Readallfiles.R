#######################################################
# Title: "Read all files Library"
# Author: "Punay Mehra,Executive Data science,GDDC"
# Date: "May 17, 2021"
# Output: html_document
#######################################################



Readfile<-function(dir){
  dir<-choose.files()
  if(grepl(".csv",dir)){
    dat<-read.csv(dir)
    #View(t)
  } else if(grepl(".xlsx",dir)){
    if( ! require("readxl")) {install.packages("readxl")} + library(readxl)
    read_excel_allsheets <- function(dir, tibble = FALSE) {
      sheets <- readxl::excel_sheets(dir)
      if (length(sheets)==1) {
        dat<-readxl::read_excel(dir)
      } else {
        dat <- lapply(sheets, function(X) readxl::read_excel(dir, sheet = X))
        if(!tibble) dat <- lapply(dat, as.data.frame)
        names(dat) <- sheets
        dat
      }
    }
    dat <- read_excel_allsheets(dir)
  } else if(grepl(".txt",dir)){
    dat<-data.table::fread(dir)
    if( ! require("data.table")) {install.packages("data.table")} + library(data.table)
    #View(t)
  } else if(grepl(".DBF",dir)){
    if( ! require("foreign")) {install.packages("foreign")} + library(foreign)
    dat<-foreign::read.dbf(dir)
    #View(t)
  } else if(grepl(".sas7bdat",dir)){
    if( ! require("sas7bdat")) {install.packages("sas7bdat")} + library(sas7bdat)
    dat<-sas7bdat::read.sas7bdat(dir)
    #View(t)
  }
  return(dat)
}


