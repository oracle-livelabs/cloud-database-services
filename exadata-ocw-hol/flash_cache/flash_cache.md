# Flash Cache

## Introduction

In this practice, you are introduced to the Flash Cache capability of Exadata.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you will:
* Execute a query that does not utilize Flash Cache and observe the results
* Execute a query that utilizes Flash Cache and observe the results

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user

## Query Without Flash Cache

Execute the query in the SQL script `lab_flash_cache_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and retry.

    @lab_flash_cache_01.sql

Flush the buffer cache to ensure that the queries must retrieve the required data from the storage cells.

    EXECUTE sys.flush_buffer_cache;

Execute the SQL script `lab_flash_cache_02.sql`. The PL/SQL block performs 500 record lookups spread across a reasonably large table. The workload is representative of the scattered record access normally associated with an OLTP application. Note that the workload may take a few minutes to complete.

    @lab_flash_cache_02.sql

Repeat the statistics query in the SQL script `lab_flash_cache_01.sql`. Note the high number of IO requests (`physical read total IO requests`) relative to the low number of optimized requests (`physical read requests optimized` and `cell flash cache read hits`). This indicates that the queries were mostly satisfied by using physical disk reads and is indicative of a recently emptied cache.

    @lab_flash_cache_01.sql

> Note: If cell flash cache read hits is not showing near zero, run the `lab_flash_cache_cleanup.sql` script to reset the table used for this practice and start the practice over again.

## Query With Flash Cache

Disconnect and reconnect your session. Repeat the statistics query using the SQL script `lab_flash_cache_01.sql` and verify that the statistics are again at or near zero values. If any statistics are significantly greater than zero then reconnect again and retry.

    @lab_flash_cache_01.sql

Again, flush the buffer cache to ensure that the queries in the next step must retrieve the required data from the Exadata cells.

    EXECUTE sys.flush_buffer_cache;

Re-execute the query in the SQL script `lab_flash_cache_02.sql`.

    @lab_flash_cache_02.sql

Repeat the statistics query using the SQL script `lab_flash_cache_01.sql`. Compare the values for `cell flash cache read hits` and `physical read total IO requests`. They should be closer together, indicating that most of the I/Os were satisfied by Exadata Smart Flash Cache.

    @lab_flash_cache_01.sql