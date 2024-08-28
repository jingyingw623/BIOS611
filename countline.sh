#!/bin/bash

man_ls_count=$(man ls | wc -l)
man_man_count=$(man man | wc -l)
man_find_count=$(man find | wc -l)

echo "ls,$man_ls_count" > countline.txt
echo "man,$man_man_count" >> countline.txt
echo "find,$man_find_count" >> countline.txt

sort -t, -k2 -n -r countline.txt

rm countline.txt