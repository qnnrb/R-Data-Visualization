install.packages("baseballr")
library(baseballr)
library(dplyr)

bref_standings_on_date("2022-09-04", "AL West", from = FALSE)

standings_data = bref_standings_on_date("2022-09-04", "AL West", from = FALSE)

pitch_data = mlb_pbp(632970)

standings_data$'pythW-L%'

colors = c("orange1", "turquoise", "blue2", "red", "green4")

team_names = standings_data$Tm
team_names

teams <- data.frame(matrix(ncol = 5, nrow = 2))

win_data <- as.matrix(data.frame(assign(x = team_names[1], value = c(standings_data$'W-L%'[1], standings_data$'pythW-L%'[1])),
                                 SEA = c(standings_data$'W-L%'[2], standings_data$'pythW-L%'[2]),
                                 TEX = c(standings_data$'W-L%'[3], standings_data$'pythW-L%'[3]),
                                 LAA = c(standings_data$'W-L%'[4], standings_data$'pythW-L%'[4]),
                                 OAK = c(standings_data$'W-L%'[5], standings_data$'pythW-L%'[5])
                                 ))

rownames(win_data) <- c("Win %", "Pyth Win %")

assign(x = team_names[2], value = c(standings_data$'W-L%'[2], standings_data$'pythW-L%'[2]))

#barplot(standings_data$'W-L%', main = "AL West Win % (09-04-2022)",
#        names.arg = standings_data$Tm, xlab= "Teams", ylab = "Win %", ylim = c(0,1),
#        col = colors, beside = TRUE)

#barplot(win_data, xlab="Teams", ylim = c(0, 0.7), col = c("#1b98e0", "#353436"), beside = TRUE)
#legend("topright", legend = c("Win %", "Pyth Win %"), fill = c("#1b98e0", "#353436"))



