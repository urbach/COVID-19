#!/bin/bash

rm bonn.csv

for f in coronavi*; do
    echo -n $f | sed -e {s/coronavirus-fallzahlen-nrw//g}  >> bonn.csv
    echo  `grep -A 1 "<td>Bonn</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' | sed -e '{s/\\.//g}'` >> bonn.csv
    ##grep -A 2 "<td>Bonn</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' >> bonn.csv
done

rm koeln.csv

for f in coronavi*; do
    echo -n $f | sed -e {s/coronavirus-fallzahlen-nrw//g}  >> koeln.csv
    echo  `grep -A 1 "<td>Köln</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' | sed -e '{s/\\.//g}'` >> koeln.csv
    ##grep -A 2 "<td>Bonn</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' >> koeln.csv
done

rm duesseldorf.csv

for f in coronavi*; do
    echo -n $f | sed -e {s/coronavirus-fallzahlen-nrw//g}  >> duesseldorf.csv
    echo  `grep -A 1 "<td>Düsseldorf</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' | sed -e '{s/\\.//g}'` >> duesseldorf.csv
    ##grep -A 2 "<td>Bonn</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' >> duesseldorf.csv
done

rm heinsberg.csv

for f in coronavi*; do
    echo -n $f | sed -e {s/coronavirus-fallzahlen-nrw//g}  >> heinsberg.csv
    echo  `grep -A 1 "<td>Heinsberg (Kreis)</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' | sed -e '{s/\\.//g}'` >> heinsberg.csv
    ##grep -A 2 "<td>Bonn</td>" $f | tail -1 | sed -e '{s/<td>/,/g}' | sed -e '{s/<\/td>//g}' >> heinsberg.csv
done


rm nrw.csv

for f in coronavi*; do
    echo -n $f | sed -e {s/coronavirus-fallzahlen-nrw//g}  >> nrw.csv
    echo `grep -A 1 "<strong>Gesamt</strong>" $f | tail -1 | sed -e '{s/<td><strong>/,/g}' | sed -e '{s/<\/strong><\/td>//g}' | sed -e '{s/\\.//g}'` >> nrw.csv
done
