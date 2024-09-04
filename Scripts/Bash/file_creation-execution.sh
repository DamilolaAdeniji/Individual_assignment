#!/bin/zsh

#Create the ETL.sh file
touch ETL.sh


# 
source .env

# Write into that file
cat <<EOL > ETL.sh
# go up 2 directories
cd .. 
cd ..

mkdir -p ETL_files
cd ETL_files

wget -O downloaded_data.csv $url #download the csv file

echo "file downloaded successfully"

ls -l > directory_content.txt #list out all files in the directory

if grep -q "downloaded_data.csv" directory_content.txt; then
    echo "file exists here"
else
    exit 1  # Exit the script if the transformed file does not exist in the dir
fi #check that the downloaded file exists in the directory

if ! command -v csvcut &> /dev/null; then
    echo "csvkit is not installed. Installing it now..."
    brew install csvkit 
else
    echo "csvkit is already installed."
fi #checks if the  csv package for this project is installed or not

sed '1s/Variable_code/variable_code/' downloaded_data.csv > transformed_file.csv # change the column name

csvcut -c Year,Value,Units,variable_code transformed_file.csv > 2023_year_finance.csv

echo "file transformed successfully"

mkdir -p Transformed

mv 2023_year_finance.csv Transformed/2023_year_finance.csv

ls -l Transformed > Transformed/directory_content.txt #list out all files in the directory

if grep -q "2023_year_finance.csv" Transformed/directory_content.txt; then
    echo "file exists here"
else
    exit 1  # Exit the script if the transformed file does not exist in the dir
fi

mkdir -p Gold

mv Transformed/2023_year_finance.csv Gold/2023_year_finance.csv 
EOL

# Making the file executable only by me
chmod 700 ETL.sh

# running the ETL file
./ETL.sh