#!/bin/bash

# a temporary file to store the results
temp_file=$(mktemp)

# count the number of lines
count_man_lines() {
    local command=$1
    local line_count=$(man $command | wc -l)
    echo "$command,$line_count" >> $temp_file
}

# for each man page
count_man_lines "man"
count_man_lines "ls"
count_man_lines "find"

# sort
sort -t, -k2 -g -r $temp_file | while IFS=, read -r command line_count
do
    echo "$command has $line_count lines in its man page."
done

# remove
rm -f $temp_file

