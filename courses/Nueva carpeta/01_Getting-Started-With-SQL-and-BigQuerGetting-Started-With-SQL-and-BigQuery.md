## Getting Started

1. Importamos el paquete *bigquery*
```python
from google.cloud import bigquery
```

2. Creamos el cliente
```python
client = bigquery.Client()
```

3. Obtenemos el conjunto de datos *hacker_news* del proyecto *bigquery-public-data*
```pyhton
dataset_ref = client.dataset("hacker_news", project="bigquery-public-data")
dataset = client.get_dataset(dataset_ref)
```

4. Listar las tablas del cojunto de datos
```
tables = list(client.list_tables(dataset))
for table in tables:  
    print(table.table_id)
```

5. Obtener una tabla en particular
```
table_ref = dataset_ref.table("full")
table = client.get_table(table_ref)
```

## Table schema

1. Imprimir información de la estructura de las columnas de la tabla *full*
```
table.schema
```

2. Imprimir registros de la tabla *full*
```
client.list_rows(table, max_results = 5).to_dataframe()
```

3. Imprimir registros de la tabla *full* de una columna en particular
```
client.list_rows(table, selected_fields=table.schema[:1], max_results=5).to_dataframe()
```
