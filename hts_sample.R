require("forecast")
require("hts")

dates_input= read.csv("test_data_dates.csv",sep =";", dec = ".")
soh= read.csv("test_data_values.csv",sep =";", dec = ".")

soh_matrix = as.matrix(soh)

ts_soh = ts(soh_matrix, 
            start=c(2012, 01), 
            end=c(2015, 01), 
            frequency=12) 

y <- hts(ts_soh, characters = c(2, 3, 4, 3, 5))

train = window(y, start = c(2012,1), end = c(2014, 9))
test = window(y, start = c(2014,10), end = c(2015, 1))

fcst_hts_3 = forecast.gts(train, h = 4, method = "tdfp", fmethod = "arima")