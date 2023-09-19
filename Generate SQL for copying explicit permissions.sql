-- Generate SQL for copying explicit permissions
SELECT 
    'GRANT ' + permission_name + ' ON ' + 
    CASE class 
        WHEN 0 THEN 'DATABASE::[' + DB_NAME() + ']'
        WHEN 1 THEN 'OBJECT::[' + OBJECT_SCHEMA_NAME(major_id) + '].[' + OBJECT_NAME(major_id) + ']'
    END + ' TO [' + USER_NAME(grantee_principal_id) + ']'
FROM sys.database_permissions
WHERE grantee_principal_id > 4;  -- Exclude system entities
