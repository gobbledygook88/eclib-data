#!/bin/bash

# Old file
OLD_FILE="tmanin_runtimes-serial-old.dat"

# New file
NEW_FILE="tmanin_runtimes-serial-new.dat"

# Get number of lines in new file
NUM_LINES=$(wc -l < $NEW_FILE)

# Loop over new file
for (( l=1; l<=$NUM_LINES; l++ ))
do
    # Get value in first column of line l
    KEY=$(awk "NR==${l} {print \$1}" $NEW_FILE)

    # Get value in second column of line l
    VAL=$(awk "NR==${l} {print \$2}" $NEW_FILE)

    # Replace value in old file
    sed -i -e "s/^${KEY} .*/${KEY} ${VAL}/" $OLD_FILE
done
