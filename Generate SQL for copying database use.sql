-- Generate SQL for copying database users
SELECT 'CREATE USER [' + name + '] FOR LOGIN [' + name + ']' 
FROM sys.database_principals 
WHERE type IN ('G','S','U') AND name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys');
