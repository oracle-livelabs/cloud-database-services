
COLUMN source_pdb NEW_VALUE source_pdb
COLUMN thin_pdb NEW_VALUE thin_pdb
SELECT LOWER(name) || '_pdba' source_pdb,
    LOWER(name) || '_thin_clone' thin_pdb
FROM v$database;
CREATE PLUGGABLE DATABASE &thin_pdb FROM &source_pdb SNAPSHOT COPY;