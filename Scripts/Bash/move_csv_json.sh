#!/bin/zsh

touch sample1.csv
touch sample2.csv
touch sample1.json
touch sample2.json

mkdir -p json_and_CSV
mv *.csv json_and_CSV
mv *.json json_and_CSV
