/* Author: Your Name
   Description: Maps a Linux OS Thread ID to an internal SQL Server Session.
*/

-- Replace 4052 with the Thread ID you found in pidstat
DECLARE @LinuxThreadID INT = 4052; 

SELECT 
    r.session_id,
    t.os_thread_id,
    r.status,
    r.wait_type,
    st.text AS query_text
FROM sys.dm_os_threads t
INNER JOIN sys.dm_os_workers w ON t.worker_address = w.worker_address
INNER JOIN sys.dm_exec_requests r ON w.task_address = r.task_address
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) st
WHERE t.os_thread_id = @LinuxThreadID;
