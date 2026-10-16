# PostgreSQL to Apache Iceberg with OLake and Spark

A local data engineering pipeline demonstrating how to sync PostgreSQL data into Apache Iceberg using OLake, manage the Iceberg REST catalog with Apache Polaris, and query the resulting table with Apache Spark.

## Architecture

PostgreSQL → OLake → Apache Iceberg  
　　　　　　　　　　　　↑  
　　　　　 Apache Polaris REST Catalog  
　　　　　　　　　　　　↓  
　　　　　　　 Apache Spark SQL

## Technologies

- PostgreSQL: source database containing sample order records
- OLake: discovers the source schema and syncs data, including changes captured through CDC
- Apache Iceberg: table format for analytical data
- Apache Polaris: REST catalog and catalog access management
- MinIO: local S3-compatible object storage for Iceberg data files
- Apache Spark: SQL engine used to query and verify the synced data

## Demonstration

The initial sync transfers 15 sample orders into Iceberg. A subsequent insert adds a 16th order in PostgreSQL; OLake syncs the new record, and Spark verifies that Iceberg now contains 16 orders.

## Repository contents

- `docker-compose.yml`: local MinIO and Polaris services
- `.env.example`: template for local environment variables
- `postgres/init.sql`: sample `orders` table and initial records
- `olake/config/streams.json`: discovered stream and selected columns
- `README.md`: setup guide and verification steps

Credentials, local state, and machine-specific configuration files are excluded from version control.

## 1. Start PostgreSQL

Create the shared Docker network (if it does not already exist): `docker network create olake-network`.
Start PostgreSQL with `docker run -d --name olake-postgres --network olake-network -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=choose-a-local-password -e POSTGRES_DB=olake_demo postgres:16`.
Initialize the sample table and insert the 15 original orders: `docker exec -i olake-postgres psql -U postgres -d olake_demo < postgres/init.sql`.
Verify the initial row count: `docker exec olake-postgres psql -U postgres -d olake_demo -c "SELECT COUNT(*) FROM orders;"`. The expected result is 15 rows.
Note: Run the initialization script only once on a fresh database. Running it again inserts duplicate sample orders.

The sample data represents fictional customer orders and is intended for demonstration only.
