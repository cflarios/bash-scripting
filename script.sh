#!/bin/bash

# Ruta de los archivos y del archivo de log

v1_dir="/home/chris/Documentos/Github/bash-scripting/v1"
v2_dir="/home/chris/Documentos/Github/bash-scripting/v2"
log_file="/home/chris/Documentos/Github/bash-scripting/update.log"

# v1_dir="./v1"
# v2_dir="./v2"
# log_file="./update.log"

file_to_update="version1.txt"
file_to_copy="version2.txt"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Verificar si el archivo de versión 1 existe
if [ -f "$v1_dir/$file_to_update" ]; then

    # Actualizar el archivo de versión y el log
    cp "$v2_dir/$file_to_copy" "$v1_dir/$file_to_update"
    printf "$timestamp $(tput setaf 128)INFO$(tput setaf 7): File has been updated successfully \n\n" >> "$log_file"

else
    echo "ERROR: version1.txt does not exist."
fi