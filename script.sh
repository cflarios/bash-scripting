#!/bin/bash

# Ruta de los archivos y del archivo de log
v1_dir="./v1"
v2_dir="./v2"
log_file="./counter.log"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Verificar si el archivo de versión 1 existe
if [ -f "$v1_dir/version1.txt" ]; then

    # Actualizar el archivo de versión y el log
    cp "$v2_dir/version2.txt" "$v1_dir/version1.txt"
    printf "$timestamp $(tput setaf 128)INFO$(tput setaf 7): File has been updated successfully \n\n" >> "$log_file"

else
    echo "ERROR: version1.txt does not exist."
fi