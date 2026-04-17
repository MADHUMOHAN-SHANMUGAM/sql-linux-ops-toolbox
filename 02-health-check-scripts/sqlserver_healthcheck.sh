#!/bin/bash

# ================================================
# SQL Server Health Check Script
# Author: Madhumohan Shanmugam
# Date: April 2026
# ================================================

LOG_FILE="/var/log/sqlserver_healthcheck.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
SERVER="localhost"
DB_USER="sa"
DB_PWD="YourPassword"

echo "$DATE -- Starting SQL Server health check..." | tee -a $LOG_FILE

DB_COUNT=$(sqlcmd -S $SERVER -U $DB_USER -P $DB_PWD \
    -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM sys.databases" \
    -h -1 2>/dev/null | tr -d ' ')

if [ -z "$DB_COUNT" ]; then
    echo "$DATE -- FAILED -- Could not connect to SQL Server!" | tee -a $LOG_FILE
else
    echo "$DATE -- SUCCESS -- Found ${DB_COUNT} databases!" | tee -a $LOG_FILE
fi

echo "$DATE -- Health check completed!" | tee -a $LOG_FILE