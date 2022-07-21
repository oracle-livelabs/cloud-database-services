# Storage Indexes

In this practice, you are introduced to the storage index capability of Exadata.

Execute the SQL script `lab_storage_indexes_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and retry.

    @lab_storage_indexes_01.sql

Execute the SQL script `lab_storage_indexes_02.sql`.

    @lab_storage_indexes_02.sql

Repeat the statistics query using the SQL script `lab_storage_indexes_01.sql`. The statistics show that this query benefits from a storage index. Storage indexes were used to bypass a significant amount of I/O. Queries that benefit from storage indexes can execute more quickly using fewer resources which allows other workloads to benefit from the unused I/O resources.

    @lab_storage_indexes_01.sql
