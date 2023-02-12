# AS

# WITH ... AS

Por sí solo, AS es una forma conveniente de limpiar los datos devueltos por su consulta. Es incluso más poderoso cuando se combina con WITH en lo que se llama una "expresión de tabla común".

Una expresión de tabla común (o CTE) es una tabla temporal que devuelve dentro de su consulta. Los CTE son útiles para dividir sus consultas en fragmentos legibles y puede escribir consultas sobre ellos.

```python
# Query to select the number of transactions per date, sorted by date
query_with_CTE = """ 
                 WITH time AS 
                 (
                     SELECT DATE(block_timestamp) AS trans_date
                     FROM `bigquery-public-data.crypto_bitcoin.transactions`
                 )
                 SELECT COUNT(1) AS transactions,
                        trans_date
                 FROM time
                 GROUP BY trans_date
                 ORDER BY trans_date
                 """

# Set up the query (cancel the query if it would use too much of 
# your quota, with the limit set to 10 GB)
safe_config = bigquery.QueryJobConfig(maximum_bytes_billed=10**10)
query_job = client.query(query_with_CTE, job_config=safe_config)

# API request - run the query, and convert the results to a pandas DataFrame
transactions_by_date = query_job.to_dataframe()

# Print the first five rows
transactions_by_date.head()

transactions_by_date.set_index('trans_date').plot()

```
![](https://www.kaggleusercontent.com/kf/79126389/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..VrK7vbI1TUqEKqVM7XdjbA.D2YpMafyLBZ5TrnRLr9tcoXqDnpuEWD7dzeoViE4Ld2wR24u-sXB4odkqz2n1illOveNJVESZqESt0_XV1niG2JZ3CoOZagcH6HCknbDVIQ39MMpn5LCb7jxYA6zpuSOGcjJ6Ztcgxl4tWIQRGSfhBg1M-0YzMXXV_wAUXioA6HtdHv1INVAFcnIojAIM86q6vwuT7Dz4klGxkuJ5R6zuaEb-x6IULhFor9y6YaePeL5Nb33dpgf6Rpm1oT5TZXoc_B8cqFLmMcJmFWUkM9IM_ehbtSAIxPGVEJKeBUzdVxHwc9sy_CfR28NdOYKITnEbscBBnKJlQrrUboqOpf_FmzgB0PCUIIs1xmX-fL77rKM89Ia8RFiCQEo_czAtyyzkt_jlpzDXuch1FonhwJcxoAiljGmpS7M0NYYDTueM4xztBJXJzrXSE3e1Vlmsd7fMnLc_-z4VRN_jrr2rF_4SENyHFyhxEQ226-iDbs5_06bz5apeWlj3_nSPi5ZSAOEwBYNHkzFQ7_iRv528DfO5qvK2QqydiziO29Slud1Zw95DUTfBj1OWRPO6hWhYO6SuLN3h6UV4EDHWRflgBwd12cewHCyVED28JaAp-gu1kqabWRkQfkfsfrMe8qilwoehz_oPTptd-xkp-UAjAnDug.GjpHRTvy4_3E-ukgkCG1Hg/__results___files/__results___6_1.png)

# Exercises

## 1. Encuentra los datos
Antes de poder acceder a los datos, debe encontrar el nombre de la tabla con los datos.

*Sugerencia:* la finalización de tabulación es útil cuando no puede recordar un comando. Escriba cliente. y luego presione la tecla de tabulación. No olvide el período antes de presionar la pestaña.

```python
tables = list(client.list_tables(dataset))
for table in tables:  
    print(table.table_id)
```

## 2. Eche un vistazo a los datos
Utilice la siguiente celda de código para echar un vistazo a las primeras filas de los datos. Inspeccione los datos y vea si algún problema con la calidad de los datos es inmediatamente obvio.

```python
# Construct a reference to the "taxi_trips" table
table_ref = dataset_ref.table("taxi_trips")

# API request - fetch the table
table = client.get_table(table_ref)

# Preview the first five lines of the "taxi_trips" table
client.list_rows(table, max_results=5).to_dataframe()
```

## 3. Determine de cuándo son estos datos
Si los datos son lo suficientemente antiguos, deberíamos tener cuidado antes de asumir que los datos siguen siendo relevantes para los patrones de tráfico en la actualidad. Escribe una consulta que cuente el número de viajes de cada año.

Tus resultados deben tener dos columnas:

- year: el año de los viajes
- num_trips: la cantidad de viajes en ese año

*Sugerencias:*

- Cuando use GROUP BY y ORDER BY, debe hacer referencia a las columnas por el año de alias que estableció en la parte superior de la consulta SELECT.
- El código SQL para SELECCIONAR el año de trip_start_timestamp es SELECT EXTRACT (YEAR FROM trip_start_timestamp)
- El campo FROM puede ser un poco complicado hasta que se acostumbre a él. El formato es:
> 1. Una patada en la espalda (el símbolo '\`').
> 2. El nombre del proyecto. En este caso es bigquery-public-data.
> 3. Un período.
> 4. El nombre del conjunto de datos. En este caso, es chicago_taxi_trips.
> 5. Un período.
> 6. El nombre de la tabla. Usaste esto como tu respuesta en 1) Encuentra los datos.
> 7. Una comilla invertida (el símbolo '\`').

