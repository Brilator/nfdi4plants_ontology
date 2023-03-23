#!/bin/bash

# Convert obo in two-column (id | name) tsv

for i in *.obo
do

    grep "^id:" -A1 $i | sed '/^--/d' | sed 's/: /,/g' > tmp.csv

    awk  -F, '$1=="id" {print $2}' tmp.csv > tmp.col1
    awk  -F, '$1=="name" {print $2}' tmp.csv > tmp.col2

    paste tmp.col1 tmp.col2 > "${i%.obo}.tsv"

    rm tmp*

done

