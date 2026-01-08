#!/bin/bash
# CHEATSHEET: CPU Investigation Commands

# Step 1: Check System-wide CPU
# Look for 'sqlservr' or 'b9daemon' (Antivirus)
top

# Step 2: Find the specific Thread ID (TID) burning CPU
# Replace [PID] with the Process ID of sqlservr
# -t = threads, -p = PID, 1 = refresh interval
pidstat -t -p [PID] 1

# Step 3: Check for Antivirus Contention (File Locks)
# Check if a non-SQL process is holding DB files
sudo lsof +D /var/opt/mssql/data
