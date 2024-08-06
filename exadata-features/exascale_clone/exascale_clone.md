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

    COLUMN source_pdb NEW_VALUE source_pdb
    COLUMN thick_pdb NEW_VALUE thick_pdb
    COLUMN thin_pdb NEW_VALUE thin_pdb
    SELECT LOWER(name) || '_pdba' source_pdb,
        LOWER(name) || '_full_clone' thick_pdb,
        LOWER(name) || '_thin_clone' thin_pdb
    FROM v$database;
    DROP PLUGGABLE DATABASE &thick_pdb INCLUDING DATAFILES;
    DROP PLUGGABLE DATABASE &thin_pdb INCLUDING DATAFILES;


1. Show the total space used by the data and temporary files of the source pluggable database.

    ```text
    <copy>
    COLUMN pdb NEW_VALUE pdbvar NOPRINT
    TTITLE LEFT 'PDB: ' pdbvar SKIP 2
    BREAK ON pdb SKIP PAGE
    COLUMN filename FORMAT A25
    COMPUTE SUM OF gb ON pdb
    SELECT p.name pdb, SUBSTR(v.name, INSTR(v.name, '/', -1)+1) filename, round(gb) gb
    FROM (SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$datafile 
        UNION SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$tempfile) v
    JOIN v$pdbs p ON (v.con_id = p.con_id)
    WHERE p.name LIKE (SELECT UPPER(name) FROM v$database) || '%'
    ORDER BY (CASE pdb
        WHEN (SELECT UPPER(name) FROM v$database) || '_PDBA' THEN 1
        WHEN (SELECT UPPER(name) FROM v$database) || '_FULL_CLONE' THEN 2
        WHEN (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE' THEN 3
        END), filename;
    TTITLE OFF

    </copy>
    ```

2. Create a full-size copy of the source pluggable database.

    ```text
    <copy>
    COLUMN space_used_gb NEW_VALUE hcsu_a NOPRINT
    SELECT ROUND(hc_space_used/1073741824) space_used_gb
    FROM v$exa_vault
    WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);

    COLUMN source_pdb NEW_VALUE source_pdb
    COLUMN thick_pdb NEW_VALUE thick_pdb
    SELECT LOWER(name) || '_pdba' source_pdb,
        LOWER(name) || '_full_clone' thick_pdb
    FROM v$database;
    CREATE PLUGGABLE DATABASE &thick_pdb FROM &source_pdb;

    </copy>
    ```

3. Show the total space used by the data and temporary files grouped by pluggable database.

    ```text
    <copy>
    COLUMN pdb NEW_VALUE pdbvar NOPRINT
    TTITLE LEFT 'PDB: ' pdbvar SKIP 2
    BREAK ON pdb SKIP PAGE
    COLUMN filename FORMAT A25
    COMPUTE SUM OF gb ON pdb
    SELECT p.name pdb, SUBSTR(v.name, INSTR(v.name, '/', -1)+1) filename, round(gb) gb
    FROM (SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$datafile 
        UNION SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$tempfile) v
    JOIN v$pdbs p ON (v.con_id = p.con_id)
    WHERE p.name LIKE (SELECT UPPER(name) FROM v$database) || '%'
    ORDER BY (CASE pdb
        WHEN (SELECT UPPER(name) FROM v$database) || '_PDBA' THEN 1
        WHEN (SELECT UPPER(name) FROM v$database) || '_FULL_CLONE' THEN 2
        WHEN (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE' THEN 3
        END), filename;
    TTITLE OFF

    </copy>
    ```

4. Show the increase in space used in the Exascale vault. The first value is the total increased raw space used. The second value is the increased space used after accounting for data redundancy. Since this vault is set up for normal redundancy, the second value shows half of the raw space used, which should closely match the space used by the full clone PDB created in the previous step. If the space used shows as 0, wait 10 seconds and run this query again.

    ```text
    <copy>
    COLUMN space_used_gb NEW_VALUE hcsu_b NOPRINT
    SELECT ROUND(hc_space_used/1073741824) space_used_gb
    FROM v$exa_vault
    WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);
    SELECT 'FULL CLONE' type, &hcsu_b - &hcsu_a space_used_raw,
        ROUND((&hcsu_b - &hcsu_a) / 2) space_used_actual FROM DUAL;

    </copy>
    ```

5. Create a thin clone of the same source pluggable database.

    ```text
    <copy>
    COLUMN source_pdb NEW_VALUE source_pdb
    COLUMN thin_pdb NEW_VALUE thin_pdb
    SELECT LOWER(name) || '_pdba' source_pdb,
        LOWER(name) || '_thin_clone' thin_pdb
    FROM v$database;
    CREATE PLUGGABLE DATABASE &thin_pdb FROM &source_pdb SNAPSHOT COPY;

    </copy>
    ```

6. Show the total space used by data and temporary files grouped by pluggable database. The first column shows the total space used and the second column shows 10% of the total space used, which should give us an idea of the actual space used by the snapshot files of a thin clone. Note that all three pluggable databases appear to be the exact same size.

    ```text
    <copy>
    COLUMN pdb NEW_VALUE pdbvar NOPRINT
    TTITLE LEFT 'PDB: ' pdbvar SKIP 2
    BREAK ON pdb SKIP PAGE
    COLUMN filename FORMAT A25
    COMPUTE SUM OF gb, gb_ten_percent ON pdb
    SELECT p.name pdb, SUBSTR(v.name, INSTR(v.name, '/', -1)+1) filename, round(gb) gb,
        CASE WHEN p.name = (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE'
            THEN round(gb * 0.1, 1)
            ELSE 0 END gb_ten_percent 
    FROM (SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$datafile 
        UNION SELECT name, bytes/1024/1024/1024 gb, con_id FROM v$tempfile) v
    JOIN v$pdbs p ON (v.con_id = p.con_id)
    WHERE p.name LIKE (SELECT UPPER(name) FROM v$database) || '%'
    ORDER BY (CASE pdb
        WHEN (SELECT UPPER(name) FROM v$database) || '_PDBA' THEN 1
        WHEN (SELECT UPPER(name) FROM v$database) || '_FULL_CLONE' THEN 2
        WHEN (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE' THEN 3
        END), filename;
    TTITLE OFF

    </copy>
    ```

7. Show the increase in space used in the Exascale vault. The space used by the thin clone should be significantly smaller than the full clone.
The small amount of space that is being used is from two sources:
 - When creating thin clones of pluggable databases, each cloned datafile will consume 10% of its original size.
 - When creating full or thin clones of pluggable databases, temporary tablespace files are never cloned. If the source pluggable database contains temporary tablespaces, these temp files will be newly created in the clone PDB and will consume space of the original size.

    ```text
    <copy>
    COLUMN space_used_gb NEW_VALUE hcsu_c NOPRINT
    SELECT ROUND(hc_space_used/1073741824) space_used_gb
    FROM v$exa_vault
    WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);
    SELECT 'FULL CLONE' type, &hcsu_b - &hcsu_a space_used_raw, (&hcsu_b - &hcsu_a) / 2 space_used_actual UNION 
    SELECT 'THIN CLONE' type, &hcsu_c - &hcsu_b space_used_raw, (&hcsu_c - &hcsu_b) / 2 space_used_actual FROM DUAL;

    </copy>
    ```




CREATE TEMPORARY TABLESPACE TEMP_PDB TEMPFILE '@stud_01vault' SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE TEMP_PDB;
DROP TABLESPACE TEMP INCLUDING CONTENTS AND DATAFILES;

COLUMN tempfile NEW_VALUE tempfile
select name tempfile from v$tempfile;
alter database tempfile '&tempfile' resize 10M;


    




select 'rm ' || full_path || chr(13)
from cdb_pdbs right join v$exa_file on (cdb_pdbs.con_id = v$exa_file.con_id)
left join v$datafile on (v$datafile.name = full_path)
where substr(used_by, instr(used_by, ':')+1) = (select db_unique_name from v$database)
and file_type = 'DATAFILE'
and v$datafile.name is null;


SELECT pdb_name, name
FROM v$datafile LEFT JOIN cdb_pdbs using (con_id)
where substr(used_by, instr(used_by, ':')+1) = (select db_unique_name from v$database)
and file_type = 'DATAFILE'
and v$datafile.name is null;



SELECT d.tablespace_name, d.file_name, c.name AS pdb_name, c.con_id
FROM cdb_temp_files d, v$containers c
WHERE d.con_id = c.con_id
ORDER BY 4,1;


    ```text
    <copy>
    SELECT v$tablespace.name, bytes/1073741824 space_used_gb
    FROM (SELECT file#, ts#, con_id, bytes FROM v$datafile)
    FULL JOIN (SELECT file#, ts#, con_id, bytes FROM v$tempfile) USING (ts#, con_id, bytes)
    JOIN v$tablespace USING (ts#, con_id)
    LEFT JOIN cdb_pdbs USING (con_id)
    WHERE pdb_name = 'PDBC'
    AND (v$tablespace.name like 'UNDO%' OR v$tablespace.name like 'TEMP%');

    SELECT SUM(bytes)
    FROM cdb_undo_extents WHERE 
    con_id = 4;
    
    </copy>
    ```


## Task 2: Flash Cache

1. List the cell disks associated with the flash modules in your Exadata cell. By default, there should be four cell disks having names that start with FD.

    ```text
    <copy>
    list celldisk where disktype = FlashDisk
    </copy>
    ```


You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, July 2023