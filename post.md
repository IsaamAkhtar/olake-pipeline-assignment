I built a small data pipeline using PostgreSQL, OLake, Apache Iceberg, and Spark to explore how data moves from a transactional database into an analytics-ready table.

One of the most interesting parts was testing Change Data Capture (CDC). After loading 15 orders, I inserted a new record into PostgreSQL, synced it with OLake, and verified that Spark could query all 16 records without reloading the entire dataset.

The project uses Docker, an Iceberg REST catalog, and MinIO for object storage.

I documented the full setup, including configuration files, SQL queries, screenshots, and some issues I ran into along the way.

If you're interested in trying OLake or learning how PostgreSQL and Iceberg work together, check out the tutorial:

https://github.com/IsaamAkhtar/olake-pipeline-assignment

#DataEngineering #ApacheIceberg #PostgreSQL #ApacheSpark #CDC
