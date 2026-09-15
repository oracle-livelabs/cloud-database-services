# Prepare the Source Database

## Introduction

In this task, you will configure SSH access from the ZDM service host to
the source database host and configure source-host name resolution for
the target database.

**Estimated time:** 15 minutes.

### Objectives

- Configure the on-premises Oracle Database for migration.

> ***IMPORTANT — Pre-configured Environment.*** The configuration steps included in the following tasks are provided for instructional purposes only and will be discussed during the session. ***You do not need to perform these steps unless instructed.***

## Task 1: Prepare the Source Database Host On-Premises

Copy the ZDM user's SSH public key to the source database host.

``` bash
#on ZDM host as zdmuser
[zdmuser@zdmhost ~]$ cat .ssh/id_rsa.pub
#on the source database host as user onpuser
[onpuser@onphost ~]$ vi .ssh/authorized_keys
#insert the public key and save the changes
```

Add the target database hostname, IP address, and SCAN name to
`/etc/hosts` on the source host.

``` bash
[root@onphost ~]# vi /etc/hosts
#add the following entries
ta.db.og.1 exadbaws1.oraclevcn.com exadbaws1
ta.db.og.2 exadbaws2.oraclevcn.com exadbaws2
ta.db.og.3 demo-scan-sample.oraclevcn.com target-scan
```

## Task 2: Prepare the Source Database On-Premises

As the `SYS` user, configure and verify the source database
requirements.

``` text
<copy>-- To protect against unlogged direct writes in the primary database that cannot be propagated to the standby database, turn on FORCE LOGGING at the primary database:
SQL> alter database force logging;
SQL> select force_logging from v$database;
FORCE_LOGGING
---------------------------------------
YES
-- Enable ARCHIVELOG mode for the database:
SQL> select log_mode from v$database;
LOG_MODE
------------
ARCHIVELOG
-- For Oracle Database 12c Release 2 and later, it is mandatory to configure TDE before migration begins
SQL> select wrl_type, status from v$encryption_wallet;
WRL_TYPE STATUS
-------------------- ------------------------------
FILE OPEN
-- Set RMAN CONFIGURE CONTROLFILE AUTOBACKUP to ON
RMAN> CONFIGURE CONTROLFILE AUTOBACKUP ON;</copy>
```

## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026

