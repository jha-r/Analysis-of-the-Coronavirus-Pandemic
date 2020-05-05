weatherstack_current <- function(api_key,location,units) {
  library(httr)
  library(jsonlite)
  # setting up the url to access the api
  domain<- "http://api.weatherstack.com/"
  endpoint <- "current"
  params<-list(access_key =api_key,
               query=location,
               units=units)
  url <- modify_url(paste(domain,endpoint,sep =""),
                    query = params)
  #post request api
  resp<- POST(url)
  # try for proper API key and access
  if(resp$status_code==101){
    print("User supplied an invalid access key.")
    return (NULL)}
  else if(resp$status_code==404){
    print("User requested a resource which does not exist.")
    return (NULL)}
  #convert the data to json format
  resp_json <- fromJSON(content(resp, "text"),
                        flatten = TRUE)
  #convert to dataframe
  df<- as.data.frame(resp_json)
  df_t <- t(df)
  return(df_t)
}
