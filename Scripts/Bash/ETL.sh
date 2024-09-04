
cd .. 
cd ..

mkdir -p ETL_files
cd ETL_files

wget -O downloaded_data.csv https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv #download the csv file

echo "file downloaded successfully"

ls -l > directory_content.txt #list out all files in the directory

#check that the downloaded file exists in the directory
if grep -q "downloaded_data.csv" directory_content.txt; then
    echo "file exists here"
else
    exit 1  # Exit the script if the transformed file does not exist in the directory
fi 

#checks if the  csv package for this project is installed or not
if ! command -v csvcut &> /dev/null; then
    echo "csvkit is not installed. Installing it now..."
    brew install csvkit 
else
    echo "csvkit is already installed."
fi 

sed '1s/Variable_code/variable_code/' downloaded_data.csv > transformed_file.csv # change the column name

csvcut -c Year,Value,Units,variable_code transformed_file.csv > 2023_year_finance.csv # filter out the unneccessary columns

echo "file transformed successfully"

mkdir -p Transformed

mv 2023_year_finance.csv Transformed/2023_year_finance.csv  #move the file to the Transformed directory

ls -l Transformed > Transformed/directory_content.txt #list out all files in the directory

if grep -q "2023_year_finance.csv" Transformed/directory_content.txt; then
    echo "file exists here"
else
    exit 1  # Exit the script if the transformed file does not exist in the dir
fi

mkdir -p Gold

mv Transformed/2023_year_finance.csv Gold/2023_year_finance.csv 
