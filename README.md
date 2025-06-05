Hospital Data Montoring and Archival System

    Overview

This system provides automated collection, archiving, and analysis of patient health metrics and resource usage data in a hospital environment.

System Components

  1. Data Collection Simulators

Three Python simulators generate realistic log data:

     Heart Rate Monitor (heart_monitor.py)

Simulates two heart rate monitors

Logs data to hospital_data/active_logs/heart_rate.log

     Temperature Sensor (temp_sensor.py)

Simulates two temperature sensors

Logs data to hospital_data/active_logs/temperature.log

      Water Meter (water_meter.py)

Simulates water usage

Logs data to hospital_data/active_logs/water_usage.log

   2. Log Management Scripts

       archive_logs.sh

Archives active log files while maintaining continuous data collection

Presents an interactive menu for log selection

Handles errors gracefully

      analyze_logs.sh

Analyzes log files for device statistics and usage patterns

Generates comprehensive reports

Tracks first and last entries for each device
