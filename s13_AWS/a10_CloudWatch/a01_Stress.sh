#!/bin/bash

while true; do
    # Random stress duration: 61-300 seconds
    stress_time=$((RANDOM % 240 + 62))

    # Random sleep interval: 30-180 seconds
    sleep_time=$((RANDOM % 151 + 30))

    echo "$(date) - Running stress for ${stress_time}s"
    echo "$(date) - Starting process: stress -c 4 -t ${stress_time} (PID: $$)"
    stress -c 35 -t "$stress_time"

    echo "$(date) - Sleeping for ${sleep_time}s"
    sleep "$sleep_time"
done