# Airflow + DBT + Snowflake ELT Pipeline

This project demonstrates a complete modular ELT (Extract, Load, Transform) data pipeline using Apache Airflow, dbt, and Snowflake. The pipeline automates raw data staging, transformation, and testing using dbt models orchestrated by Airflow DAGs.
- **Airflow** for scheduling and DAG orchestration
- **DBT** for modular SQL-based transformations and testing
- **Snowflake** as the cloud data warehouse
---
## Tech Stack

- Apache Airflow (Astro CLI)
- DBT (Data Build Tool)
- Snowflake Cloud Data Platform
- Cosmos (DBT-Airflow integration)
- Python
- SQL 
- Docker (via Astro CLI)

---

##  Architecture Diagram
<img width="500" height="400" alt="ELT Pipeline Architecture" src="https://github.com/user-attachments/assets/850643bf-c0fc-4e8f-a9da-1f4b14a0b78b" />

## Pre-requisites
-  Snowflake account & credentials with correct roles
-  DBT installed on a virtual env and dbt initialized in a project folder
-  Astro CLI installed
-  Docker Desktop running

-----------------
## Implementation:
### Step 1: Setup snowflake environment
Setup the snowflake environment as per the instructions text doc.
### Step 2: Create and activate virtual env venv and then use it to install dbt
Follow instructions in the instructions text document to create and activate a virtual env. Then install dbt
### Step 3: Initialize a dbt project
follow instructions to create and initialize a dbt project. In our example, we are using dbt_first project.
### Step 4: configure dbt_project.yml
After initializing the dbt project, we get a folder structure including a project.yml file.
Here, we need to define how the staging and marts models need to be materialized. In our example, we are getting the raw data into staging model as view.
Marts are materrialized as table. Details are in the dbt_project.yml file
### Step 5: configure packages.yml
We need to generate surrogate key later in the project for which we need dbt_utils package so configure packages.yml file to be able to use it.
run dbt deps command to run packages.
### Step 6: Create source and staging files under staging layer
- Create models/staging/tpch_sources.yml - mentioning the raw data source tables, their constraints as well as relationships between two tables.
For our example, we are using the orders and line_item tables from the snowflake_sample_data database.
- Create staging models 
models/staging/stg_tpch_orders.sql - fetch required columns from the orders table of snowflake_sample_data database using source file above.
models/staging/tpch/stg_tpch_line_items.sql - fetch required columns from the line_items table and also create a surrogate key using db_utils package.
### Step 7: Macros (Don’t repeat yourself or D.R.Y.)
Create macros/pricing.sql - create a macro , discounted_amount which takes extended_price and discount_percentage as arguments to calculate discounted_amount value.
### Step 8 : Transform models (fact tables, data marts)
After getting the raw data into staging layer, its time to build fact and intermediate/dimension tables for data manipulation
- Create Intermediate table models/marts/int_order_items.sql
  this is a table created after joining the line_items and orders table
- Create marts/int_order_items_summary.sql to aggregate info
- Create fact model models/marts/fct_orders.sql - by joining summary table and orders, we get a fact table of all numerical values.
All these components can be run using dbt run command or select command which runs a specified file e.g:- dbt run -s stg_tpch_line_items 
### Step 9: Generic tests
- Create models/marts/generic_tests.yml - Check fct table for uniques, not null constraints, model relationship and accepted values.
### Step 10: Singular Tests 
- Create tests/fct_orders_date_valid.sql - Check order_date so that date is not after current date or before 1990-01-01
- Create tests/fct_orders_discount.sql - Check dicount amount should not be negative.
### Step 11: Delpoy to Airflow
- Install astro cli and initialize it inside dbt-dag folder. It creates an astro project folder.
- Update docker file and requirements.txt inside dbt-dag to get cosmos.
- Copy the dbt project folder dbt/dbt_first into the dbt-dag/dags folder.
- Start docker engine and then run astro dev start which creates the required images and runs the airflow webserver container as well.
- Once the webserver is up, login to airflow and then add the snowflake connection details
- For deploying our dbt project, we need to create a dbt_dag.py file containing the snowflake connection(created above), project config, scheduling details etc.
- After this, we can see our dbt_dag deployed inside airflow webserver.
### Step 12: Run the dbt_dag pipeline
Manually run the pipeline and check logs . It should be able to run successfully and fetch the raw snowflake sammple data and create our various staging views and fact tables etc.
<img width="940" height="386" alt="image" src="https://github.com/user-attachments/assets/ec321063-ef8c-49bf-83dc-0ebb90556f08" />




