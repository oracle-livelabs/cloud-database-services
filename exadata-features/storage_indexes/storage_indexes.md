# Storage Indexes

## Introduction

In this practice, you are introduced to the Storage Indexes capability of Exadata. There are two tasks in this lab. The first task demonstrates the query results without the Storage Index capabilities. The second task demonstrates the advantages of using Storage Indexes when executing the exact same query.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Storage Indexes](videohub:1_93yatb2t)

### Objectives

In this lab, you will:
* Execute a query that uses predicates that take advantage of Storage Indexes and observe the results

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user

## Task 1: Query with Storage Indexes

1. Execute the SQL script `lab_storage_indexes_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and retry.

    ```text
    <copy>
    @lab_storage_indexes_01.sql
    </copy>
    ```

2. Execute the SQL script `lab_storage_indexes_02.sql`.

    ```text
    <copy>
    @lab_storage_indexes_02.sql
    </copy>
    ```

3. Repeat the statistics query using the SQL script `lab_storage_indexes_01.sql`. The statistic `cell physical IO bytes saved by storage index` shows that this query benefits from a storage index. Storage indexes were used to bypass a significant amount of I/O. Queries that benefit from storage indexes can execute more quickly using fewer resources which allows other workloads to benefit from the unused I/O resources.

    ```text
    <copy>
    @lab_storage_indexes_01.sql
    </copy>
    ```

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, July 2023