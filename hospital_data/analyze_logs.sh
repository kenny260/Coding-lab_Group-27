#!/usr/bin/bash
echo "Select a log file to analyze"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo "Enter choice (1-3)"
read -p choice 

if [[ "$choice" == "1"]]; then
	name="heaty_rate.log.log"
elif [[ "$choice" == "2"]]; then
	name="temperature.log.log"
elif [["$choice" == "3" ]] then 
	name="water_usage.log.log"

else 
	echo "Invalid selection. Run the script again"
	exit 1

fi

case $choice in 
	1) logfile="heart_rate.log";;
	2) logfile="temperature.log";;
	3) logfile="water_usage.log";;
esac

#Check if the log file exists
if [ ! -f "$logfile" ]; then 
       echo "Log file '$logfile' not found."
	exit 1
 fi 

#prepare analysis output 
echo "Analyzing file: $logfile"
echo "Analysis Report -$(date)" >> report/analysis_report.txt
echo "File: $logfile" >> reports/analysis_report.txt

#count total entries and get timestamps 
awk '{print $2}' "$logfile" | sort | uniq -c | while read count device; do 
	#Find first and last timestamp for the device 
	first=$(grep " $device" "$logfile" |head -n 1 | awk '{print $1}')
	last=$(grep "$device" "$logfile" | head -n 1 | awk '{print $1}')
	echo "$device: $count entries (First: $first, Last: $last)" >> reports/analysis_report.txt
done

echo "Analysis completed and appended to reports/analysis_report.txt"

