-- Generate SQL for copying custom database roles
SELECT 'CREATE ROLE [' + name + ']'
FROM sys.database_principals
WHERE type = 'R' AND is_fixed_role = 0;
