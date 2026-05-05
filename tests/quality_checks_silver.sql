-- check for unwanted spaces

SELECT 
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

SELECT
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL;

SELECT * FROM silver.crm_cust_info;

-- check for NULLs or negative numbers
SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost = NULL;

SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

SELECT
prd_id,
prd_key,
prd_nm,
prd_start_dt,
LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) -1 AS prd_end_dt_test
FROM bronze.crm_prd_info
WHERE prd_key IN ('AC-HE-HL-U509-R','AC-HE-HL-U509')
