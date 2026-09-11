# Migrate the Database Using Oracle Zero Downtime Migration (ZDM)

## Introduction

**Estimated time:** 15 minutes.

### Objectives

- Configure Oracle Zero Downtime Migration and migrate the source database to Oracle Database@Azure.
- Follow the Oracle ZDM technical guide sequence to perform a Physical Online Migration to Exadata Database Service on Oracle AI Database@Azure.

## Task 1: Initiate the Migration

Run the migration command without `-eval`. 

Use `-pauseafter ZDM_CONFIGURE_DG_SRC` to pause before the role swap and
switchover.

``` bash
<copy>[zdmuser@zdmhost ~]$ $ZDMHOME/bin/zdmcli migrate database \
-rsp /home/zdmuser/physical_online/physical_online.rsp \
-sourcesid oradb \
-sourcenode onphost \
-srcauth zdmauth \
-srcarg1 user:onpuser \
-srcarg2 identity_file:/home/zdmuser/.ssh/id_rsa \
-srcarg3 sudo_location:/usr/bin/sudo \
-targetnode exadbazure1 \
-tgtauth zdmauth \
-tgtarg1 user:opc \
-tgtarg2 identity_file:/home/zdmuser/.ssh/id_rsa \
-tgtarg3 sudo_location:/usr/bin/sudo \
-targethome /u02/app/oracle/product/19.0.0.0/dbhome_3 \
-tdekeystorepasswd \
-pauseafter ZDM_CONFIGURE_DG_SRC

Enter source database oradb SYS password:
Enter source database oradb TDE keystore password:
zdmhost: Processing response file ...
Operation "zdmcli migrate database" is scheduled with job ID "13".</copy>
```

Check the job status.

``` text
<copy>[zdmuser@zdmhost ~]$ $ZDMHOME/bin/zdmcli query job -jobid 13
...
Job ID: 13
User: zdmuser
Client: zdmhost
Job Type: "MIGRATE"
...
Current status: PAUSED
Result file path: "/home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-13.log"
Metrics file path: "/home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-13.json"
...
ZDM_GET_SRC_INFO .............. COMPLETED
ZDM_GET_TGT_INFO .............. COMPLETED
ZDM_PRECHECKS_SRC ............. COMPLETED
ZDM_PRECHECKS_TGT ............. COMPLETED
ZDM_SETUP_SRC ................. COMPLETED
ZDM_SETUP_TGT ................. COMPLETED
ZDM_PREUSERACTIONS ............ COMPLETED
ZDM_PREUSERACTIONS_TGT ........ COMPLETED
ZDM_VALIDATE_SRC .............. COMPLETED
ZDM_VALIDATE_TGT .............. COMPLETED
ZDM_DISCOVER_SRC .............. COMPLETED
ZDM_COPYFILES ................. COMPLETED
ZDM_PREPARE_TGT ............... COMPLETED
ZDM_SETUP_TDE_TGT ............. COMPLETED
ZDM_RESTORE_TGT ............... COMPLETED
ZDM_RECOVER_TGT ............... COMPLETED
ZDM_FINALIZE_TGT .............. COMPLETED
ZDM_CONFIGURE_DG_SRC .......... COMPLETED
ZDM_SWITCHOVER_SRC ............ PENDING
ZDM_SWITCHOVER_TGT ............ PENDING
ZDM_POST_DATABASE_OPEN_TGT .... PENDING
ZDM_DATAPATCH_TGT ............. PENDING
ZDM_MANIFEST_TO_CLOUD ......... PENDING
ZDM_POST_MIGRATE_TGT .......... PENDING
ZDM_POSTUSERACTIONS ........... PENDING
ZDM_POSTUSERACTIONS_TGT ....... PENDING
ZDM_CLEANUP_SRC ............... PENDING
ZDM_CLEANUP_TGT ............... PENDING</copy>
```

Monitor the migration log if required.

``` bash
<copy>[zdmuser@zdmhost ~]$ tail -f /home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-13.log</copy>
```

Verify the database roles while the job is paused.

``` text
<copy>[oracle@onphost ~]$ sqlplus / as sysdba
SQL> select database_role from v$database;
DATABASE_ROLE
----------------
PRIMARY

SQL> select database_role from v$database;
DATABASE_ROLE
----------------
PHYSICAL STANDBY</copy>
```

At this stage, source changes are synchronized to the target. Resume the
job when the application is ready for migration.



## Task 2: Complete the Migration

Resume the paused job and query the status until all phases are
complete.

``` text
<copy>[zdmuser@zdmhost ~]$ $ZDMHOME/bin/zdmcli resume job -jobid 13
[zdmuser@zdmhost ~]$ $ZDMHOME/bin/zdmcli query job -jobid 13
...
ZDM_GET_SRC_INFO .............. COMPLETED
ZDM_GET_TGT_INFO .............. COMPLETED
ZDM_PRECHECKS_SRC ............. COMPLETED
ZDM_PRECHECKS_TGT ............. COMPLETED
ZDM_SETUP_SRC ................. COMPLETED
ZDM_SETUP_TGT ................. COMPLETED
ZDM_PREUSERACTIONS ............ COMPLETED
ZDM_PREUSERACTIONS_TGT ........ COMPLETED
ZDM_VALIDATE_SRC .............. COMPLETED
ZDM_VALIDATE_TGT .............. COMPLETED
ZDM_DISCOVER_SRC .............. COMPLETED
ZDM_COPYFILES ................. COMPLETED
ZDM_PREPARE_TGT ............... COMPLETED
ZDM_SETUP_TDE_TGT ............. COMPLETED
ZDM_RESTORE_TGT ............... COMPLETED
ZDM_RECOVER_TGT ............... COMPLETED
ZDM_FINALIZE_TGT .............. COMPLETED
ZDM_CONFIGURE_DG_SRC .......... COMPLETED
ZDM_SWITCHOVER_SRC ............ COMPLETED
ZDM_SWITCHOVER_TGT ............ COMPLETED
ZDM_POST_DATABASE_OPEN_TGT .... COMPLETED
ZDM_DATAPATCH_TGT ............. COMPLETED
ZDM_MANIFEST_TO_CLOUD ......... COMPLETED
ZDM_POST_MIGRATE_TGT .......... COMPLETED
ZDM_POSTUSERACTIONS ........... COMPLETED
ZDM_POSTUSERACTIONS_TGT ....... COMPLETED
ZDM_CLEANUP_SRC ............... COMPLETED
ZDM_CLEANUP_TGT ............... COMPLETED</copy>
```

## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026