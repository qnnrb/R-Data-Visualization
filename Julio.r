library(baseballr)
library(dplyr)
library(ggplot2)

Julio <- scrape_statcast_savant(start_date = "2023-07-30", 
                                end_date = "2023-09-04", 
                                player_type = "batter", 
                                playerid = 67759)

strike_index <- list()

called_index <- list()

index <- 0
for (x in 1:nrow(Julio)){
  if (Julio$type[x] == "S") {
    index
    strike_index[index] <- x
    index = index + 1
  }
}

ind <- 0
for (x in 1:nrow(Julio)){
  if (Julio$description[x] == "called_strike") {
    called_index[ind] <- x
    ind = ind + 1
  }
}

plot(x = Julio$plate_x[unlist(called_index)], 
     y = Julio$plate_z[unlist(called_index)], 
     asp = 1, xlab = "X pos", ylab="Z pos", 
     xlim = c(-1, 1), ylim = c(1, 4),
     main = "Coordinate position of called strikes to Julio
     (July 30th, 2023 to September 4th, 2023)")

#smoothScatter(x = Julio$plate_x[unlist(called_index)], 
#              y = Julio$plate_z[unlist(called_index)], 
#              nbin = 300, 
#              xlim = c(-1, 1), ylim = c(1,4))

polygon(x = c(-0.71, -0.71, 0.71, 0.71),
        y = c(mean(Julio$sz_bot), 
              mean(Julio$sz_top), 
              mean(Julio$sz_top), 
              mean(Julio$sz_bot))) 

polygon(x = c(-0.79, -0.79, 0.79, 0.79), 
        y = c(mean(Julio$sz_bot)-0.083, 
              mean(Julio$sz_top)+0.083,
              mean(Julio$sz_top)+0.083,
              mean(Julio$sz_bot)-0.083),
        border = "firebrick1")



