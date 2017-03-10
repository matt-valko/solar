# Project: Solar Learning
# By: Matt Valko & Tristan Kaiser
# Last Updated: 3/7/2017

# Working directories for convenience
# TK working directory: C:/Users/Tristan/Desktop/RFiles/solar
# MV working directory: 

#### Notes from paper ####
#  1. Power generation by renewables is intermittent and uncontrollable.
#  2. Prediction of renewable power loads crucial to satisfy demand.
#  3. Better prediction models are a prerequisite for increasing efficiency and encouraging broader
#  adoption of distributed generation from renewables in the grid and at smart homes.
#  4. Solar intensity is a proxy for solar generatio (proportional to solar power harvesting)
#
# What they did:
#   1. Trained models on historical solar intensity observations & forecasts
#   to compute future solar intensity for a given time horizon
#   2. Built linear least squares regression & Support Vector Machines (SVM)
#
# Sharma et al. find that:
#   1. Solar energy harvesting: sky cover, relative humidity, and precipitation 
#   are highly correlated with each other and with solar intensity
#   2. Temperature, dew point, and wind speed are only partially correlated with each other
#   and with solar intensity
#   3. Models derived using SVMs with RBFkernels and linear least squares 
#   outperform a past-predicts future models and a simple model based on
#   sky condition forecasts from prior work
#
#### Resources ####
# Historical Forecast Data: www.weather.gov
# Solar intensity in watts/m^2: http://traces.cs.umass.edu
# https://en.wikipedia.org/wiki/Solar_power_forecasting
#
#### Steps to complete ####
#   1. Plot basic solar intensity readings such as solar intensity by day & general
#   weather (cloudy, snow, rainy, sunny, wind speed, dew point)

#### Packages ####
# install.packages('rwunderground')
library(tidyverse)
library(lubridate)
library(jsonlite)
library(httr)
library('data.table')
library(rwunderground)

setwd('C:/Users/Tristan/Desktop/RFiles/solar')
api.key <- ''
wud.url <- 'http://api.wunderground.com/api/'

#### Load File ####

df <- read.csv('20160101.csv',
               header = TRUE,
               na.strings = c("", NA),
               stringsAsFactors = FALSE,
               check.names = FALSE)

str(df)

plot(df)
df2 <- df %>%
  distinct(`CST`, .keep_all = TRUE) %>%
  select(`Direct Normal [W/m^2]`)

#### Wunderground API ####
# 1. This Works
# 2. Turn into function to grab data for every day of 2016.
#    Lubridate?



wud <- GET(paste0(wud.url, api.key, '/history_20060405/q/TX/Edinburg.json'))

effects.test <- jsonlite::fromJSON(content(wud, "text"))


boxplot(df[,`CR1000 Battery [VDC]`])
dim(df)
<<<<<<< HEAD
#Create feature set
> names(df)
 [1] "V1"                         "Year"                      
 [3] "DOY"                        "CST"                       
 [5] "CR1000 Battery [VDC]"       "Direct Normal [W/m^2]"     
 [7] "Direct (stdev) [W/m^2]"     "CHP1 Temp [deg C]"         
 [9] "CHP1 Temp (stdev) [deg C]"  "Global Horizontal [W/m^2]" 
[11] "Global (stdev) [W/m^2]"     "Diffuse Horizontal [W/m^2]"
[13] "Diffuse (stdev) [W/m^2]"    "CR1000 Temp [deg C]"       
> 
=======
>>>>>>> d85c59ff432446dfc97afb9cca5584db5575b718

#Create Outcome
outcome<- df[,.( outcome= mean(`CR1000 Battery [VDC]`)),by=.(DOY,Year)] 

str(df)
