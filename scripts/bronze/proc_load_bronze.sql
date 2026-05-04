/*

==============================================
Stored Procedure: Load bronze layer
==============================================
Script Purpose:
  this stored procedure loads data into the bronze schema from external CSV files.
  Following actions:
  - Truncates the bronze table before loading data
  - Uses LOAD DATA command to load data into the tables
=============================================
*/

SELECT '=======================================================' AS status_message;
	SELECT 'Loading Bronze Layer: crm_cust_info' AS status_message;
	SELECT '=======================================================' AS status_message;

	SELECT '-------------------------------------------------------' AS status_message;
	SELECT 'Loading CRM Tables' AS status_message;
	SELECT '-------------------------------------------------------' AS status_message;
	
    SET @start_time = GETDATE();
	SELECT 'Truncating Table bronze.crm_cust_info' AS status_message;
		TRUNCATE TABLE bronze.crm_cust_info;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
		INTO TABLE bronze.crm_cust_info
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row

		-- 
	SELECT 'Truncating Table bronze.crm_prd_info' AS status_message;
		TRUNCATE TABLE bronze.crm_prd_info;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
		INTO TABLE bronze.crm_prd_info
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row

		--
	SELECT 'Truncating Table bronze.crm_sales_details' AS status_message;
		TRUNCATE TABLE bronze.crm_sales_details;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
		INTO TABLE bronze.crm_sales_details
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row

		--
		
	SELECT '-------------------------------------------------------' AS status_message;
	SELECT 'Loading ERP Tables' AS status_message;
	SELECT '-------------------------------------------------------' AS status_message;

	SELECT 'Truncating Table bronze.erp_cust_az12' AS status_message;
		TRUNCATE TABLE bronze.erp_cust_az12;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
		INTO TABLE bronze.erp_cust_az12
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row

		--

	SELECT 'Truncating Table bronze.erp_loc_a101' AS status_message;
		TRUNCATE TABLE bronze.erp_loc_a101;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
		INTO TABLE bronze.erp_loc_a101
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row

		--

	SELECT 'Truncating Table bronze.erp_px_cat_g1v2' AS status_message;
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		LOAD DATA LOCAL INFILE '/Users/bendiksherpell/Developer/Data-wharehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
		INTO TABLE bronze.erp_px_cat_g1v2
		FIELDS TERMINATED BY ',' 
		IGNORE 1 ROWS; -- skip header row
