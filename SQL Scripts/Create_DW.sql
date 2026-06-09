-- Create Data Warehouse database for Olist analytics
IF DB_ID('OlistDW') IS NULL
BEGIN
    CREATE DATABASE OlistDW;
END
GO

USE OlistDW;
GO

-- Optional schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dw')
    EXEC('CREATE SCHEMA dw');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'stg')
    EXEC('CREATE SCHEMA stg');
GO
