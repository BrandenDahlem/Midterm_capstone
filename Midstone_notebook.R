library(tidyverse)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(scales)
library(RColorBrewer)
library(reshape2)
library(dplyr)

twenty_year_merge <- read.csv('20_year_merge_test.csv')

big_table <- saveRDS(twenty_year_merge,file = 'twenty_year_merge.rds')

big_table

twenty_year_merge$W_normalized <- ((twenty_year_merge$W-47)/(108-47))

twenty_year_merge$WHIP_normalized <- ((twenty_year_merge$WHIP-1.606)/(1.152-1.606))

twenty_year_merge$SO9_normalized <- ((twenty_year_merge$SO9-5.3)/(10.1-5.3))

twenty_year_merge$PAY_normalized <- ((twenty_year_merge$PAY-15.0)/(301.7-15.0))

twenty_year_merge$SB_normalized <- ((twenty_year_merge$SB-19)/(194-19))

twenty_year_merge$BA_normalized <- ((twenty_year_merge$BA-0.231)/(0.290-0.231))

twenty_year_merge$OBP_normalized <- ((twenty_year_merge$OBP-0.293)/(0.366-0.293))

twenty_year_merge$SLG_normalized <- ((twenty_year_merge$SLG-0.335)/(0.491-0.335))

top_five <- c('ATL','BOS','LAD','NYY','STL')

bottom_five <- c('BAL','KCR','MIA','PIT','TBR')

top_five_teams <- twenty_year_merge$CAT == 'TOP5'

top_five_teams <- twenty_year_merge[top_five_teams == TRUE, ]

top_five_teams

Yankees <- twenty_year_merge$Tm == 'NYY'

Yankees <- twenty_year_merge[Yankees == TRUE, ]

while (!is.null(dev.list()))  dev.off()

#col <- c('#AA0000','#0000AA')[twenty_year_merge[which(twenty_year_merge$id==id), 12][1]+1]

Yankees_WHIP_plot <- ggplot() + 
  geom_line(aes(y = Yankees$WHIP_normalized, x = Yankees$YEAR),data = Yankees)

Yankees_win_plot <- ggplot() +
  geom_line(aes(y = Yankees$W, x = Yankees$YEAR), data = Yankees)

class(twenty_year_merge$Tm) = "factor"

ten_team_WHIP_plot <- ggplot(data = twenty_year_merge, 
  aes(x = twenty_year_merge$YEAR, y = twenty_year_merge$WHIP_normalized, color = twenty_year_merge$Tm)) +
                               geom_line()

ten_team_BA_plot <- ggplot(data = twenty_year_merge, 
                             aes(x = twenty_year_merge$YEAR, y = twenty_year_merge$BA_normalized, color = twenty_year_merge$Tm)) +
  geom_line()

show(ten_team_WHIP_plot)

show(ten_team_BA_plot)

Yankees_win_plot

Yankees_WHIP_plot

top_5_WHIP_plot

league_average <- twenty_year_merge$CAT == 'MED'

league_average <- twenty_year_merge[league_average == TRUE, ]

league_average

bottom_five_teams <- twenty_year_merge$CAT == 'BOT5'

bottom_five_teams <- twenty_year_merge[bottom_five_teams == TRUE, ]

bottom_five_teams

World_series_champs <- twenty_year_merge$WS == 'YES'

World_series_champs <- twenty_year_merge[World_series_champs == TRUE, ]

World_series_champs

MLB_teams <- read_csv('~/Downloads/baseballdatabank-master/upstream/Teams.csv')

MLB_teams

Team_wins_20 <- read_csv('~/Downloads/Team_wins_20_years')

Team_wins_20

head(Team_wins_20)

Team_win_totals <- colSums(Team_wins_20)

Team_win_totals

sort(Team_win_totals)

plot(Team_win_totals)

Win_percentage_totals <- Team_win_totals/3409

Win_percentage_totals

sort(Win_percentage_totals)

sort(Win_percentage_totals * 162)

plot(Win_percentage_totals * 162)

Team_wins_20$RowTotal <- (rowSums(Team_wins_20) - (Team_wins_20$G + Team_wins_20$Year))

Team_wins_20$AvgWin <- Team_wins_20$RowTotal / 30

Team_wins_20
