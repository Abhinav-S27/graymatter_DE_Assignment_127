# Databricks notebook source
from pyspark.sql.functions import *
from pyspark.sql.types import *

# COMMAND ----------

df=spark.read.csv("dbfs:/FileStore/s1.csv")

# COMMAND ----------

# MAGIC %md
# MAGIC

# COMMAND ----------

schema=StructType([StructField("id",IntegerType(),True),StructField("name",StringType(),True),StructField("age",IntegerType(),True)])

# COMMAND ----------

df=spark.read.option("header",True).option("mode","failfast").schema(schema).csv("dbfs:/FileStore/s1.csv")

# COMMAND ----------

df.printSchema()

# COMMAND ----------

df.display()

# COMMAND ----------

df=spark.read.option("header",True).option("mode","DROPMALFORMED").schema(schema).csv("dbfs:/FileStore/s1.csv")

# COMMAND ----------

df.display()

# COMMAND ----------

df=spark.read.option("header",True).option("mode","permissive").schema(schema).csv("dbfs:/FileStore/s1.csv")

# COMMAND ----------

df.display()

# COMMAND ----------

dbutils.fs.mount(source = "wasbs://destination@adlsgmde2911.blob.core.windows.net",mount_point ="/mnt/input",extra_configs = {"fs.azure.account.key.adlsgmde2911.blob.core.windows.net":dbutils.secrets.get(scope = "scope1", key = "scgmde2")})

# COMMAND ----------

dbutils.fs.ls("/mnt/input")

# COMMAND ----------

df_2=spark.read.csv("/mnt/input/sales.csv")

# COMMAND ----------

df_2=spark.read.option("header",True).option("inferSchema",True).csv("/mnt/input/sales.csv")

# COMMAND ----------

df_g1=df_2.groupBy("Product").agg(sum("Total").alias("Total_sales_of_product"))

# COMMAND ----------

df_g1.write.csv("/mnt/input/sales_by_product.csv")

# COMMAND ----------

df_2.write.format("delta").save("/mnt/input/ext_store_trans/")

# COMMAND ----------

# MAGIC %sql
# MAGIC create table ext_store_trans2
# MAGIC using delta
# MAGIC options (path"abfss://destination@adlsgmde2911.dfs.core.windows.net/ext_store_trans/")

# COMMAND ----------


df_g1.write.format("delta").saveAsTable("t1")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from t1

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into t1 values ('Widget E',500)

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into t1 values ('Widget E',400)

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2
# MAGIC

# COMMAND ----------



# COMMAND ----------

# MAGIC %environment
# MAGIC "client": "1"
# MAGIC "base_environment": ""
