
CREATE DATABASE SCOPED CREDENTIAL cred_kishore
WITH IDENTITY='Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
with (
    LOCATION = 'https://projectstorageaw.dfs.core.windows.net/silver',
    CREDENTIAL=cred_kishore
)


CREATE EXTERNAL DATA SOURCE source_gold
with (
    LOCATION = 'https://projectstorageaw.dfs.core.windows.net/gold',
    CREDENTIAL=cred_kishore
)

CREATE EXTERNAL file FORMAT format_parquet
WITH
(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
)
























-----------------------------------------------------------------------------
------------External Sales--------------------------------
-----------------------------------------------------------------------------

CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION='extsales',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet

)
as SELECT *  from gold.sales;

SELECT * from gold.extsales;




CREATE EXTERNAL TABLE gold.extcalendar
WITH (
    LOCATION = 'extcalendar/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calendar;



























CREATE EXTERNAL TABLE gold.extcustomers
WITH (
    LOCATION = 'extcustomers/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers;

CREATE EXTERNAL TABLE gold.extproduct_categories
WITH (
    LOCATION = 'extproduct_categories/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.product_categories;


CREATE EXTERNAL TABLE gold.extsubcat
WITH (
    LOCATION = 'extsubcat/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.subcat;


CREATE EXTERNAL TABLE gold.extproduct
WITH (
    LOCATION = 'extproduct/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.product;
