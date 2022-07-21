# Hybrid Columnar Compression

In this practice, you are introduced to the Hybrid Columnar Compression capability of Exadata.

Determine the size of the uncompressed CUSTOMERS table using the SQL script `lab_hcc_01.sql`.

    @lab_hcc_01.sql

Verify that the CUSTOMERS table is uncompressed using the SQL script `lab_hcc_02.sql`.

    @lab_hcc_02.sql

Exadata Hybrid Columnar Compression achieves its highest levels of compression with data that is direct-path inserted. Execute the following `ALTER SESSION` commands to ensure the use of direct-path inserts in the practice.

```
alter session force parallel query;
alter session force parallel ddl;
alter session force parallel dml;
```

Create a compressed copy of the CUSTOMERS table by using the QUERY HIGH warehouse compression mode using the SQL script `lab_hcc_03.sql`.

    @lab_hcc_03.sql

> Note: If MYCUST_QUERY table already exists, run the lab_hcc_cleanup.sql script to drop it and run the lab_hcc_03.sql script again.

Create a compressed copy of the CUSTOMERS table using the ARCHIVE HIGH archive compression mode using the SQL script `lab_hcc_04.sql`. Note that it may take a few minutes for the table to be created.

    @lab_hcc_04.sql

Verify the compression mode settings for the tables you just created using the SQL script `lab_hcc_02.sql`.

    @lab_hcc_02.sql

Compare the size of the original uncompressed table with the two compressed copies you created using the SQL script `lab_hcc_01.sql`.

    @lab_hcc_01.sql
