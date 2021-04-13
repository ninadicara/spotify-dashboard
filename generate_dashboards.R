library(rmarkdown)
library(here)

###############################################################
# Update these variables with your input and output file paths
###############################################################
input <- here("..", "dashboard-input")
output <- here("..", "dashboard-output")

# Get the list of file names
files <- list.files(input, 
           full.names = FALSE,
           pattern = ".+tsv",
)

# Cycle through all the files and produce the output document
for (file in files) {
    
  # Get full filepath
  path <- file.path(input, file)
  
  # Get the unique ID of the file (first value in file name split by underscores)
  unique_id <- strsplit(file, "_")[[1]][1]
  
  # Render the rmarkdown document
  rmarkdown::render("dashboard_template.Rmd", 
       params = list(file_path = path),
       output_file = paste0(unique_id, '-spotify-dashboard.html'),
       output_dir = output)
}