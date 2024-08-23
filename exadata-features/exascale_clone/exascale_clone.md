# Exascale Database Clones Lab

## Introduction

In this practice, you are introduced to pluggable database clones and snapshots on Exadata Exascale storage.

Estimated Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Placeholder]()

### Objectives

In this lab, you will:
* Create a full and snapshot clone of a pluggable databases and see the efficiency of thin clones in Exascale storage

### Prerequisites

This lab assumes:
* Your current working directory includes all of the lab scripts
* You are connected to an Exadata container database **(CDB$ROOT)** with sqlplus as the user **C##SH as SYSDBA**
* This lab will not work if the pluggable databases **(database\_name)\_FULL\_CLONE** or **(database\_name)\_THIN\_CLONE** have already been created – if either PDB exists, run the `lab_exascale_clone_cleanup.sql` script and wait 30 seconds before starting the lab
* This lab requires your sqlplus session to stay connected through all of the steps – if your session is disconnected at any point, run the `lab_exascale_clone_cleanup.sql` script and wait 30 seconds before starting the lab

## Task 1: 

1. Connect to the database with `sqlplus /@cdb as SYSDBA`. Use the alias `sqlp_sys`. The rest of the lab will be executed in sqlplus.

    ```text
    <copy>
    sqlp_sys
    </copy>
    ```

2. Execute the SQL script `lab_exascale_clone_01.sql` to show the total space used by the data and temporary files of the source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_01.sql
    </copy>
    ```

3. Execute the SQL script `lab_exascale_clone_02.sql` to create a full-size copy of the source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_02.sql
    </copy>
    ```

4. Execute the SQL script `lab_exascale_clone_03.sql` to show the total space used by the data and temporary files grouped by pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_03.sql
    </copy>
    ```

5. Execute the SQL script `lab_exascale_clone_04.sql` to show the increase in space used in the Exascale vault. The first value is the total increased raw space used. The second value is the increased space used after accounting for data redundancy. Since this vault is set up for normal redundancy, the second value shows half of the raw space used, which should closely match the space used by the full clone PDB created in the previous step.

    ```text
    <copy>
    @lab_exascale_clone_04.sql
    </copy>
    ```

6. Execute the SQL script `lab_exascale_clone_05.sql` to create a thin clone of the same source pluggable database.

    ```text
    <copy>
    @lab_exascale_clone_05.sql
    </copy>
    ```

7. Execute the SQL script `lab_exascale_clone_06.sql` to show the total space used by data and temporary files grouped by pluggable database. The first column shows the total space used as it is represented in the database. The second column shows actual space used as it is represented on Exascale storage, which should give us an idea of the actual space used by the snapshot files of a thin clone.

    ```text
    <copy>
    @lab_exascale_clone_06.sql
    </copy>
    ```

8. Execute the SQL script `lab_exascale_clone_07.sql` to show the increase in space used in the Exascale vault. The space used by the thin clone should be significantly smaller than the full clone. The small amount of space that is being used is from two sources:
    * When creating thin clones of pluggable databases, each cloned datafile will consume 10% of its original size.
    * When creating full or thin clones of pluggable databases, temporary tablespace files are never cloned. If the source pluggable database contains temporary tablespaces, these temp files will be newly created in the clone PDB and will consume space equal to the original file size.

    ```text
    <copy>
    @lab_exascale_clone_07.sql
    </copy>
    ```

9. Exit the sqlplus session before starting the next lab.

    ```text
    <copy>
    exit
    </copy>
    ```


You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Natarajan Shankar, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, August 2024