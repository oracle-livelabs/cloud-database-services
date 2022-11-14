## Setup Database

The database labs can be run in a non-CDB or a PDB database. Since some of the labs will clear the database cache, it is recommended that if the lab database is a PDB, the CDB not be shared with other PDBs, since the database cache is shared among all of the PDBs in a CDB.

There are two methods of adding the schema data. The first method is to import the Data Pump dump file that included in this repository. There are no special database options required when using the Data Pump import method but the database characterset should be AL32UTF8/AL16UTF16.

The second method is to use the sample schemas which has a specific set of requirements. More information can be found at https://github.com/oracle-samples/db-sample-schemas/releases.

The labs have been tested on Exadata models X7, X8, X8M, X9M and on database versions 19 and 21.

## Create tablespace and user

```
CREATE TABLESPACE users DATAFILE SIZE 4G AUTOEXTEND ON NEXT 1G;

CREATE USER sh IDENTIFIED BY <password>;

ALTER USER sh DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;
```

## Import table data

If you have the Data Pump export for the lab, use these steps. If not, skip down to the Install SH sample schema step below.

Put the Data Pump file in a directory on the server, then create a database directory object with the same path and load with Data Pump.
```
CREATE DIRECTORY exadata_features_hol AS '/home/oracle/exadata_features_hol';

impdp dumpfile=exadata_features_hol_tables.dmp directory=exadata_features_hol logfile=exadata_features_hol_import.log
```

## Install SH sample schema

Only do this if you were not able to load the tables with the Data Pump export in the previous section.

https://github.com/oracle-samples/db-sample-schemas/releases

> Note: Only the Sales History schema is used. This command installs just the SH schema.
```
@/home/oracle/db-sample-schemas-19c/sales_history/sh_main &&password_sh &&default_ts &&temp_ts &&password_sys /home/oracle/db-sample-schemas-19c/sales_history/ &&logfile_dir v3 &&connect_string
```

## Procedures

Run the following scripts located in this repository to create procedures that flush the database buffer cache and shared pool.
```
@flush_buffer_cache.sql -- execute as admin user
@flush_shared_pool.sql -- execute as admin user
```

## Grants

Grant the necessary permissions to the SH user.
```
GRANT CONNECT TO sh;
GRANT CREATE TABLE TO sh;
GRANT SELECT ON v_$sysstat TO sh;
GRANT SELECT ON v_$mystat TO sh;
GRANT SELECT ON v_$statname TO sh;
GRANT EXECUTE ON flush_buffer_cache TO sh;
GRANT EXECUTE ON flush_shared_pool TO sh;
```

## Tables

Run all of the following commands as SH.

If the HCC practice has been done before, these tables will need to be dropped.
```
DROP TABLE mycust_archive PURGE;
DROP TABLE mycust_query PURGE;
```

Rename the sales table. This does not need to be done if it has been done previously or the schema was loaded from the Data Pump dump file.
```
ALTER TABLE sales RENAME TO sales_org;
```

Grow the sales table to 2G.
```
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
```

Rename the customers table. This does not need to be done if it has been done previously or the schema was loaded from the data pump dump file.
```
ALTER TABLE customers RENAME TO customers_org;
```

Create a customers_tmp table and grow it to 2G.
```
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
```

Create the customers table.
```
CREATE TABLE customers AS
SELECT * FROM customers_org
WHERE 1=0;

INSERT /*+ APPEND */ INTO customers
SELECT * FROM customers_tmp
ORDER BY cust_income_level;
COMMIT;
```

Create the customers_fc table.
```
CREATE TABLE customers_fc AS
SELECT * FROM customers_org
WHERE 1=0;

INSERT /*+ APPEND PARALLEL(4) */ INTO customers_fc
SELECT * FROM customers_org;
COMMIT;
```

## Student Environment

Create a local tnsnames.ora file.
```
mkdir -p ~/tnsadmin

echo "
DB =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = <database scan name>)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = <database service name>)
    )
  )" > ~/tnsadmin/tnsnames.ora
```

Add environment variables to shell source file (i.e. .bashrc or .bash_profile).
```
export TNS_ADMIN=~/tnsadmin
export TWO_TASK=DB
export PATH=<oracle home path>/bin:$PATH
export ORACLE_HOME=<oracle home path>
cd ~/files
```

## Miscellaneous

Only do this if you want to create a dump file from a fresh install of the sample schema.
Export the sales_org and customers_org tables
```
mkdir /home/oracle/ocw_exports

create directory ocw_hol as '/home/oracle/ocw_exports';

expdp dumpfile=ocw_lab_tables.dmp directory=ocw_hol logfile=exp_ocw_lab_tables.log tables=sh.sales_org,sh.customers_org exclude=constraint,grant
```