# Set directory
setwd("/Users/GaryKao/Desktop/Coursera_R programming/SDS 328M/Project")
# Read the raw file
dnarna <- read.csv("Data for project1.csv")

## Response variable (DNA RNA hybrid density) ##
# Check normality of response variable
hist(dnarna$DNA.RNA.hybrid.density..mean..A.U.., main = "Distribution of R-loop in yeast genes", xlab = "R-loop density (mean, A.U.)")
fivenum(dnarna$DNA.RNA.hybrid.density..mean..A.U..)
# Remove outliers based on fivenum() result and the rows with no values
dnarnaclean <- dnarna[dnarna$DNA.RNA.hybrid.density..mean..A.U.. > 6.96 & dnarna$DNA.RNA.hybrid.density..mean..A.U.. <108.63 & dnarna$Transcription.frequency..mRNA.hour. != "n.d.",]
# Log transformation of response variable
dnarnaclean$log <- log(dnarnaclean$DNA.RNA.hybrid.density..mean..A.U..)
# Check normality of log response variable
qqnorm(dnarnaclean$log, main = "Q-Q plot of R-loops (log)")
qqline(dnarnaclean$log, col = "red")

## 1st explanatory variable (transcription frequency) ##
# Change transcription column from factor to numeric value
dnarnaclean$Transcription.frequency..mRNA.hour. <- as.numeric(as.character(dnarnaclean$Transcription.frequency..mRNA.hour.))
# Check normality of transcription frequency (1st explanatory variable)
hist(dnarnaclean$Transcription.frequency..mRNA.hour., main = "Distribution of trasncription frequency", xlab = "Transcription frequency (mRNA/hour)")
# Log transformation of transcription frequency
dnarnaclean$logT <- log(dnarnaclean$Transcription.frequency..mRNA.hour.)
# Check normality of log transcription frequency
qqnorm(dnarnaclean$logT, main = "Q-Q plot of transcription frequency (log)")
qqline(dnarnaclean$logT, col = "red")

# Check distribution between log transcription frequency and log response variable
plot(dnarnaclean$logT, dnarnaclean$log, main = "Trasncription and R-loop in yeast genes (log)", xlab = "Transcription frequency in log (mRNA/hour)", ylab = "R-loop in log (mean, A.U.)", ylim = c(2, 5), cex = .5)

## 2nd explanatory variable (intron-containing genes) ##
table(dnarnaclean$Intron.containing.gene.)
boxplot(dnarnaclean$log ~ dnarnaclean$Intron.containing.gene., main = "R-loop distribution of intron-containing genes", cex.main=1, xlab = "Intron-containing genes", ylab = "R-loop in log (mean, A.U.)")
fivenum(dnarnaclean$log[dnarnaclean$Intron.containing.gene. =="no"])
fivenum(dnarnaclean$log[dnarnaclean$Intron.containing.gene. =="yes"])

## Create GLM model with interaction
GLMmodel <- lm(log ~ Intron.containing.gene. * logT, data=dnarnaclean)
summary(GLMmodel)

## Check assumptions
# Check linearity
plot(dnarnaclean$logT, dnarnaclean$log, main="R-loop formation by transcription frequency (log)", xlab = "Transcription frequency (log)", ylab = "R-loop formation")
# Check normality
qqnorm(GLMmodel$residuals, main = "Model residuals", xlab = "Residuals")
qqline(GLMmodel$residuals, col="red")
# Check equal variance
plot(GLMmodel$fitted.values, GLMmodel$residuals, main="Residual plot", xlab = "Fitted values", ylab = "Residuals")
abline (h=0, col='red')

## Visualize interaction between two explanatory variables and response variable
intronyes <- dnarnaclean[dnarnaclean$Intron.containing.gene. == "yes",]
intronno <- dnarnaclean[dnarnaclean$Intron.containing.gene. == "no",]
plot(intronyes$logT, intronyes$log, pch=17, col='red', cex=0.8, main = "R-loop by transcription frequency and intron status", xlab = "Transcription frequency (log)", ylab = "R-loop formation (log)")
points(intronno$logT, intronno$log, pch=16, col="blue", cex=0.8)
abline(lm(log ~ logT, data=intronyes), col="red")
abline(lm(log ~ logT, data=intronno), col="blue", lty = 2)
legend("bottomright", title = "Intron?", c("yes", "no"), col=c("red", "blue"), pch = c(17, 16), inset = 0.01)
