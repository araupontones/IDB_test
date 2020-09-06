
# Load set up
source("R/set_up.R")


##Set parameters -----------------------------------------------------------------------------------


#quesitonnaires to download
qn_variable <-c("IDB") #using the questionnaire variable
server <- "http://100.26.142.103"
user <- "araupontones"  #API user in server
password <- "Seguridad1" #API password in server 
ex_type <- "stata" #format of your data
downloadDir <- tempdir()


# url to query questionnaires
query_Questionnaires <- sprintf("%s/api/v1/questionnaires",server)

# response from the server
#response_Questionnaires <- GET(query_Questionnaires, authenticate(user, password),
                               #query = list(limit = 200, offset = 1)) #successful
# data frame with questionnaires
#df_questionnaires  = as.data.frame(fromJSON(content(response_Questionnaires, as= "text")))


#Extract key variables of the quesionnaire
QuestionnaireId = "cd7185a4-2a48-4003-b5e2-254ba4a5452a"
qn_id = "cd7185a42a484003b5e2254ba4a5452a$1"
Version = "1"
Title = "MANEJO DE COMPLICACIONES OBSTÉTRICAS POR HEMORRAGIA"
Variable = "IDB"



# Generate data in server

query_generate <- sprintf("%s/api/v1/export/%s/%s/start", server,
                         ex_type,qn_id)

POST(query_generate, authenticate(user, password))  #generate data in server



# Download data from server

#query to download questionnaires
query_download <- sprintf("%s/api/v1/export/%s/%s", server,ex_type, qn_id)

#get the url to download the files
response_download <- GET(query_download, authenticate(user, password), user_agent("andres.arau@outlook.com")) 

# Create zip file
zipfile = file.path(downloadDir,"download.zip")
#folder where .zip is going to be extracted
exdir = "downloads" 

#open connection to write data in download folder
filecon <- file(zipfile, "wb") 
#write data contents to download file!! change unzip folder to temporary file when in shiny
writeBin(response_download$content, filecon) 
#close the connection
close(filecon)





#unizp questionnaire

unzip(zipfile=zipfile, overwrite = TRUE, 
      exdir = exdir, 
      unzip = "internal"
)

junk = dir(exdir, pattern = ".do|Pdf|Questionnaire")


#file.remove(paste(exdir, junk, sep = "/"))


#