1. COUNT(): 
2. GROUP BY():
3. **GROUP BY ... HAVING:** HAVING se usa en combinación con GROUP BY para ignorar los grupos que no cumplen con ciertos criterios.
```python
query="""
    SELECT Animal, COUNT(ID) AS num_posts
    FROM `bigquery-public-data.pet_records.pets`
    GROUP BY Animal
    HAVING COUNT(ID) > 1
"""
```

*Example:* ¿Cuántos comentarios se han eliminado? (Si se eliminó un comentario, la columna eliminada en la tabla de comentarios tendrá el valor Verdadero).

```python
deleted_posts_query = """
        SELECT COUNT(1) AS num_deleted_posts
        FROM `bigquery-public-data.hacker_news.comments`
        WHERE deleted = True
"""

query_job = client.query(deleted_posts_query)

deleted_posts = query_job.to_dataframe()

print(deleted_posts)
```
