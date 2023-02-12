1. Iniciamos creado el cliente[👉](https://github.com/acastillom24/cursos/blob/main/Intro-to-SQL/01_Getting-Started-With-SQL-and-BigQuerGetting-Started-With-SQL-and-BigQuery.md)

```python
from google.cloud import bigquery
client = bigquery.Client()
```

2. Para obtener la tabla a cosultar usamos las comillas invertidas: (``)

```python
SELECT <NOMBRE_CAMPOS>
  FROM `bigquery-public-data.pet_records.pets`
    WHERE <NOMBRE_CAMPO> = 'Cat'
```

> Nota: Recuerda que para trabajar con todos los campos de una tabla se utiliza **(*)**

```python
SELECT *
  FROM `bigquery-public-data.pet_records.pets`
    WHERE <NOMBRE_CAMPO> = 'Cat'
```

3. Consulta con el dataset *openaq*
```python
query = """
        SELECT city
        FROM `bigquery-public-data.openaq.global_air_quality`
        WHERE country = 'US'
        """
query_job = client.query(query)
```

4. Corremos la *consulta* y convertimos el resultado a un objeto *DataFrame*
```python
us_cities = query_job.to_dataframe()
```

5. Podemos trabajar con el *DataFrame* creado, como cualquier otro *DataFrame* de *python*
```python
us_cities.city.value_counts().head()
```

6. Extra: Podemos estimar el tamaño de una consulta antes de ejecutarla, mediante el objeto *QueryJobConfig* y el parámetro *dry_run = TRUE*
```python
query = """
        SELECT score, title
        FROM `bigquery-public-data.hacker_news.full`
        WHERE type = "job" 
        """
        
dry_run_config = bigquery.QueryJobConfig(dry_run=True)
dry_run_query_job = client.query(query, job_config=dry_run_config)
print("This query will process {} bytes.".format(dry_run_query_job.total_bytes_processed))
```

> Nota: Podemos especificar la cantidad de datos que estamos dispuestos a escanear
```python
ONE_MB = 1000*1000
safe_config = bigquery.QueryJobConfig(maximum_bytes_billed=ONE_MB)
safe_query_job = client.query(query, job_config=safe_config)
job_post_scores = safe_query_job.to_dataframe()
job_post_scores.score.mean()
```
