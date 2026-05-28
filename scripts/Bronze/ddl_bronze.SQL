/*
=======================================================================================================
DDL Script: Create Bronze Table
=======================================================================================================
Script Purpose:
This script create tables in the bronze schema droping existing tables if the already exist.
Run this script to re-define the DDL structure of bronze tables.
=======================================================================================================
*/

DROP TABLE IF EXISTS Bronze.crm_cust_info;

CREATE TABLE Bronze.crm_cust_info(
cst_is INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date  NVARCHAR(50)
);

CREATE TABLE bronze.crm_prd_info (
    prd_id         INT,
    prd_key        NVARCHAR(50),
    prd_nm         NVARCHAR(50),
    prd_cost       INT,
    prd_line       NVARCHAR(50),
    prd_start_dt   DATETIME,
    prd_end_dt     DATETIME
);

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num    NVARCHAR(50),
    sls_prd_key    NVARCHAR(50),
    sls_cust_id    INT,
    sls_order_dt   INT,
    sls_ship_dt    INT,
    sls_due_dt     INT,
    sls_sales      INT,
    sls_quantity   INT,
    sls_price      INT
);


CREATE TABLE bronze.erp_loc_a101 (
    cid   NVARCHAR(50),
    cntry NVARCHAR(50)
);

CREATE TABLE bronze.erp_cust_az12 (
    cid   NVARCHAR(50),
    bdate DATE,
    gen   NVARCHAR(50)
);

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

TRUNCATE TABLE Bronze.crm_cust_info

BULK INSERT Bronze.crm_cust_info
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);

TRUNCATE TABLE bronze.crm_prd_info

BULK INSERT bronze.crm_prd_info
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);

TRUNCATE TABLE bronze.crm_sales_details

BULK INSERT bronze.crm_sales_details
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);

TRUNCATE TABLE bronze.erp_loc_a101

BULK INSERT bronze.erp_loc_a101
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);

TRUNCATE TABLE bronze.erp_cust_az12

BULK INSERT bronze.erp_cust_az12
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);

TRUNCATE TABLE bronze.erp_px_cat_g1v2

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n',
   TABLOCK
);
END
