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