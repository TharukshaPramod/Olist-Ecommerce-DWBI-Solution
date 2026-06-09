USE OlistDW;
GO

IF OBJECT_ID('dw.Fact_Sales', 'U') IS NOT NULL DROP TABLE dw.Fact_Sales;
CREATE TABLE dw.Fact_Sales
(
    Fact_Id              BIGINT        IDENTITY(1,1) PRIMARY KEY,
    Date_Key             INT           NOT NULL,
    Product_Key          INT           NOT NULL,
    Customer_Key         INT           NOT NULL,
    Quantity             INT           NOT NULL DEFAULT 1,
    Price                DECIMAL(18,2) NULL,
    Freight_Value        DECIMAL(18,2) NULL,
    Total_Amount         AS (ISNULL(Price,0) + ISNULL(Freight_Value,0)) PERSISTED,
    Days_To_Approve      INT           NULL,
    Days_To_Deliver      INT           NULL,
    CONSTRAINT FK_FactSales_Date FOREIGN KEY (Date_Key) REFERENCES dw.Dim_Date(Date_Key),
    CONSTRAINT FK_FactSales_Product FOREIGN KEY (Product_Key) REFERENCES dw.Dim_Product(Product_Key),
    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (Customer_Key) REFERENCES dw.Dim_Customer(Customer_Key)
);
GO

CREATE INDEX IX_FactSales_DateKey ON dw.Fact_Sales(Date_Key);
CREATE INDEX IX_FactSales_ProductKey ON dw.Fact_Sales(Product_Key);
CREATE INDEX IX_FactSales_CustomerKey ON dw.Fact_Sales(Customer_Key);
GO
