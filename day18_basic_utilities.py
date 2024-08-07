# Databricks notebook source
from pyspark.sql.functions import *
from pyspark.sql.types import *

# COMMAND ----------

def upp(a):
    return a.upper()


# COMMAND ----------

def mul(a):
    return a * 2

# COMMAND ----------

def add(a):
    return a + 10

# COMMAND ----------

f1=udf(upp,StringType())
spark.udf.register("upp",upp,StringType())

# COMMAND ----------

f2=udf(add,IntegerType())
spark.udf.register("add",add,IntegerType())

# COMMAND ----------

f3=udf(mul,IntegerType())
spark.udf.register("mul3",mul,DoubleType())

# COMMAND ----------



# COMMAND ----------

# MAGIC %environment
# MAGIC "client": "1"
# MAGIC "base_environment": ""
