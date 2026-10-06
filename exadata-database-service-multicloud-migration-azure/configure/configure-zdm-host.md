# Prepare the ZDM Service Host On-Premises

## Introduction

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

* Prepare and Configure the ZDM host for the database migration

> ***IMPORTANT — Pre-configured Environment.*** The configuration steps included in the following tasks are provided for instructional purposes only and will be discussed during the session. ***You do not need to perform these steps unless instructed.***

## Task 1: Prepare the ZDM Service Host On-Premises

Add the source and target hostnames and IP addresses to `/etc/hosts`.

``` bash
[root@zdmhost ~]# vi /etc/hosts
#add the following entries
ta.db.oa.1 exadbazure1
ta.db.oa.2 exadbazure2
aa.bb.sr.db onphost
```

Test SSH connectivity to the source and target hosts.

``` bash
[zdmuser@zdmhost ~]$ ssh -i /home/zdmuser/.ssh/id_rsa onpuser@onphost
[zdmuser@zdmhost ~]$ ssh -i /home/zdmuser/.ssh/id_rsa opc@exadbazure1
[zdmuser@zdmhost ~]$ ssh -i /home/zdmuser/.ssh/id_rsa opc@exadbazure2
```

Verify that TTY is disabled for the SSH-privileged user.

``` bash
[zdmuser@zdmhost ~]$ ssh -oStrictHostKeyChecking=no -i /home/zdmuser/.ssh/id_rsa onpuser@onphost "/usr/bin/sudo /bin/sh -c date"
[zdmuser@zdmhost ~]$ ssh -oStrictHostKeyChecking=no -i /home/zdmuser/.ssh/id_rsa opc@exadbazure1 "/usr/bin/sudo /bin/sh -c date"
[zdmuser@zdmhost ~]$ ssh -oStrictHostKeyChecking=no -i /home/zdmuser/.ssh/id_rsa opc@exadbazure2 "/usr/bin/sudo /bin/sh -c date"
```

The commands should complete without prompting and return the date from
each remote host.

## Task 2: Set SQL\*Net connectivity between source and target database hosts

Check SQL\*Net connectivity from source to target and from target to
source.

``` bash
#from source host on-premises
[oracle@onphost ~]$ tnsping exadbazure1:1521
[oracle@onphost ~]$ tnsping exadbazure2:1521
#from target hosts on ExaDB-D on Oracle AI Database@Azure
[oracle@exadbazure1 ~]$ . oradb.env
[oracle@exadbazure1 ~]$ tnsping onphost:1521
[oracle@exadbazure2 ~]$ . oradb.env
[oracle@exadbazure2 ~]$ tnsping onphost:1521
```

## Task 3: Create the Physical Online Migration Response File on the ZDM host

The ZDM response-file template is located at `$ZDMHOME/rhp/zdm/template/zdm_template.rsp`. 

Create a new response file with the minimal parameters required.

``` text
vi /home/azureuser/physical_online.rsp
#add the following parameters and save the changes
MIGRATION_METHOD=ONLINE_PHYSICAL
DATA_TRANSFER_MEDIUM=DIRECT
ZDM_RMAN_DIRECT_METHOD=RESTORE_FROM_SERVICE
ZDM_SRC_DB_RESTORE_SERVICE_NAME=CDB1
TGT_DB_UNIQUE_NAME=CDB1_q29_ord
PLATFORM_TYPE=EXACS
```

## Task 4: Evaluate the Configuration

Run ZDM in evaluation mode. This validates the source and target
configuration without starting the migration.

``` bash
<copy>/home/azureuser/zdm/home/bin/zdmcli migrate database \
-rsp /home/azureuser/physical_online.rsp \
-sourcesid ORCLCDB \
-sourcenode onphost \
-srcauth zdmauth \
-srcarg1 user:azureuser \
-srcarg2 identity_file:/home/azureuser/.ssh/id_rsa \
-srcarg3 sudo_location:/usr/bin/sudo \
-targetnode exadbazure1 \
-tgtauth zdmauth \
-tgtarg1 user:opc \
-tgtarg2 identity_file:/home/azureuser/.ssh/id_rsa \
-tgtarg3 sudo_location:/usr/bin/sudo \
-targethome /u02/app/oracle/product/23.0.0.0/dbhome_1 \
-tdekeystorepasswd \
-ignore PATCH_CHECK \
-eval
</copy>
```

```
Enter source database oradb SYS password:
Enter source database oradb TDE keystore password:
zdmhost: Processing response file ...
Operation "zdmcli migrate database" scheduled with the job ID "12".
```


Check the job status.

``` text
<copy>/home/azureuser/zdm/home/bin/zdmcli query job -jobid <replace with job ID>
...
Job ID: 12
User: zdmuser
Client: zdmhost
Job Type: "EVAL"
...
Current status: SUCCEEDED
Result file path: "/home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-12.log"
Metrics file path: "/home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-12.json"
...
ZDM_GET_SRC_INFO ........... PRECHECK_PASSED
ZDM_GET_TGT_INFO ........... PRECHECK_PASSED
ZDM_PRECHECKS_SRC .......... PRECHECK_PASSED
ZDM_PRECHECKS_TGT .......... PRECHECK_PASSED
ZDM_SETUP_SRC .............. PRECHECK_PASSED
ZDM_SETUP_TGT .............. PRECHECK_PASSED
ZDM_PREUSERACTIONS ......... PRECHECK_PASSED
ZDM_PREUSERACTIONS_TGT ..... PRECHECK_PASSED
ZDM_VALIDATE_SRC ........... PRECHECK_PASSED
ZDM_VALIDATE_TGT ........... PRECHECK_PASSED
ZDM_POSTUSERACTIONS ........ PRECHECK_PASSED
ZDM_POSTUSERACTIONS_TGT .... PRECHECK_PASSED
ZDM_CLEANUP_SRC ............ PRECHECK_PASSED
ZDM_CLEANUP_TGT ............ PRECHECK_PASSED</copy>
```

Monitor the migration log if required.

``` bash
<copy>tail -f /home/zdmuser/zdm/zdmbase/chkbase/scheduled/job-12.log</copy>
```


## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026
