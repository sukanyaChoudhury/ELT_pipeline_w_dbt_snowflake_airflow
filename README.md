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

## 🧭 Architecture Diagram
<img width="500" height="400" alt="ELT Pipeline Architecture" src="https://github.com/user-attachments/assets/850643bf-c0fc-4e8f-a9da-1f4b14a0b78b" />

## ⚙️ Pre-requisites
-  Snowflake account & credentials with correct roles
-  DBT installed on a virtual env and dbt initialized in a project folder
-  Astro CLI installed
-  Docker Desktop running

-----------------
## Implementation:
**Step 1: Setup snowflake environment**
Setup the snowflake environment as per the instructions text doc.
## Step 2: Create and activate virtual env venv and then use it to install dbt
Follow instructions in the instructions text document to create and activate a virtual env. Then install dbt
## Step 3: Initialize a dbt project
follow instructions to create and initialize a dbt project. In our example, we are using dbt_first project.
## Step 4: configure dbt_project.yml
After initializing the dbt project, we get a folder structure including a project.yml file.
Here, we need to define how the staging and marts models need to be materialized. In our example, we are getting the raw data into staging model as view.
Marts are materrialized as table. Details are in the dbt_project.yml file
## Step 5: configure packages.yml
We need to use macros later in the project for which we need dbt_utils package so configure packages.yml file to be able to use it.
run dbt deps command to run packages.
## 
