# Generate data
# blah blah

rm(list = ls()) #every script start by clearing workspace
graphics.off() #close all open rgaphics window, everything is generated by the current script


# Parameters
    #keep all at the top of script, dont have actual numbers later in the script, just reference them
    #name variables carefully
    #remove simple local variables after you use them (x, y, etc) (rm())

pop_size = 100 

#name "diagnostic plot" to show it isnt a figure but just some exploration

# save data
filename <- "data/popdata.Rdata"
save(pop_size, file=filename)
