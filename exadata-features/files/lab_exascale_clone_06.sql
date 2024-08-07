SET VERIFY OFF
COLUMN pdb NEW_VALUE pdbvar NOPRINT
TTITLE LEFT 'PDB: ' pdbvar SKIP 2
BREAK ON pdb SKIP PAGE
COLUMN filename FORMAT A25
COMPUTE SUM OF gb gb_actual ON pdb
SELECT p.name pdb, SUBSTR(v.name, INSTR(v.name, '/', -1)+1) filename, ROUND(gb) gb,
    CASE WHEN p.name = (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE'
            AND v.filetype = 'DATAFILE'
            THEN ROUND(gb * 0.1, 1)
        WHEN p.name = (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE'
            AND v.filetype = 'TEMPFILE'
            THEN ROUND(gb, 1)
        ELSE ROUND(gb) END gb_actual
FROM (SELECT 'DATAFILE' filetype, name, bytes/1024/1024/1024 gb, con_id FROM v$datafile 
    UNION SELECT 'TEMPFILE' filetype, name, bytes/1024/1024/1024 gb, con_id FROM v$tempfile) v
JOIN v$pdbs p ON (v.con_id = p.con_id)
WHERE p.name LIKE (SELECT UPPER(name) FROM v$database) || '%'
ORDER BY (CASE pdb
    WHEN (SELECT UPPER(name) FROM v$database) || '_PDBA' THEN 1
    WHEN (SELECT UPPER(name) FROM v$database) || '_FULL_CLONE' THEN 2
    WHEN (SELECT UPPER(name) FROM v$database) || '_THIN_CLONE' THEN 3
    END), filename;
TTITLE OFF