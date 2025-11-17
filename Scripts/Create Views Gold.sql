--- CREATE VIEW CALENDAR
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.calendar
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT='PARQUET'
) as Query1

--------------------------------------------------
--- CREATE VIEW CUSTOMERS
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.customers
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT='PARQUET'
) as Query1

------------------------------------------------------------------------------------------------------------
--- CREATE VIEW PRODUCT_CATEGORIES
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.product_categories
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Product_Categories/',
    FORMAT='PARQUET'
) as Query1

------------------------------------------------------------------------------------------------------------------------------
--- CREATE VIEW RETURNS
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.returns
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT='PARQUET'
) as Query1

----------------------------------------------------------------------------
--- CREATE VIEW SUBACATEGORIES
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.subcat
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
    FORMAT='PARQUET'
) as Query1

--- CREATE VIEW PRODUCTs
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW gold.product
as SELECT * from OPENROWSET(
    BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT='PARQUET'
) as Query1

--------------------------------------------------------------------------------------
--- CREATE VIEW SALES----------------
--------------------------------------------------------------------------------------
-- CREATE VIEW gold.sales
-- as SELECT *
-- FROM OPENROWSET(
--   BULK 'https://projectstorageaw.dfs.core.windows.net/silver/AdventureWorks_Sales_2017/',
--   FORMAT = 'PARQUET'
-- ) AS Query1;


DROP EXTERNAL TABLE gold.extsales;

CREATE EXTERNAL TABLE gold.extsales (
    OrderDate date,
    StockDate datetime,
    OrderNumber varchar(50),
    ProductKey int,
    CustomerKey int,
    TerritoryKey int,
    OrderLineItem int,
    OrderQuantity int,
    ProductSubcategoryKey int,
    multiply int,
)
WITH (
    LOCATION='extsales/',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
);

DROP EXTERNAL TABLE IF EXISTS gold.extsales;

CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION='extsales/',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT *
FROM gold.sales;


CREATE OR ALTER VIEW gold.sales AS
SELECT *
FROM silver.sales_2017;

SELECT TOP 5 * FROM gold.extsales;


DROP EXTERNAL TABLE gold.extsales;

CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION='extsales/',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT *
FROM gold.sales;


CREATE OR ALTER VIEW gold.sales AS
SELECT *,
       OrderLineItem * OrderQuantity AS multiply
FROM silver.sales_2017;

SELECT TOP 5 * FROM gold.extsales;

DROP EXTERNAL TABLE  gold.extsales;


CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION='extsales/',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT *
FROM gold.sales;


