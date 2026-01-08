# High CPU Troubleshooting on SQL Server Linux

## Overview
This module contains the workflow for identifying the root cause of High CPU usage on SQL Server running on Linux (RHEL/Ubuntu).

## The Methodology
We use a 3-layer approach to isolate the issue:
1. **OS Layer:** Identify the Process (`top`) and Thread (`pidstat`).
2. **File Layer:** Confirm file handles and check for Antivirus contention (`lsof`).
3. **Application Layer:** Map the Linux Thread ID to the specific SQL Query (`sys.dm_os_threads`).
