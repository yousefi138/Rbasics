
## ----, echo = FALSE, message = FALSE-------------------------------------
knitr::opts_chunk$set(
  comment = ">",
  error = FALSE,
  tidy = FALSE
)


## ----simple, eval = FALSE------------------------------------------------
## > 2+3


## ----simple_eval---------------------------------------------------------
2+3


## ----b-------------------------------------------------------------------
a <- 2
a


## ----workspace, eval = FALSE---------------------------------------------
## ls()


## ----workspace3----------------------------------------------------------
ls()


## ----workspace4----------------------------------------------------------
b <- log10(500) 
c <- ((23-12)^2)/12 + ((17-24)^2)/24 + ((8-12)^2)/12 
ls()


## ----workspace5----------------------------------------------------------
ls()
c


## ----concat--------------------------------------------------------------
d <- c(1, 2, 3, 4, 5)
d


## ----args----------------------------------------------------------------
args(sample)


## ----help, eval=FALSE----------------------------------------------------
## ?sample


## ----matrix--------------------------------------------------------------
ls()
z <- c(21,22,23, 24, 25)
mat1 <- cbind(d,z)
mat2 <- rbind(d,z)


## ----matrix print--------------------------------------------------------
mat1
mat2


## ----vector index--------------------------------------------------------
z
z[4]


## ----vector1 index-------------------------------------------------------
z[1:3]


## ----matrix row----------------------------------------------------------
mat1



## ----matrix1 row---------------------------------------------------------
mat1[1,2]
mat1[1,]


## ----dataframe-----------------------------------------------------------
df <- data.frame(mat1)
df


## ----data name-----------------------------------------------------------
df$d 


## ----mat note------------------------------------------------------------
df[,1]


## ----set dir-------------------------------------------------------------
# Example for mac users 
setwd("/Users/PaulYousefi/Documents/PhD/SW_R_Tutorial/")


## ----directory, eval=FALSE-----------------------------------------------
## # Example for Windows users
## setwd("C:/Rab/")


## ----reading-------------------------------------------------------------
crime<-read.csv("CRIME.csv")


## ------------------------------------------------------------------------
class(crime)
dim(crime)


## ----heads---------------------------------------------------------------
head(crime)


## ------------------------------------------------------------------------
str(crime)


## ----subset--------------------------------------------------------------
e<-crime$metro
f<-crime[1, 2:5]
f


## ----state---------------------------------------------------------------
CA <- crime[crime$state=="CA",]
dim(CA)


## ----interact------------------------------------------------------------
# Make interaction variable for metro and poverty
crime$interact <- crime$metro * crime$poverty
summary(crime$interact)


## ----recode--------------------------------------------------------------
crime$poverty_cat[crime$poverty < 10] <- "Low" 
crime$poverty_cat[crime$poverty >= 10] <- "High"


## ----ifelse--------------------------------------------------------------
crime$poverty_binary <- ifelse(crime$poverty >= 12,
	c(1), c(0))


## ----sort----------------------------------------------------------------
crime[order(crime$murder),]
crime[order(crime$murder, crime$violent),]


## ----Plot, eval=FALSE----------------------------------------------------
## plot(crime$violent, crime$metro)


## ----Plot1, fig.width = 3, fig.height = 3, echo=FALSE--------------------
plot(crime$metro, crime$violent)


## ----regression1, eval=FALSE---------------------------------------------
## fit1 <- glm(violent ~ metro + poverty + snglpar,
## 	data = crime, family = "gaussian")
## 
## summary(fit1)


## ----regression2, echo=FALSE---------------------------------------------
fit1 <- glm(violent ~ metro + poverty + snglpar, 
	data = crime, family = "gaussian")
summary(fit1)


## ----logistic, eval=FALSE------------------------------------------------
## fit2 <- glm(poverty_binary ~ hsgrad,
## 	data = crime, family = "binomial")
## 
## summary(fit2)


## ----logistic1, echo=FALSE-----------------------------------------------
fit2 <- glm(poverty_binary ~ hsgrad, 
	data = crime, family = "binomial")
summary(fit2)


## ----logisticmore--------------------------------------------------------
exp(coef(fit2)) # exponentiated coefficients
exp(confint(fit2)) # 95% CI for exponentiated coefficients


## ----corr----------------------------------------------------------------
variables <- crime[,c("violent", "metro", "poverty")]
cor(variables)


## ----chi1, warning=FALSE, message=FALSE, error=FALSE---------------------
# Create another binary variable
crime$murder_binary <- ifelse(crime$murder >= 6,
	c(1), c(0))

# Make a table
pv <- table(crime$poverty_binary, crime$murder_binary)


## ----chi2----------------------------------------------------------------
chisq.test(pv)


## ----install, eval=FALSE-------------------------------------------------
## install.packages("gdata")
## library(gdata)


