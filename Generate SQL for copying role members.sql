-- Generate SQL for copying role memberships
SELECT 'EXEC sp_addrolemember @rolename = ''' + roles.name + ''', @membername = ''' + users.name + ''''
FROM sys.database_role_members drm
JOIN sys.database_principals roles ON drm.role_principal_id = roles.principal_id
JOIN sys.database_principals users ON drm.member_principal_id = users.principal_id;
