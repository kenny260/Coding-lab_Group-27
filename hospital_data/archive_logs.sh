#!/bin/bash

# Display menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Get current timestamp
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

# Define base paths
base_dir="hospital_data"
active_dir="$base_dir/active_logs"

case "$choice" in
  1)
    log_file="heart_rate.log"
    archive_dir="$base_dir/heart_data_archive"
    new_name="heart_rate_$timestamp.log"
    ;;
  2)
    log_file="temperature.log"
    archive_dir="$base_dir/temperature_data_archive"
    new_name="temperature_$timestamp.log"
    ;;
  3)
    log_file="water_usage.log"
    archive_dir="$base_dir/water_data_archive"
    new_name="water_usage_$timestamp.log"
    ;;
  *)
    echo "Invalid choice. Please enter 1, 2, or 3."
    exit 1
    ;;
esac

# Ensure archive directory exists
mkdir -p "$archive_dir"

# Full paths
src_file="$active_dir/$log_file"
dest_file="$archive_dir/$new_name"

# Check if source file exists
if [ ! -f "$src_file" ]; then
  echo "Error: Log file '$src_file' not found."
  exit 1
fi

# Move and rename log file
mv "$src_file" "$dest_file"

# Create new empty file
touch "$src_file"

echo "Successfully archived to $dest_file"
