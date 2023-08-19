#!/bin/bash

# Files and directories

v1_dir="./v1"
v2_dir="./v2"
log_file="./update.log"

file_to_update="version1.txt"
file_to_copy="version2.txt"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Verify if the file exists
if [ -f "$v1_dir/$file_to_update" ]; then

    # Update the file
    cp "$v2_dir/$file_to_copy" "$v1_dir/$file_to_update"
    printf "$timestamp $(tput setaf 128)INFO$(tput setaf 7): File has been updated successfully \n\n" >> "$log_file"

else
    echo "ERROR: version1.txt does not exist."
fi