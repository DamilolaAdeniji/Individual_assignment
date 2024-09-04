#!/bin/zsh

# go up to directories

cd ..
cd ..

touch sample1.csv
touch sample2.csv
touch sample1.json
touch sample2.json

echo "CSV and json files have been created successfully"

mkdir -p json_and_CSV
mv *.csv json_and_CSV
mv *.json json_and_CSV

echo "All csv and json files have been moved successfully"