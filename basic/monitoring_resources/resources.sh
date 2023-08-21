#!/bin/bash

#cpu use threshold
cpu_threshold='80.0'

#mem idle threshold
mem_threshold='85.0'

#disk use threshold
disk_threshold='90.0'

# Get CPU usage
cpu() {
    cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    echo "CPU usage: $cpu_usage%"

    float_cpu_usage=$(echo $cpu_usage | tr ',' ".")

    result=$(echo "$float_cpu_usage > $cpu_threshold" | bc -l)

    if [ "$result" -eq 1 ]; then
        echo " WARNING:     CPU usage is above $cpu_threshold%."
    fi
}

# Get memory usage
memory() {
    memory_usage=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')

    echo "Memory usage: $memory_usage"

    float_memory_usage=$(echo $memory_usage | tr ',' '.' | sed 's/.$//')

    result=$(echo "$float_memory_usage > $mem_threshold" | bc -l)

    if [ "$result" -eq 1 ]; then
        echo "WARNING:  Memory usage is above $mem_threshold%."
    fi
}

# Get disk usage

disk() {
    disk_usage=$(df -h / | awk 'NR==2{print $5}')

    echo "Disk usage on /: $disk_usage"

    float_disk_usage=$(echo $disk_usage | tr -d '%')

    result=$(echo "$float_disk_usage > $disk_threshold" | bc -l)

    if [ "$result" -eq 1 ]; then
        echo "WARNING:  Disk usage is above $disk_threshold%."
    fi
}

printf "\n"
echo "+------------------------+"
printf "| System resources usage |\n"
echo "+------------------------+"
printf "\n"
cpu
memory
disk

