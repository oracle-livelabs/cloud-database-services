SET FEEDBACK OFF
SET VERIFY OFF
COLUMN space_used_gb NEW_VALUE hcsu_b NOPRINT
SELECT ROUND(hc_space_used/1073741824) space_used_gb
FROM v$exa_vault
WHERE LOWER(vault_name) = (SELECT LOWER(name) || 'vault' FROM v$database);

SET SERVEROUTPUT ON
BEGIN
    IF &hcsu_a = &hcsu_b THEN
        DBMS_OUTPUT.PUT_LINE('The Exascale vault has not updated yet. Please wait 10 seconds and run this script again.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(RPAD('TYPE', 12) || RPAD('SPACE_USED_RAW', 16) || RPAD('SPACE_USED_ACTUAL', 19));
        DBMS_OUTPUT.PUT_LINE(RPAD('-', 10, '-') || '  ' || RPAD('-', 14, '-') || '  ' || RPAD('-', 17, '-'));
        DBMS_OUTPUT.PUT_LINE(LPAD('FULL CLONE', 12) || LPAD(&hcsu_b - &hcsu_a, 16) || LPAD(ROUND((&hcsu_b - &hcsu_a) / 2), 19));
    END IF;
END;
/