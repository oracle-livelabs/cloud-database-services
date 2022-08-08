# Hybrid Columnar Compression

## Introduction

In this practice, you are introduced to the Hybrid Columnar Compression capability of Exadata.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you will:
* Create two tables using Hybrid Columnar Compression
* Observe how the compression levels affect the size of the data

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata database with sqlplus as the SH user
* The MYCUST_QUERY table has not yet been created - if it has, run the `lab_hcc_cleanup.sql` script

## Verify the Source Table

Determine the size of the uncompressed CUSTOMERS table using the SQL script `lab_hcc_01.sql`.

    @lab_hcc_01.sql

Verify that the CUSTOMERS table is uncompressed using the SQL script `lab_hcc_02.sql`.

    @lab_hcc_02.sql

## Create Compressed Tables

Exadata Hybrid Columnar Compression achieves its highest levels of compression with data that is direct-path inserted. Execute the following `ALTER SESSION` commands to ensure the use of direct-path inserts in the practice.

```
alter session force parallel query;
alter session force parallel ddl;
alter session force parallel dml;
```

Create a compressed copy of the CUSTOMERS table by using the QUERY HIGH warehouse compression mode using the SQL script `lab_hcc_03.sql`.

    @lab_hcc_03.sql

Create a compressed copy of the CUSTOMERS table using the ARCHIVE HIGH archive compression mode using the SQL script `lab_hcc_04.sql`. Note that it may take a few minutes for the table to be created.

    @lab_hcc_04.sql

## Observe the Effects of HCC

Verify the compression mode settings for the tables you just created using the SQL script `lab_hcc_02.sql`.

    @lab_hcc_02.sql

Compare the size of the original uncompressed table with the two compressed copies you created using the SQL script `lab_hcc_01.sql`.

    @lab_hcc_01.sql
