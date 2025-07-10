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
<img width="1000" height="800" alt="ELT Pipeline Architecture" src="https://github.com/user-attachments/assets/850643bf-c0fc-4e8f-a9da-1f4b14a0b78b" />

# ⚙️ Prerequisites
-✅ Snowflake account & credentials with correct roles
-✅ DBT installed on a virtual env and dbt initialized in a project folder
-✅ Astro CLI installed
-✅ Docker Desktop running


