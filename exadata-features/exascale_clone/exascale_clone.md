# Exascale Database Clones Lab

## Introduction

In this practice, you are introduced to pluggable database clones and snapshots on Exadata Exascale storage.

Estimated Time: 20 minutes

Watch the video below for a quick walk-through of the lab.
[Placeholder]()

### Objectives

In this lab, you will:
* Create a full and snapshot clone of a pluggable databases and see the efficiency of Exascale storage

### Prerequisites

This lab assumes:
* 

## Task 1: 

1. Show the total space used by the data and temporary files of the source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_01.sql

    </copy>
    ```

2. Create a full-size copy of the source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_02.sql

    </copy>
    ```

3. Show the total space used by the data and temporary files grouped by pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_03.sql

    </copy>
    ```

4. Show the increase in space used in the Exascale vault. The first value is the total increased raw space used. The second value is the increased space used after accounting for data redundancy. Since this vault is set up for normal redundancy, the second value shows half of the raw space used, which should closely match the space used by the full clone PDB created in the previous step. If the space used shows as 0, wait 10 seconds and run this query again.

    ```text
    <copy>
    @lab_exascale_clone_04.sql

    </copy>
    ```

5. Create a thin clone of the same source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_05.sql

    </copy>
    ```

6. Show the total space used by data and temporary files grouped by pluggable database. The first column shows the total space used as it is represented in the database. The second column shows actual space used as it is represented on Exascale storage, which should give us an idea of the actual space used by the snapshot files of a thin clone.

    ```text
    <copy>
    @lab_exascale_clone_06.sql

    </copy>
    ```

7. Show the increase in space used in the Exascale vault. The space used by the thin clone should be significantly smaller than the full clone.
The small amount of space that is being used is from two sources:
 - When creating thin clones of pluggable databases, each cloned datafile will consume 10% of its original size.
 - When creating full or thin clones of pluggable databases, temporary tablespace files are never cloned. If the source pluggable database contains temporary tablespaces, these temp files will be newly created in the clone PDB and will consume space of the original size.

    ```text
    <copy>
    @lab_exascale_clone_07.sql

    </copy>
    ```


CREATE TEMPORARY TABLESPACE TEMP_PDB TEMPFILE '@stud_01vault' SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE TEMP_PDB;
DROP TABLESPACE TEMP INCLUDING CONTENTS AND DATAFILES;

COLUMN tempfile NEW_VALUE tempfile
select name tempfile from v$tempfile;
alter database tempfile '&tempfile' resize 10M;


You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, July 2023