#!/bin/zsh
# load the environment variables and credentials
source .env

cd .. 
cd ..  
# Define an array of table names and their CSV files
tables_and_files=(
  "posey.accounts:csv_files/accounts.csv"
  "posey.orders:csv_files/orders.csv"
  "posey.region:csv_files/region.csv"
  "posey.sales_reps:csv_files/sales_reps.csv"
  "posey.web_events:csv_files/web_events.csv"
)

# Loop through each table and file pair
for pair in "${tables_and_files[@]}"; do
  TABLE_NAME="${pair%%:*}"
  CSV_FILE="${pair##*:}"

  # Empty each table first
  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "TRUNCATE $TABLE_NAME"

    # Load the CSV file into the database
  psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\COPY $TABLE_NAME FROM '$CSV_FILE' DELIMITER ',' CSV HEADER"
 # psql "postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME" -c "\COPY $TABLE_NAME FROM '$CSV_FILE' DELIMITER ',' CSV HEADER"


  # Print success message
  echo "$TABLE_NAME was loaded successfully"
done