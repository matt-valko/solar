# Project: Solar Learning
# By: Matt Valko & Tristan Kaiser
# Last Updated: 3/5/2017

# Working directories for convenience
# TK working directory: C:/Users/Tristan/Desktop/RFiles/solar
# MV working directory: 

library(tidyverse)
library(lubridate)

setwd('C:/Users/Tristan/Desktop/RFiles/solar')

df <- read.csv('20160101.csv',
               header = TRUE,
               na.strings = c("", NA),
               stringsAsFactors = FALSE,
               check.names = FALSE)
str(df)
