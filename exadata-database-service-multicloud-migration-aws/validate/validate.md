# Validate the Migration

## Introduction

**Estimated time:** 5 minutes.

### Objectives

- Verify that the migrated database is fully operational.

## Task 1: Connect to the Target Database and Validate the database role

Finally, verify the target database role.

``` text
<copy>[oracle@exadbaws1 ~]$ sqlplus / as sysdba
SQL> select database_role from v$database;
DATABASE_ROLE
----------------
PRIMARY</copy>
```

The physical online migration to Exadata Database Service on Oracle AI
Database@AWS is complete.

## Acknowledgements

**Authors** 

* Leo Alvarado, Sebastian Solbach, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026