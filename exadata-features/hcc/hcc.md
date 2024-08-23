# Hybrid Columnar Compression

## Introduction

In this practice, you are introduced to the Hybrid Columnar Compression capability of Exadata.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Hybrid Columnar Compression](videohub:1_6u8wbsrw)

### Objectives

In this lab, you will:
* Create two tables using Hybrid Columnar Compression
* Observe how the compression levels affect the size of the data

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user
* The MYCUST_QUERY table has not yet been created - if it has, run the `lab_hcc_cleanup.sql` script

## Task 1: Verify the Source Table

1. Connect to the database with `sqlplus /@db`. Use the alias `sqlp`. The rest of the lab will be executed in sqlplus.

    ```text
    <copy>
    sqlp
    </copy>
    ```

2. Determine the size of the uncompressed CUSTOMERS table using the SQL script `lab_hcc_01.sql`.

    ```text
    <copy>
    @lab_hcc_01.sql
    </copy>
    ```

3. Verify that the CUSTOMERS table is uncompressed using the SQL script `lab_hcc_02.sql`.

    ```text
    <copy>
    @lab_hcc_02.sql
    </copy>
    ```

## Task 2: Create Compressed Tables

1. Exadata Hybrid Columnar Compression achieves its highest levels of compression with data that is direct-path inserted. Execute the following `ALTER SESSION` commands to ensure the use of direct-path inserts in the practice.

    ```text
    <copy>
    alter session force parallel query;
    alter session force parallel ddl;
    alter session force parallel dml;
    </copy>
    ```

2. Create a compressed copy of the CUSTOMERS table by using the QUERY HIGH warehouse compression mode using the SQL script `lab_hcc_03.sql`.

    ```text
    <copy>
    @lab_hcc_03.sql
    </copy>
    ```

3. Create a compressed copy of the CUSTOMERS table using the ARCHIVE HIGH archive compression mode using the SQL script `lab_hcc_04.sql`. Note that it may take a few minutes for the table to be created.

    ```text
    <copy>
    @lab_hcc_04.sql
    </copy>
    ```

## Task 3: Observe the Effects of HCC

1. Verify the compression mode settings for the tables you just created using the SQL script `lab_hcc_02.sql`.

    ```text
    <copy>
    @lab_hcc_02.sql
    </copy>
    ```

2. Compare the size of the original uncompressed table with the two compressed copies you created using the SQL script `lab_hcc_01.sql`.

    ```text
    <copy>
    @lab_hcc_01.sql
    </copy>
    ```


3. Exit the sqlplus session before starting the next lab.

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