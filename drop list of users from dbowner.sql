-- Declare a table variable to store the list of users
DECLARE @Users TABLE (UserName NVARCHAR(255))

-- Insert the list of users into the table variable
INSERT INTO @Users (UserName)
VALUES
    ('User1'),
    ('User2'),
    --... Add more users as needed
    ('UserN');

-- Iterate through the list of users and remove each from the db_owner role
DECLARE @CurrentUserName NVARCHAR(255)

DECLARE user_cursor CURSOR FOR
SELECT UserName FROM @Users

OPEN user_cursor
FETCH NEXT FROM user_cursor INTO @CurrentUserName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Remove user from db_owner
    EXEC sp_droprolemember 'db_owner', @CurrentUserName

    FETCH NEXT FROM user_cursor INTO @CurrentUserName
END

CLOSE user_cursor
DEALLOCATE user_cursor
