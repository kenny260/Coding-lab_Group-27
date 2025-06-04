#!/bin/bash

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Set log file and archive directory based on choice

if [ "$choice" == "1" ]; then
    log_file="heart_rate_log.log"
    archive_dir="heart_data_archive"
elif [ "$choice" == "2" ]; then
    log_file="temperature_log.log"
    archive_dir="temp_data_archive"
elif [ "$choice" == "3" ]; then
    log_file="water_usage_log.log"
    archive_dir="water_data_archive"
else
    echo "Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Create a timestamped filename
timestamp=$(date '+%Y-%m-%d_%H:%M:%S')
archived_file="${log_file%.log}_$timestamp.log"

# Move log to archive and create a new empty log
echo "Archiving $log_file..."
mv "$log_file" "$archive_dir/$archived_file"

# Create new empty log file
touch "$log_file"

echo "Successfully archived to $archive_dir/$archived_file"
