#install.packages("devtools") 
setwd("C:/Users/Viktor Baranov/Documents/Baranov/my papers/in work/9.Mandibulate/draft files/r files")
devtools::install_github("seraklop/RoguePlots/rogue.plot")   
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
require(rogue.plot)
require(phylobase)
require(ape)
require(phytools)
require(ggplot2)
require(reshape2)
require(ggimage)
library(tidyverse)
library(ggfun)
require(ggtree)
require(phangorn)
require(ips)
#library(ggtree)Manager::install("ggtree")

#install.packages("lazyeval")
require(lazyeval)
#petalocladius
tree=read.nexus("tree.nex", tree.names = NULL, force.multi = FALSE)#contree all
tree2=read.nexus("trees.t", tree.names = NULL, force.multi = FALSE)



fossils=(c("Petalocladius"))

taxa <- list("outgroup" = c("Prodiamesa_sp"), "fossils" =fossils)
#calculation of each rouge plot can take 10-20 minutes based on the hardware
create.rogue.plot(tree, tree2, rogues = c(taxa$fossils[1]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")



create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[2]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[3]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[4]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[5]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[6]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[7]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[8]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[9]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[10]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[11]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[12]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[13]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[14]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[15]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[16]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[17]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[18]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[19]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[20]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")
create.rogue.plot(tree, tree1, rogues = c(taxa$fossils[21]), outgroup = taxa$outgroup[1], type = "Spectral", outfile.table = "Rogue2.txt", outfile.plot = "")

#Ancestral character estimation under the threshold model using Bayesian MCMC
midge.data=read.csv("midge.data.csv",sep=",")
midge.data$tip.label=midge.data$X
tip.label=as.data.frame(tree$tip.label)
tip.label$tip.label=tip.label$`tree$tip.label`
tip.label$index=1:108
midge.data1=merge(midge.data,tip.label,by=c("tip.label"))
x1=midge.data1[order(midge.data1$index),]
#females#for lebanoculicoides mandibles coded as for spanish spp in De La Fuente et al., 2011
mand<-midge.data1$female.manible
names(mand) <-  midge.data1$tip.label
mcmc1<-ancThresh(tree,mand,ngen=10000000)
