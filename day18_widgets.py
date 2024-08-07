# Databricks notebook source
from pyspark.sql.functions import *
from pyspark.sql.types import *

# COMMAND ----------

dbutils.widgets.text("store_name3","Widget A")


# COMMAND ----------

dbutils.widgets.dropdown("action", "Read", ["Read", "Write"])

# COMMAND ----------

store_val=dbutils.widgets.get("store_name")


# COMMAND ----------

dbutils.widgets.combobox("store_name2", "Widget A", ["Widget A", "Widget B", "Widget C"])

# COMMAND ----------

dbutils.widgets.multiselect("files","Widget A", ["Widget A", "Widget B", "Widget C"] )

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from t1

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2 where Product=

# COMMAND ----------

dbutils.widgets.get("store_name2")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2 where Product='${store_name2}'

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2 where Product='${store_name2}''

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from ext_store_trans2 where Product in ($files)

# COMMAND ----------

def mul(a):
    return a * 2


# COMMAND ----------

#register func for spark
mul1=udf(mul,IntegerType())

# COMMAND ----------

#register func for sql
spark.udf.register("mul",mul,IntegerType())

# COMMAND ----------

df=spark.read.csv("/mnt/input/sales.csv")

# COMMAND ----------

df=spark.read.option("header",True).option("inferSchema",True).csv("/mnt/input/sales.csv")

# COMMAND ----------

df.createOrReplaceTempView("sales")

# COMMAND ----------

#using fucntion in spark
df_convert=df.withColumn("Quantity2",mul1(col("Quantity")))

# COMMAND ----------

# MAGIC %sql
# MAGIC select mul(Quantity) as func_use from sales

# COMMAND ----------

df_convert.display()

# COMMAND ----------

# MAGIC %run /Workspace/Users/abhigray2002@outlook.com/gm_project/basic_utilities

# COMMAND ----------

# MAGIC %sql
# MAGIC select upp(Product) as fun1, add(Quantity) as fun2,mul3(Price) as fun3 from sales

# COMMAND ----------

dbutils.notebook.run("/Workspace/Users/abhigray2002@outlook.com/gm_project/basic_utilities",300)

# COMMAND ----------



# COMMAND ----------

# MAGIC %environment
# MAGIC "client": "1"
# MAGIC "base_environment": ""
