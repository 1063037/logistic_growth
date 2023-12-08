#Install necessary packages
#install.packages("ggplot2")

#Load packages
library(ggplot2)

#Define the parameters using estimates made earlier in assignment
No <- 713116
r <- 0.006979
K <- 1e+09
t <- c(1:2500)

#Define function using exponential growth equation
exponential_funct <- function(t) {
  N <- No*exp(r*t)
  return(N)
}

#Define function using logistic growth equation
logistic_funct <- function(t) {
  N <- (No*K*exp(r*t))/(K-No+No*exp(r*t))
  return(N)
}

#Create a dataframe using the functions
N <- logistic_funct(t)
df <- data.frame(N)

#Make a plot with both functions on
exp_logist_fig <- ggplot(data = df, aes(x = t, y = N))+
  geom_function(fun = exponential_funct, colour = "red")+
  geom_function(fun = logistic_funct, colour = "blue")+
  ylim(0, 3e+09)+
  ylab("N")+
  xlab("t / mins")
exp_logist_fig

#Save a good quality image of the plot
#install.packages("ragg")
library(ragg)
agg_png("exponential_logistic_figure.png", 
        width = 600, height = 600, units = "px",res=1500, scaling = 0.12)
exp_logist_fig
dev.off()