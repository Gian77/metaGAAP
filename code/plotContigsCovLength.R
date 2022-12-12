options(scipen = 999)
library(tidyverse)
library(ggplot2)
contigs <- read.delim("contigs.covlength",header = FALSE, sep = "\t") %>% 
  rename(Name=V1, Length=V2, Coverage=V3)
head(contigs)
# First figure
pdf(file="contigs_LengCov.pdf", width=5, height=5) 
contigs %>% 
	ggplot(aes(x=Coverage, y=Length)) +
	geom_point() +
	labs(title="Contigs: Length, Coverage",x="Coverage (X)", y="Length (bp)")
dev.off()
# Second figure
pdf(file="contigs_log10LengCov.pdf", width=5, height=5) 
contigs %>% 
  ggplot(aes(x=Coverage, y=Length)) +
	geom_point() +
	scale_y_continuous(trans="log10") +
	labs(title="Contigs: log10 Length, Coverage",x="Coverage (X)", y="log10 Length (bp)")
dev.off()
# Third figure
pdf(file="contigs_Lenglog10Cov.pdf", width=5, height=5) 
contigs %>% 
  ggplot(aes(x=Coverage, y=Length)) +
	geom_point() +
  	scale_x_continuous(trans="log10") +
  	labs(title="Contigs: Length, log10 Coverage",x="log10 Coverage (X)", y="Length (bp)")
dev.off()
