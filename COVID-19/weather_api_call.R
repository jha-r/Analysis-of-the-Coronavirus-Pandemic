weatherstack_historical <- function(key2, location, date, unit)
  
  
weatherstack_historical("d60410f7bd5388a39b95401bc3f9d880", "USA", "2020-26-04", 'Fahrenheit')

weatherstack_current("d60410f7bd5388a39b95401bc3f9d880","London, United Kingdom","f")
test=data.frame()
for (i in 1:10) {
  print(weatherstack_current("d60410f7bd5388a39b95401bc3f9d880",paste(city_list$state," ",city_list$country),"f"))
}