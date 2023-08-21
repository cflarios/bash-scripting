# System Resource Monitoring Script

This Bash script is designed to monitor various system resource usage parameters and notify you if they exceed predefined thresholds. The script retrieves CPU usage, memory usage, and disk usage metrics, compares them against specified thresholds, and provides warnings if any of these metrics exceed their respective thresholds.

## Usage

1. Clone this repository to your local machine:

    ```bash
    https://github.com/cflarios/bash-scripting.git

2. Navigate to the repository directory:

    ```bash
    cd bash-scripting/monitoring_resources

3. Make the script executable:

    ```bash
    chmod +x resources_script.sh

4. Run the script:

    ```bash
    ./resources_script.sh

## Configuration

You can customize the monitoring thresholds by modifying the values in the script. Open the `monitoring_script.sh` file and locate the following lines:

```
#cpu use threshold
cpu_threshold='80.0'

#mem idle threshold
mem_threshold='85.0'

#disk use threshold
disk_threshold='90.0'
```

Adjust the values of cpu_threshold, mem_threshold, and disk_threshold to your desired levels. These thresholds determine when a warning will be displayed for each respective metric.

## Metrics Monitored

- CPU Usage: This section displays the current CPU usage as a percentage. If the CPU usage exceeds the defined threshold, a warning message will be displayed.

- Memory Usage: This section displays the current memory usage as a percentage. If memory usage surpasses the threshold, a warning message will be shown.

- Disk Usage: This section shows the disk usage of the root filesystem ("/") as a percentage. If disk usage crosses the specified threshold, a warning message will be printed.

## Warning Messages

If any of the monitored metrics exceed their corresponding thresholds, a warning message will be displayed below the metric's information.