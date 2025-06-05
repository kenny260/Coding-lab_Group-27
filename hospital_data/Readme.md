Automated system to collect, archive, and analyze patient health data and resource usage.

 Components
- Simulators:
  - heart_monitor.py - Heart rate data
  - temp_sensor.py - Temperature data
  - water_meter.py - Water usage data

- Scripts:
  - archive_logs.sh - Log rotation tool
  - analyze_logs.sh - Data analysis tool
# heart_monitor.py helps us to get or see the heart rate data of a patient
# temp_sensor.py helps us to get the patient's temperature data
#water_meter.py helps us to know the water usage or get the water usage data

echo "select file to analyze" 
echo "1) Heart Rate (heart_rate_logs)"
echo "2) Temperature (temperature.logs)"
echo "3) Water Usage (water_usage.logs)"
echo "Enter choice (1-30)"
read -p "choice: " choice
