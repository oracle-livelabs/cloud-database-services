# Oracle Zero Downtime Migration: Physical Online Migration to Exadata Database Service on Oracle AI Database@AWS

## Introduction
Organizations are increasingly adopting multicloud strategies to take advantage of the unique capabilities offered by different cloud providers. As part of this journey, many customers need to migrate their existing Oracle databases running in on-premises environments or on other hyperscalers to Oracle Database@AWS while minimizing downtime and reducing migration complexity.

**Oracle Zero Downtime Migration (ZDM)** is Oracle's recommended solution for performing online and offline migrations of Oracle databases to Oracle Cloud deployments, including Oracle Database@AWS. ZDM automates much of the migration workflow by orchestrating prerequisite validation, database backup and restore, Data Guard synchronization, and switchover operations, helping organizations perform predictable and repeatable migrations with minimal application downtime.

In this lab, you will use **Oracle Zero Downtime Migration (ZDM)** to
perform a physical online migration of an Oracle AI Database to **Oracle
Exadata Database Service on Exascale Infrastructure on Oracle
AI Database@AWS**.

<!-- ![architecture](./images/introduction.png " ")-->

The physical online workflow uses **Direct Data Transfer** with RMAN
**Restore from Service** to instantiate the target database. Oracle Data
Guard then synchronizes the source and target databases until you are
ready to perform the switchover. This approach avoids an intermediate
backup location and limits application downtime primarily to the final
switchover.

A standard Physical Online migration with Direct Data Transfer will take the following steps:

-   Download and Configure ZDM.
-   ZDM Starts Database Migration.
-   ZDM Starts a Restore from Service Operation.
-   ZDM Instantiates a Standby Database.
-   ZDM Synchronizes Primary and Standby.
-   ZDM Switches Over & Swap Roles.
-   ZDM Performs Post Migration Validations.
-   ZDM Finalizes the Migration.


By the end of this workshop, you will have gained hands-on experience with the complete Oracle Zero Downtime Migration workflow and understand the key steps involved in migrating Oracle databases to Oracle Database@AWS.


**Estimated Workshop Time:** 60 minutes.

### Objectives

In this lab, you will:

-   Prepare the source database host and source database.
-   Prepare the target ExaDB-D database hosts.
-   Prepare the ZDM service host.
-   Validate SQL\*Net connectivity.
-   Create the Physical Online Migration response file.
-   Evaluate the configuration.
-   Initiate the migration and pause before switchover.
-   Complete the migration and verify the target database role.

### Prerequisites

Before beginning, verify the source, target, ZDM service host,
networking, database, SSH, and TDE prerequisites described in the Oracle
technical guide.

Key requirements include:

-   The target placeholder database is provisioned without automatic
    backups.
-   Source and target use the same `DB_NAME` and different
    `DB_UNIQUE_NAME` values.
-   Source and target use an `SPFILE`, the same character set,
    compatible encryption configuration, the same `SYS` password, and
    the same `COMPATIBLE` value.
-   Source and target use the same major database release; the target
    can have a higher patch level.
-   The target time zone file version is the same as or higher than the
    source.
-   For Oracle AI Database 12c Release 2 and later, the source has an
    open TDE wallet.
-   The SSH key on the ZDM service host is in RSA format.

<!--
Additional Configuration

**SSH Key**

Check the key format:

``` bash
<copy>[zdmuser@zdmhost ~]$ head -n1 id_rsa</copy>
```

Create an SSH key in RSA format if one has not already been created:

``` bash
<copy>[zdmuser@zdmhost ~]$ ssh-keygen -m PEM -t rsa</copy>
```

Change an existing SSH key to RSA format if required:

``` bash
<copy>[zdmuser@zdmhost ~]$ ssh-keygen -p -m PEM -f id_rsa</copy>
```

**TDE Wallet**

If the source database is not TDE enabled, configure the auto-login
wallet before migration.

``` bash
<copy>mkir $ORACLE_BASE/admin/$ORACLE_SID/wallet
mkdir $ORACLE_BASE/admin/$ORACLE_SID/wallet/tde</copy>
```

``` sql
<copy>alter session set container=cdb$root;
alter system set wallet_root='$ORACLE_BASE/admin/$ORACLE_SID/wallet' scope=spfile;</copy>
```

``` sql
<copy>shutdown immediate;
startup;</copy>
```

``` sql
<copy>alter system set tde_configuration='KEYSTORE_CONFIGURATION=FILE' scope=both;
administer key management create keystore identified by <your_TDE_password>;
administer key management set keystore open identified by <your_TDE_password> container=ALL;
administer key management set key identified by <your_TDE_password> with backup container=ALL;
administer key management create auto_login keystore from keystore '$ORACLE_BASE/admin/$ORACLE_SID/wallet/tde' identified by <your_TDE_password>;
administer key management set keystore close identified by <your_TDE_password> container=ALL;</copy>
```

Verify the wallet:

``` sql
<copy>select * from v$encryption_wallet; --will open the auto-login wallet

set lines 300
set pages 100
col name for a20
col wrl_type for a10
col status for a15
col wallet_order for a15
col key_id for a60
col keystore_type for a20
col origin for a20
col encryptionalg for a15
col encryptedts for a15
col inst_id for 999
col value for a60</copy>
```

``` sql
<copy>select p.con_id, p.name, p.open_mode, ew.wrl_type, ew.wallet_type, ew.status, ew.wallet_order
from v$pdbs p join v$encryption_wallet ew on (ew.con_id = p.con_id)
order by p.con_id;</copy>
```

``` text
 CON_ID NAME OPEN_MODE WRL_TYPE WALLET_TYPE STATUS WALLET_ORDER
---------- -------------------- ---------- ---------- -------------------- --------------- ---------------
 2 PDB$SEED READ ONLY FILE AUTOLOGIN OPEN SINGLE
 4 OPDB4 READ WRITE FILE AUTOLOGIN OPEN SINGLE
```

``` sql
<copy>select con_id, key_id, keystore_type, origin from v$encryption_keys;</copy>
```

``` text
 CON_ID KEY_ID KEYSTORE_TYPE ORIGIN
---------- ------------------------------------------------------------ -------------------- --------------------
 4 AXLpMpzxoU/dvxXhn/okVMkAAAAAAAAAAAAAAAAAAAAAAAAAAAAA SOFTWARE KEYSTORE LOCAL
 1 ASYIe3UpY08bvxPooYkRBX0AAAAAAAAAAAAAAAAAAAAAAAAAAAAA SOFTWARE KEYSTORE LOCAL
```

------------------------------------------------------------------------

-->

You may now **proceed to the next lab**

## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026
