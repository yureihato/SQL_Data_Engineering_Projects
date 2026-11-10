
-- duckdb dw_marts.duckdb -c ".read build_dw_marts.sql" 



-- STEP  1  dw create star schema tables 

.read 01_create_tables_dw.sql


-- STEP 2 dw load data from csv files into tables 

.read 02_load_schema_dw.sql

-- STEP 3 creating flat marts 

.read 03_create_flat_mart.sql 

-- STEP 4 
