# Benchmarking Script for Faster Computing
# Need to improve the speed of a function
# 02/26/24


rm(list = ls()) 
graphics.off()
library(microbenchmark())

set.seed(1) # for reproducibility

geom_growth_base <- function(N0 = 2,
                            T = 999,
                            lambda = 1.01,
                            sigma = 0.2)
{
Nvals <- vector('numeric') # initiate a place to put the values
Nvals[1] <- N0

for (t in 1:T){
    Nvals[t+1] <- Nvals[t]*(lambda*exp(rnorm(1,0,sigma))) #calculate pop size using growth rate
}

return(Nvals)
}



# Benchmark with microbenchmark
# running for 9 steps, 99, and 999 steps
comp <- microbenchmark(TS_009 = {geom_growth_base(T = 9)},
                        TS_099 = {geom_growth_base(T = 99)},
                        TS_999 = {geom_growth_base(T = 999)}) 
comp


# Plot: See how long each # of iterations takes
library(ggplot2)
autoplot(comp)
boxplot(log(time) ~ expr, data = comp)


# Alternate verson with pre-allocated vector
geom_growth_preallocated <- function(N0 = 2,
                                    T = 999,
                                    lambda = 1.01,
                                    sigma = 0.2){

Nvals <- vector('numeric', length = T+1) #creating an empty vector

Nvals[1] <- N0

for (i in 1:T){
    Nvals[i+1] <- Nvals[i] * (lambda * exp(rnorm(1, 0, sigma)))
}

return(Nvals)
}


# Benchmark again with microbenchmark
comp <- microbenchmark(TS_009 = {geom_growth_base(T = 9)},
                        TS_099 = {geom_growth_base(T = 99)},
                        TS_999 = {geom_growth_base(T = 999)}) 
comp


# Compare base and pre-allocated versions
comp <- microbenchmark(Old = {geom_growth_base(T = 9999)},
New = {geom_growth_preallocated(T = 9999)})
comp
