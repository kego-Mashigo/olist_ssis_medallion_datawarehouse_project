USE MASTER

-- Create the staging database if it does not exist.
IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = N'olist_dwh'
)
BEGIN
    CREATE DATABASE [olist_dwh];
END;
GO