#!/bin/bash

pdfgrep  "Nordrhein-Westfalen   " 2020-0* | grep -v National | grep -v Regionen | grep -v Tirol | tr -s '[:blank:]"+"*[:blank:]' ',' | sed -e {s/-de.pdf?__blob=publicationFile://g} | sed -e {s/','//g} | sed -e {s/Landkreis//g} | sed -e {s/Heinsberg//g} | sed -e {s/\\.//g} > tmp.dat
## fill missing elements
awk -F, '{$7=""}1' OFS=',' tmp.dat > nrw.csv

pdfgrep "Gesamt     " 2020-0*  | grep -v "%" | tr -s '[:blank:]"+"*[:blank:]' ',' | sed -e {s/-de.pdf?__blob=publicationFile://g}  | sed -e {s/\\.//g} > tmp.dat
awk -F, '{$7=""}1' OFS=',' tmp.dat > gesamt.csv

rm tmp.dat
