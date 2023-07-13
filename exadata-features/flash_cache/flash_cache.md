# Flash Cache

## Introduction

In this practice, you are introduced to the Flash Cache capability of Exadata.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Flash Cache](videohub:1_23ozwakq)

### Objectives

In this lab, you will:
* Execute a query that does not utilize Flash Cache and observe the results
* Execute a query that utilizes Flash Cache and observe the results

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user

## Task 1: Query Without Flash Cache

1: Execute the query in the SQL script `lab_flash_cache_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and retry.
```text
<copy>
@lab_flash_cache_01.sql
</copy>
```

2: Flush the buffer cache to ensure that the queries must retrieve the required data from the storage cells.
```text
<copy>
EXECUTE sys.flush_buffer_cache;
</copy>
```

3: Execute the SQL script `lab_flash_cache_02.sql`. The PL/SQL block performs 500 record lookups spread across a reasonably large table. The workload is representative of the scattered record access normally associated with an OLTP application. Note that the workload may take a few minutes to complete.
```text
<copy>
@lab_flash_cache_02.sql
</copy>
```

4: Repeat the statistics query in the SQL script `lab_flash_cache_01.sql`. Note the high number of IO requests (`physical read total IO requests`) relative to the low number of optimized requests (`physical read requests optimized` and `cell flash cache read hits`). This indicates that the queries were mostly satisfied by using physical disk reads and is indicative of a recently emptied cache.
```text
<copy>
@lab_flash_cache_01.sql
</copy>
```

> Note: If cell flash cache read hits is not showing near zero, run the `lab_flash_cache_cleanup.sql` script to reset the table used for this practice and start the practice over again.

## Task 2: Query With Flash Cache

1: Disconnect and reconnect your session. Repeat the statistics query using the SQL script `lab_flash_cache_01.sql` and verify that the statistics are again at or near zero values. If any statistics are significantly greater than zero then reconnect again and retry.
```text
<copy>
@lab_flash_cache_01.sql
</copy>
```

2: Again, flush the buffer cache to ensure that the queries in the next step must retrieve the required data from the Exadata cells.
```text
<copy>
EXECUTE sys.flush_buffer_cache;
</copy>
```

3: Re-execute the query in the SQL script `lab_flash_cache_02.sql`.
```text
<copy>
@lab_flash_cache_02.sql
</copy>
```

4: Repeat the statistics query using the SQL script `lab_flash_cache_01.sql`. Compare the values for `cell flash cache read hits` and `physical read total IO requests`. They should be closer together, indicating that most of the I/Os were satisfied by Exadata Smart Flash Cache.
```text
<copy>
@lab_flash_cache_01.sql
</copy>
```

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, March 2023