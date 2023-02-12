1. Dates: El formato FECHA tiene primero el año, luego el mes y luego el día.

> YYYY-[M]M-[D]D
- YYYY: Four-digit year
- [M]M: One or two digit month
- [D]D: One or two digit day

2. EXTRACT
```python
query = """
  SELECT Name, EXTRACT(DAY from Date) as Day
  FROM `bigquery-public-data.pet_records.pets_with_date`
"""

query = """
  SELECT Name, EXTRACT(WEEK from Date) as Day
  FROM `bigquery-public-data.pet_records.pets_with_date`
"""

query = """
        SELECT COUNT(consecutive_number) AS num_accidents, 
               EXTRACT(DAYOFWEEK FROM timestamp_of_crash) AS day_of_week
        FROM `bigquery-public-data.nhtsa_traffic_fatalities.accident_2015`
        GROUP BY day_of_week
        ORDER BY num_accidents DESC
        """
```

> Nota: *DAYOFWEEK* devuelve "un número entero entre 1 (domingo) y 7 (sábado)"

# Exercises

## 1. Gasto público en educación

¿Qué países gastan la mayor fracción del PIB en educación?

Para responder a esta pregunta, considere solo las filas en el conjunto de datos correspondientes al código de indicador SE.XPD.TOTL.GD.ZS, y escriba una consulta que devuelva el valor promedio en la columna de valor para cada país en el conjunto de datos entre los años 2010- 2017 (incluyendo 2010 y 2017 en promedio).

*Requerimientos:*

- Sus resultados deben tener el nombre del país en lugar del código del país. Tendrá una fila para cada país.
- La función agregada para el promedio es AVG (). Utilice el nombre avg_ed_spending_pct para la columna creada por esta agregación.
- Ordene los resultados para que aparezcan primero los países que gastan la mayor fracción del PIB en educación.

```python
# Your code goes here
country_spend_pct_query = """
                          SELECT country_name, AVG(value) AS avg_ed_spending_pct
                          FROM `bigquery-public-data.world_bank_intl_education.international_education`
                          WHERE indicator_code = 'SE.XPD.TOTL.GD.ZS' AND year BETWEEN 2010 AND 2017
                          GROUP BY country_name
                          ORDER BY avg_ed_spending_pct DESC
                          """

# Set up the query (cancel the query if it would use too much of 
# your quota, with the limit set to 1 GB)
safe_config = bigquery.QueryJobConfig(maximum_bytes_billed=10**10)
country_spend_pct_query_job = client.query(country_spend_pct_query, job_config=safe_config)

# API request - run the query, and return a pandas DataFrame
country_spending_results = country_spend_pct_query_job.to_dataframe()

# View top few rows of results
print(country_spending_results.head())

```

## 1. Identificar códigos interesantes para explorar

La última pregunta comenzó diciéndole que se concentrara en las filas con el código SE.XPD.TOTL.GD.ZS. Pero, ¿cómo encontrarías códigos de indicadores más interesantes para explorar?

Hay miles de códigos en el conjunto de datos, por lo que llevaría mucho tiempo revisarlos todos. Pero muchos códigos están disponibles solo para unos pocos países. Al examinar las opciones de códigos diferentes, es posible que se limite a los códigos que informan muchos países.

Escriba una consulta a continuación que seleccione el código del indicador y el nombre del indicador para todos los códigos con al menos 175 filas en el año 2016.

*Requerimientos:*

- Debe tener una fila para cada código de indicador.
- Las columnas en sus resultados deben llamarse código_indicador, nombre_indicador y núm_filas.
- Solo seleccione códigos con 175 o más filas en la base de datos sin procesar (se incluirían exactamente 175 filas).
- Para obtener tanto el código_indicador como el nombre_indicador en su DataFrame resultante, debe incluir ambos en su declaración SELECT (además de una agregación COUNT ()). Esto requiere que incluya ambos en su cláusula GROUP BY.
- Ordene de los resultados más frecuentes a los menos frecuentes.

```python
# Your code goes here
code_count_query = """
    SELECT indicator_code, indicator_name, COUNT(1) AS num_rows
    FROM `bigquery-public-data.world_bank_intl_education.international_education`
    WHERE year = 2016
    GROUP BY indicator_code, indicator_name
    HAVING COUNT(1) >= 175
    ORDER BY num_rows ASC
"""

# Set up the query
safe_config = bigquery.QueryJobConfig(maximum_bytes_billed=10**10)
code_count_query_job = client.query(code_count_query, job_config=safe_config)

# API request - run the query, and return a pandas DataFrame
code_count_results = code_count_query_job.to_dataframe()

# View top few rows of results
print(code_count_results.head())

```
