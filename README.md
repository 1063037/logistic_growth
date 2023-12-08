# logistic growth
R scripts for a reproducible analysis of logistic growth.

## Assignment questions 1-3:

## Q1
I analysed data from experiment 2. The analysis begins in the R script titled "plot_data.R". First, the growth data (obtained from the file experiment2.csv) is saved into a dataframe (called growth_data). Then, using the package "ggplot2" a plot of population size (N) against time (t) is plotted so that we can visually examine how population size changes with time. As this growth appears logistic, we then produce a plot of log10(N) against t, which confirms this as there appears to be a linear relationship between log(N) and t at lower values of t, before plateauing at high values of t.

The next stage of analysis is carried out in the "fit_linear_model.R" script. Using the "dplyr" package we can create a subset of the data where N is much smaller than carrying capacity (K), which occurs when t is low (<1000). We then put this subset into a linear model of log(N) against t, which we can then use to estimate initial population size (N0) and intrinsic population growth rate (r). We also create a linear model of log(N) against t for a subset of the data where t>3000, which we can use to estimate K as by this time N will have increased to have approximately reached carrying capacity.

In the next script "plot_data_and_model", we create a function that defines N by the logistic growth equation ( N = (N0* K* exp(r* t))/(K-N0+N0* exp(r*t)) ) and use "ggplot2" to plot t against N and see how well the data fits our model of logistic growth.
### Results
N0 was estimated by taking the intercept of the first linear model when N was small compared to K.

N0 = 713116 (nearest whole number)

r was estimated by taking the slope of the first linear model

r = 0.006979 (7 s.f.)

K was estimated by taking the intercept of the second linear model where t was sufficiently high for N to reach carrying capacity

K = 1e+09 (or 1000000000)


## Q2
Assuming the population grows exponentially, N = N0 * exp(r * t)

So when t = 4980 mins, N = 713116 * exp(0.006979*4980)

So N would = 8.856203e+20

If we assume the population grows logistically, N = (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))

So when t = 4980 mins, N = (713116 * 1e+09 * exp(0.006979 * 4980)) / (1000000000 - 713116 + (713116 * exp(0.006979 * 4980)))

So N = 1e+09

Under exponential growth the population size is predicted to be vastly larger compared to under logistic growth (8.856203e+20 is orders of magnitude greater than 1e+09). This is because exponential growth has no limits, whereas logistic growth is limited by carrying capacity and cannot exceed K. At large values of t like 4980, N reaches K.


## Q3

Figure attached below:

![image](https://github.com/1063037/logistic_growth/assets/150165336/0fccceec-d476-4d9a-98f7-af75d7e7da90)

R script saved as "exponential_logistic_comparison_graph.R"

Graph saved as "exponential_logistic_figure.png"

