-- Create the bronze schema in the data warehouse.

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'bronze'
)
BEGIN
    EXEC(N'CREATE SCHEMA [bronze]');
END;


-- Create the silver and gold schemas in the data warehouse.

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'silver'
)
BEGIN
    EXEC(N'CREATE SCHEMA [silver]');
END;


IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'gold'
)
BEGIN
    EXEC(N'CREATE SCHEMA [gold]');
END;

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'etl'
)
BEGIN
    EXEC(N'CREATE SCHEMA [etl];');
END;