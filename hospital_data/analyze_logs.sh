#!/usr/bin/bash

echo "Select a log file to analyze"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo "Enter choice (1-3)"
read -p "Choice: " choice

# Validate user input and assign log file name
if [[ "$choice" == "1" ]]; then
    name="heart_rate.log"
elif [[ "$choice" == "2" ]]; then
    name="temperature.log"
elif [[ "$choice" == "3" ]]; then
    name="water_usage.log"
else
    echo "Invalid selection. Run the script again."
    exit 1
fi

# Assign file based on choice
case $choice in
    1) logfile="heart_rate.log";;
    2) logfile="temperature.log";;
    3) logfile="water_usage.log";;
esac

# Check if the log file exists
if [ ! -f "$logfile" ]; then
    echo "Log file '$logfile' not found."
    exit 1
fi

# Ensure the reports directory exists
mkdir -p reports

# Prepare analysis outp

