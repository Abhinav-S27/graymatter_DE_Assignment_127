# Databricks notebook source
# MAGIC %sql
# MAGIC create table clone_tab1 clone ext_store_trans2

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE TABLE employees (
# MAGIC   id INT,
# MAGIC   name STRING
# MAGIC )
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE TABLE sh_emp2  SHALLOW CLONE employees

# COMMAND ----------

# MAGIC %sql
# MAGIC
# MAGIC
# MAGIC

# COMMAND ----------


