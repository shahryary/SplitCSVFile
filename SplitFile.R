# Reading large csv tables as dataframes and Split into Multiple CSV files in R Language

# require(data.table)
# install.packages("data.table")
library(data.table) 

# Depend on your system it may be use long time
# use system.time(X) to get reading time

DT <- fread("/Users/yadi/RProjects/data-2015_hse.csv")                                

# n = number of records to split.
n <- 977000 

# Assuming that 'DT' is the data.frame which we need to segment every 977000 rows and save it in a new file,
# we split the dataset by creating a grouping index based on the sequence of rows to a list (lst).
# We loop through the sequence of list elements (lapply(...), and write new file with write.csv.
                                               
lst <-  split(DT, ((seq_len(nrow(DT)))-1)%/%n+1L)
invisible(lapply(seq_along(lst), function(i) 
  write.csv(lst[[i]], file=paste0('project', i, '.csv'), row.names=FALSE)))

# Optianl - Importing multi csv files into R ( Reading csv directory  
# and import all of them as a data frame )

temp = list.files(pattern="*.csv")
system.time(for (i in 1:length(temp)) assign(temp[i], fread(temp[i])))

