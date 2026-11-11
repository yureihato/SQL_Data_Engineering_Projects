


-- STEP  1  dw create star schema tables 

.read 01_create_tables_dw.sql


-- STEP 2 dw load data from csv files into tables 

.read 02_load_schema_dw.sql

-- STEP 3 creating flat marts 

.read 03_create_flat_mart.sql 

-- STEP 4 skills mart 

.read 04_create_skills_mart.sql 

-- STEP 5 creating priority mart 

.read 05_create_priority_mart.sql

-- STEP 6 updating priority mart 

.read 06_update_priority_mart.sql

