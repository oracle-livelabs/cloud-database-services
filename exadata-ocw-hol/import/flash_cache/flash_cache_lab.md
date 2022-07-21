# Flash Cache

In this practice, you are introduced to the Flash Cache capability of Exadata.

Execute the query in the SQL script `lab_flash_cache_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and retry.

    @lab_flash_cache_01.sql

Flush the buffer cache to ensure that the queries must retrieve the required data from the storage cells.

    EXECUTE sys.flush_buffer_cache;

Execute the SQL script `lab_flash_cache_02.sql`. The PL/SQL block performs 500 record lookups spread across a reasonably large table. The workload is representative of the scattered record access normally associated with an OLTP application. Note that the workload may take a few minutes to complete.

    @lab_flash_cache_02.sql

Repeat the statistics query in the SQL script `lab_flash_cache_01.sql`. Note the high number of IO requests (`physical read total IO requests`) relative to the low number of optimized requests (`physical read requests optimized` and `cell flash cache read hits`). This indicates that the queries were mostly satisfied by using physical disk reads and is indicative of a recently emptied cache.

    @lab_flash_cache_01.sql

> Note: If cell flash cache read hits is not showing near zero, run the lab_flash_cache_cleanup.sql script to reset the table used for this practice and start the practice over again.

Disconnect and reconnect your session. Repeat the statistics query using the SQL script `lab_flash_cache_01.sql` and verify that the statistics are again at or near zero values. If any statistics are significantly greater than zero then reconnect again and retry.

    @lab_flash_cache_01.sql

Again, flush the buffer cache to ensure that the queries in the next step must retrieve the required data from the Exadata cells.

    EXECUTE sys.flush_buffer_cache;

Re-execute the query in the SQL script `lab_flash_cache_02.sql`.

    @lab_flash_cache_02.sql

Repeat the statistics query using the SQL script `lab_flash_cache_01.sql`. Compare the values for `cell flash cache read hits` and `physical read total IO requests`. They should be closer together, indicating that most of the I/Os were satisfied by Exadata Smart Flash Cache.

    @lab_flash_cache_01.sql

Use the query from the SQL script `lab_flash_cache_03.sql` to determine the number of optimized physical reads (reads optimized by Exadata Smart Flash Cache or Exadata storage index) for the CUSTOMERS table. Note the tablespace number (TS#) and object number (DATAOBJ#) associated with the table, as well as the dbid and pdb_name.

    @lab_flash_cache_03.sql

Use the tablespace number (TS#), object number (DATAOBJ#), dbid, and pdb_name from the previous step to query the Exadata Smart Flash Cache. The output relates specifically to the SH.CUSTOMERS table.

    list flashcachecontent where objectnumber=<DATAOBJ#> and tablespacenumber=<TS#> and dbuniquename="<DB_UNIQUE_NAME>.<PDB_NAME>" detail
