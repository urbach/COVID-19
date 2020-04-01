#!/bin/bash

pdfgrep  "Nordrhein-Westfalen   " 2020-0* | grep -v National | grep -v Regionen | grep -v Tirol | tr -s '[:blank:]"+"*[:blank:]' ',' | cut -f 1,2,3,4,5,6 -d "," | sed -e {s/-de.pdf?__blob=publicationFile://g} | sed -e {s/','//g} | sed -e {s/Landkreis//g} > tmp.dat
## fill missing elements
awk -F, '{$6=""}1' OFS=',' tmp.dat > nrw.csv

pdfgrep "Gesamt     " 2020-0*  | tr -s '[:blank:]"+"*[:blank:]' ',' | cut -f 1,2,3,4,5,6 -d "," | sed -e {s/-de.pdf?__blob=publicationFile://g} > tmp.dat
awk -F, '{$6=""}1' OFS=',' tmp.dat > gesamt.csv

rm tmp.dat
