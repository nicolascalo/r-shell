library(rmarkdown)
library(stringr)

file_names <- commandArgs(trailingOnly = TRUE)

#defines -a argument for the rscript function

if("-a" %in% file_names){
  folder<-file_names[2]
  file_names<-Sys.glob(str_c(folder,"/*.csv"))
  
if (length(file_names) == 0){
  print("no files found in the specified folder")
}  
  
  
} else {file_names <- file_names}


if(length(file_names) == 0){
  print("please specify a list of .csv files")
}


for(file in file_names){

output_name <- str_split_fixed(string = file,
                               pattern = "[/|.]",
                               n=3)


output_name <- str_c(output_name[2],'.html')
  
  
render("surveys-report.Rmd",
       output_file = output_name,
       output_dir = "reports",
       params = list(file = file)
       )

}



#in terminal: Rscript render-rmd.R data/plot1.csv data/plot2.csv data/plot3.csv
#in terminal: Rscript render-rmd.R -a data     -> processes all files in the data folder