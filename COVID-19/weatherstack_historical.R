weatherstack_historical <- function(key2, location, date, unit){
  library(httr)
  library(jsonlite)
  # checking unit input
  if (unit == 'Fahrenheit'){
    units = 'f'
  }else{
    units = 'm'
    print("Using metric units")
  }
  # set up for the request of the url and path from website
  domain <- "http://api.weatherstack.com/"
  api_function <- "historical"

  #parameters required for the API function
  params <- list(access_key = key2,
                 query = location,
                 historical_date = date,
                 units = units)
  #url combine with path and parameters
  url <- modify_url(paste(domain, api_function, sep = ""),
                    query = params)
  #encoding data as json
  resp <- POST(url, encode = 'json')
  # try for proper API key and access
  if(resp$status_code==101){
    print("User supplied an invalid access key.")
    return (NULL)}
  else if(resp$status_code==404){
    print("User requested a resource which does not exist.")
    return (NULL)}
  # manipulating json to display as dataframe
  resp_json <- fromJSON(content(resp, "text"),
                        flatten = TRUE)
  df<- as.data.frame(resp_json)
  df_t <- t(df)
  return(df_t)
}