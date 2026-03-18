#!/bin/bash

# Define the target URL and the restart command
URL="https://miso.bio.nyu.edu/login"
RESTART_COMMAND="/root/bin/miso restart"  # Adjust the path to 'miso' if needed
LOG_FILE="/var/log/miso_monitor.log"
EXPECTED_CODE="200"

# Use curl to get the HTTP status code, suppressing output and following redirects
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L -k --max-time 1 "$URL")

# Check if the returned code is NOT the expected code
if [ "$HTTP_CODE" -ne "$EXPECTED_CODE" ]; then
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    echo "$TIMESTAMP: Service check failed. Received code $HTTP_CODE (expected $EXPECTED_CODE). Attempting restart." >> "$LOG_FILE"
    
    # Execute the restart command
    $RESTART_COMMAND
    
    # Log the action (we assume the restart command itself handles its success/failure logging)
    echo "$TIMESTAMP: Restart command executed." >> "$LOG_FILE"
else
    # Optionally log success for debugging, though cron usually ignores script output on success
    # echo "$(date "+%Y-%m-%d %H:%M:%S"): Service check successful. Code $HTTP_CODE." >> "$LOG_FILE"
    exit 0
fi
