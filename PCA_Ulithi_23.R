#this R file will establish a PCA for the Ulithi '23 datasets
rm(list=ls())   #clear the environment

library(dplyr)
library(ggplot2)
library(tidyverse, quietly = TRUE) #tidyverse-v1.3.1

#prepare the csv files
#read the csv files
posnorm_ft <- read.csv("/Users/gabri/OneDrive/Desktop/metabolomics/metabolomics/ulithi_23_csv_files/Ulithi23_posnorm_ft_6_24.csv", header = TRUE)
posnorm_md <- read.csv("/Users/gabri/OneDrive/Desktop/metabolomics/metabolomics/ulithi_23_csv_files/Ulithi23_posnorm_md_6_24.csv", header = TRUE)

#returned as dataframes

#generate the principal components
posnorm_ft2 <- select(posnorm_ft,c(2:143))      #eliminate the metabolite ID column to make it numeric

posnorm_ft3 <- as.matrix(posnorm_ft2)   #make it numeric

is.numeric(posnorm_ft3)         #validate that its numeric

PCA <- princomp(cor(posnorm_ft3))    #make the PCA of the dataset
PCA

PCA$loadings
PC <- PCA$scores
cor(PC)


#making the plot
p <- ggplot(PC, aes(x = Comp.1, y = Comp.2)) +
        geom_point() +
        ggtitle("Gabby's First PCA"); p


