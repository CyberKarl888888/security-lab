#!/bin/bash
# Day 1 Monitoring Script

# Save the current date and time
date +%F_%T > ~/scripts/last_run.txt

# Capture the top 20 memory-using processes
ps aux --sort=-%mem | head -n 20 > ~/scripts/process_snapshot.txt

