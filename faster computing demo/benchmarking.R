
# Benchmarking Script for Faster Computing
# 02/26/24


rm(list = ls()) 
graphics.off()


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


# Run the simulation
out <- geom_growth_base()
# Plot the results
plot(0:999,
out,
xlab='Time',
ylab='Population size',
type='o')


# Simple way to see how long the above function takes
start_time <- Sys.time()
out <- geom_growth_base()
end_time <- Sys.time()
time_elapsed <- end_time - start_time
print(time_elapsed)

# Repeat with longer time 
start_time <- Sys.time()
out <- geom_growth_base(T = 9E5)
end_time <- Sys.time()
time_elapsed <- end_time - start_time
print(time_elapsed)