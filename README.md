# Actualización de Archivos

Este script en bash está diseñado para actualizar un archivo llamado `version1.txt` por otro archivo llamado `version2.txt`. El archivo `version1.txt` se encuentra en la carpeta `v1`, mientras que el archivo `version2.txt` está en la carpeta `v2`. Este script también registra información en un archivo de registro `counter.log`.

## Uso

1. Asegúrate de tener los archivos `version1.txt` y `version2.txt` en las carpetas `v1` y `v2` respectivamente.

2. Modifica el valor de `v1_dir`, `v2_dir` y `log_file` en el script con las rutas absolutas correctas en tu sistema.

3. Ejecuta el script con el siguiente comando:

   ```bash
   ./update_script.sh

## Detalles del Script

El script funciona de la siguiente manera:

1. Verifica si el archivo version1.txt existe en la carpeta v1.

2. Si el archivo existe, copia el contenido de version2.txt a version1.txt.

3. Genera una marca de tiempo en el formato YYYY-MM-DD HH:MM:SS.

4. Registra la información en el archivo de registro counter.log en el forma

```
Marca de tiempo Contador INFO: El archivo ha sido actualizado exitosamente  
```