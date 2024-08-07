
COLUMN space_used_gb NEW_VALUE hcsu_c NOPRINT
SELECT ROUND(hc_space_used/1073741824) space_used_gb
FROM v$exa_vault
WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);
SELECT 'FULL CLONE' type, &hcsu_b - &hcsu_a space_used_raw, ROUND((&hcsu_b - &hcsu_a) / 2) space_used_actual UNION 
SELECT 'THIN CLONE' type, &hcsu_c - &hcsu_b space_used_raw, ROUND((&hcsu_c - &hcsu_b) / 2, 1) space_used_actual FROM DUAL;