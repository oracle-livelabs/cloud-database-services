
COLUMN space_used_gb NEW_VALUE hcsu_b NOPRINT
SELECT ROUND(hc_space_used/1073741824) space_used_gb
FROM v$exa_vault
WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);
SELECT 'FULL CLONE' type, &hcsu_b - &hcsu_a space_used_raw,
    ROUND((&hcsu_b - &hcsu_a) / 2) space_used_actual FROM DUAL;