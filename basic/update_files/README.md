# Update files

This bash script is designed to update a file named `version1.txt` with another file named `version2.txt`. The `version1.txt` file is located in the `v1` folder, while the `version2.txt` file is in the `v2` folder. This script also logs information in a `update.log` file.

## Usage

1. Make sure you have the `version1.txt` and `version2.txt` files in the `v1` and `v2` folders respectively.

2. Modify the values of `v1_dir`, `v2_dir`, and `log_file` in the script with the correct absolute paths on your system.

3. Execute the script using the following command:

   ```bash
   ./update_script.sh

## Script Details

The script works as follows:

1. Checks if the `version1.txt` file exists in the `v1` folder.

2. If the file exists, it copies the content of `version2.txt` to `version1.txt`.

3. Generates a timestamp in the format `YYYY-MM-DD HH:MM:SS`.

4. Logs the information in the `update.log` file in the format:

```
Timestamp INFO: File has been updated successfully 
```

## Adding a Cron Job

You can automate the execution of this script using a cron job. To add a cron job:

1. Open your terminal.

2. Edit your crontab file by running:

```bash
crontab -e
```
3. Add the following line to the crontab file to run the script every day at 3:00 AM:
   
```bash
0 3 * * * /path/to/update_script.sh
```
4. Save and exit the crontab editor.

The script will now be executed automatically every day at 3:00 AM.