# R-loop-project
The project is from my biostatistic class. The goal is to use statistic analysis in R programming to evaluate published data set.

# Objective:
Transcription is an important process for producing RNA from DNA and also a source of genomic instability and DNA damage. DNA and RNA hybrid structure is one of the major reasons for it. In yeast, only 283 out of 6000 genes contain introns. The function of introns was not clear until 2017. Bonnect et al. have published a study in Molecular Cell journal indicating a novel function of introns in decreasing R-loop and preventing genomic instability. Here I am eager to confirm their conclusion and predict that high transcription rate and intron-containing genes have critical effects on R-loop formation. 

# Research questions:
* Q1: Is there an effect of gene transcription rate on R-loop formation?
* Q2: Do intron-containing genes have less R-loop formation?

# Analysis Method: 
I used GLM model and graphing function in R programming to analyze my data. The functions that I used for GLM model are lm() and summary().

# Assumptions:
* Normality 
* Linearity
* Equal variance

# Reference:
1. Amandine Bonnet, Ana R. Grosso, Abdessamad Elkaoutari, Emeline Coleno, Adrien Presle, Sreerama C. Sridhara, Guilhem Janbon, Vincent Ge´ li, Se´rgio F. de Almeida, and Benoit Palancade., 2017, Molecular Cell 67, 608-621.(http://www.cell.com/molecular-cell/abstract/S1097-2765(17)30496-3.)
1. Lamia Wahba et al., S1-DRIP-seq identifies high expression and polyA tracts as major contributors to R-loop formation., 2016, Genes & Development (http://genesdev.cshlp.org/content/30/11/1327)
1. Frank C.P Holstege et al., Dissecting the Regulatory Circuitry of a Eukaryotic Genome., 1998, Cell (http://www.sciencedirect.com/science/article/pii/S0092867400816414)
