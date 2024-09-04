# BASH ETL PROJECT

## This project uses Bash to extract csv data from a web source, saves it locally, apply some basic transformation to it then load it to a target directory

### Here are the steps to run this project:
1. Clone this repo using the code below:
    ### `zsh`
    ` git clone https://github.com/DamilolaAdeniji/Individual_assignment
    `
2. Create a .env file in the bash sub directory within the Scripts directory and create the following enviroment variables in it
###
    
    url = 
    DB_NAME = 
    DB_USER = 
    DB_HOST = 
    DB_PORT = 
    
3. Navigate to the `Scripts/Bash` sub directory and do the following:
    * To create and run an ETL file that extracts data from the web source, transforms and loads it, run the `file_creation-execution.sh` script.

    * To generate csv/json files and move them to their specific directory, run the `move_csv_json.sh` script.

    * To run a script that copies data from .csv files into a database:
        * Set up your postgres database.
        * Run the `create_tables.sql` script to create the required tables.
        * Download the required csv files into the `csv_files` directory.
        * Run the `load_data_to_db.sh` script in the Bash sub-directory.


        