# Databricks notebook source
jdbc_url="jdbc:sqlserver://servergmde001.database.windows.net:1433;database=sqldb1"
jdbc_properties={
    "user":"abhinavs_27",
    "password":"Abhinav@S27",
    "driver":"com.microsoft.sqlserver.jdbc.SQLServerDriver"
}

# COMMAND ----------

table_name='salesLT.customer'
df=spark.read.jdbc(url=jdbc_url,table=table_name,properties=jdbc_properties)

# COMMAND ----------

df.rdd.getNumPartitions()

# COMMAND ----------

spark.conf.get("spark.sql.files.maxPartitionBytes")

# COMMAND ----------

df.rdd.coalesce(1)

# COMMAND ----------



# COMMAND ----------

# MAGIC %environment
# MAGIC "client": "1"
# MAGIC "base_environment": ""
