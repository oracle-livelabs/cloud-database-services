# Exadata Storage Server Lab

## Introduction

This lab will create the database environment in your on-premises or cloud Exadata for the database labs in this workshop.

The database labs can be run in a non-CDB or a PDB database. Since some of the labs will clear the database cache, it is recommended that if the lab database is a PDB, the CDB, in which it resides, not be shared with other PDBs, since the database cache is shared among all of the PDBs in a CDB.

The labs have been tested on Exadata models X7, X8, X8M, X9M and on database versions 19 and 21.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:
* Create the tablespace and database user
* Import the table data with Data Pump
* Create procedures to flush the buffer cache and shared pool
* Grant the necessary privileges to the database user
* Create the database tables

### Prerequisites

This lab assumes:
* The Exadata you are using is an X7, X8, X8M, or X9M
* The database version is 19 or 21
* You have created a dedicated non-CDB database or a PDB in a CDB that is not shared with other PDBs
* The database characterset is AL32UTF8/AL16UTF16

## Task 1: Create the USERS tablespace and SH user

Step 1: Create the USERS tablespace.
```text
<copy>
CREATE TABLESPACE users DATAFILE SIZE 4G AUTOEXTEND ON NEXT 1G;
</copy>
```

Step 2: Create the SH database user. Change <i>password</i> to the password you would like to use.
```text
<copy>
CREATE USER sh IDENTIFIED BY password;

ALTER USER sh DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;
</copy>
```

## Task 2: Import the table data

Step 1: Create a directory on the server for the Data Pump import file.
```text
<copy>
mkdir /home/oracle/exadata_features_hol
</copy>
```

Step 2: Put the [Data Pump file](https://github.com/oracle-livelabs/cloud-database-services/blob/main/exadata-features/prep/files/exadata_features_hol_tables.dmp) in the directory you just created.
```text
<copy>
cp exadata_features_hol_tables.dmp /home/oracle/exadata_features_hol/
</copy>
```

Step 3: Log into the database as an admin user and create the directory object.
```text
<copy>
CREATE DIRECTORY exadata_features_hol AS '/home/oracle/exadata_features_hol';
</copy>
```

Step 4: On the server, use Data Pump to import the database data.
```text
<copy>
impdp dumpfile=exadata_features_hol_tables.dmp directory=exadata_features_hol logfile=exadata_features_hol_import.log
</copy>
```

## Task 3: Create database procedures and grant privileges

Step 1: Create the [flush_buffer_cache](https://github.com/oracle-livelabs/cloud-database-services/blob/main/exadata-features/prep/files/flush_buffer_cache.sql) and [flush_shared_pool](https://github.com/oracle-livelabs/cloud-database-services/blob/main/exadata-features/prep/files/flush_shared_pool.sql) database procedures as an admin user in the database.
```text
<copy>
@flush_buffer_cache.sql -- execute as admin user
@flush_shared_pool.sql -- execute as admin user
</copy>
```

Step 2: Grant the necessary privileges to the SH user. Run these commands as an admin user in the database.
```text
<copy>
GRANT CONNECT TO sh;
GRANT CREATE TABLE TO sh;
GRANT SELECT ON v_$sysstat TO sh;
GRANT SELECT ON v_$mystat TO sh;
GRANT SELECT ON v_$statname TO sh;
GRANT EXECUTE ON flush_buffer_cache TO sh;
GRANT EXECUTE ON flush_shared_pool TO sh;
</copy>
```

## Task 4: Create the database tables

Execute the rest of the commands in the database as the SH user.

Step 1: Create the sales table and grow it to 2GB.
```text
<copy>
CREATE TABLE sales AS
SELECT * FROM sales_org WHERE 1=0;

BEGIN
FOR i IN 1 .. 64 LOOP
INSERT /*+ APPEND PARALLEL(4) */ INTO sales
SELECT * FROM sales_org;
COMMIT;
END LOOP;
END;
/
</copy>
```

Step 2: Create the customers_tmp table and grow it to 2GB.
```text
<copy>
CREATE TABLE customers_tmp AS
SELECT * FROM customers_org WHERE 1=0;

BEGIN
FOR i IN 1 .. 155 LOOP
INSERT /*+ APPEND PARALLEL(4) */ INTO customers_tmp
SELECT * FROM customers_org;
COMMIT;
END LOOP;
END;
/
</copy>
```

Step 3: Create the customers table and populate it with an ordered data set.
```text
<copy>
CREATE TABLE customers AS
SELECT * FROM customers_org
WHERE 1=0;

INSERT /*+ APPEND */ INTO customers
SELECT * FROM customers_tmp
ORDER BY cust_income_level;
COMMIT;
</copy>
```

Step 4: Create and populate the customers_fc table.
```text
<copy>
CREATE TABLE customers_fc AS
SELECT * FROM customers_org
WHERE 1=0;

INSERT /*+ APPEND PARALLEL(4) */ INTO customers_fc
SELECT * FROM customers_org;
COMMIT;
</copy>
```

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, March 2023