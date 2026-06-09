USE OlistDW;
GO

-- Date dimension
IF OBJECT_ID('dw.Dim_Date', 'U') IS NOT NULL DROP TABLE dw.Dim_Date;
CREATE TABLE dw.Dim_Date
(
    Date_Key        INT          NOT NULL PRIMARY KEY,
    Full_Date       DATE         NOT NULL,
    [Year]          SMALLINT     NOT NULL,
    [Quarter]       TINYINT      NOT NULL,
    [Month]         TINYINT      NOT NULL,
    [Day]           TINYINT      NOT NULL
);
GO

-- Product dimension
IF OBJECT_ID('dw.Dim_Product', 'U') IS NOT NULL DROP TABLE dw.Dim_Product;
CREATE TABLE dw.Dim_Product
(
    Product_Key         INT            IDENTITY(1,1) PRIMARY KEY,
    Product_Id          NVARCHAR(64)   NOT NULL,
    Category_Name       NVARCHAR(128)  NULL,
    Category_English    NVARCHAR(128)  NULL
);
GO

-- Customer dimension
IF OBJECT_ID('dw.Dim_Customer', 'U') IS NOT NULL DROP TABLE dw.Dim_Customer;
CREATE TABLE dw.Dim_Customer
(
    Customer_Key    INT            IDENTITY(1,1) PRIMARY KEY,
    Customer_Id     NVARCHAR(64)   NOT NULL,
    City            NVARCHAR(128)  NULL,
    [State]         NVARCHAR(16)   NULL
);
GO
