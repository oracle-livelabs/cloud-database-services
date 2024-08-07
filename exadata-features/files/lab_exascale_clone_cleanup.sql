SET VERIFY OFF
COLUMN source_pdb NEW_VALUE source_pdb
COLUMN thick_pdb NEW_VALUE thick_pdb
COLUMN thin_pdb NEW_VALUE thin_pdb
SELECT LOWER(name) || '_pdba' source_pdb,
    LOWER(name) || '_full_clone' thick_pdb,
    LOWER(name) || '_thin_clone' thin_pdb
FROM v$database;
DROP PLUGGABLE DATABASE &thick_pdb INCLUDING DATAFILES;
DROP PLUGGABLE DATABASE &thin_pdb INCLUDING DATAFILES;