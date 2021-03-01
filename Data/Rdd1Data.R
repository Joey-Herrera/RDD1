library(learnr)
library(haven) #For data upload
library(tidyverse)
library(stargazer)
library(estimatr)
library(rdd)
library(rdrobust)
library(rddensity)
library(ggplot2)
library(jtools)

#Load in DUI data
Hansen <- read_dta("/Users/josephherrera/desktop/Causal Inference/hansen_dwi.dta")

#Add DUI dummy variable
Hansen_dummy = Hansen %>%
  mutate(bacdummy = ifelse(bac1 >= 0.08,1 ,0))

head(Hansen_dummy)