# Smart Scan Lab

## Introduction

In this practice, you are introduced to the Smart Scan capability of Exadata. You will execute queries with and without Smart Scan enabled, and examine statistics to measure the effect of Smart Scan. There are two tasks in this lab. The first task demonstrates the query results without the Smart Scan capabilities. The second task demonstrates the advantages of using Smart Scan when executing the exact same query.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Smart Scan](videohub:1_nmoqgvls)

### Objectives

In this lab, you will:
* Execute a query and verify Smart Scan was not used
* Execute the same query with Smart Scan enabled and observe how Smart Scan improved the query

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user

## Task 1: Query Without Smart Scan

1. Connect to the database with `sqlplus /@db`. Use the alias `sqlp`. The rest of the lab will be executed in sqlplus.

    ```text
    <copy>
    sqlp
    </copy>
    ```

2. Execute the SQL script `lab_smart_scan_01.sql` and verify that the statistics are at or near zero values. If any statistics are significantly greater than zero then reconnect and try again.

    ```text
    <copy>
    @lab_smart_scan_01.sql
    </copy>
    ```

3. Execute the SQL script `lab_smart_scan_02.sql`. Note the optimizer hint that disables Smart Scan for the query.

    ```text
    <copy>
    @lab_smart_scan_02.sql
    </copy>
    ```

4. Repeat the statistics query from the SQL script `lab_smart_scan_01.sql`. Note that all of the data processed by the query in previous step (`physical read total bytes`) is returned to the database server over the storage network (`cell physical IO interconnect bytes`).

    ```text
    <copy>
    @lab_smart_scan_01.sql
    </copy>
    ```

## Task 2: Query With Smart Scan

1. Disconnect and reconnect your sqlplus session.

    ```text
    <copy>
    exit
    sqlp
    </copy>
    ```

2. Repeat the statistics query from the SQL script `lab_smart_scan_01.sql` and verify that the statistics are again at or near zero values. If any statistics are significantly greater than zero then reconnect again and retry.

    ```text
    <copy>
    @lab_smart_scan_01.sql
    </copy>
    ```

3. Execute the SQL script `lab_smart_scan_03.sql`. This is the same query, but this time there is no optimizer hint to disable Smart Scan.

    ```text
    <copy>
    @lab_smart_scan_03.sql
    </copy>
    ```

4. Repeat the statistics query from the SQL script `lab_smart_scan_01.sql`. Note that the query still performs physical I/O (`physical read total bytes`). However, this time only a fraction of that is actually returned to the database server (`cell physical IO interconnect bytes`). This is Smart Scan in action. Also note that in this case, Smart Scan is acting on all of the I/O associated with the query. This is the case because `cell physical IO bytes eligible for predicate offload` equals `physical read total bytes`, and `cell physical IO interconnect bytes returned by smart scan` equals `cell physical IO interconnect bytes`.

    ```text
    <copy>
    @lab_smart_scan_01.sql
    </copy>
    ```

5. Exit the sqlplus session before starting the next lab.

    ```text
    <copy>
    exit
    </copy>
    ```

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, August 2024