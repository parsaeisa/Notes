# Pandas

Seeing top rows of a dataframe:
```python
df.head()
```

Aggregating dataframes:
```python
df = df.groupby("Document_ID").agg({
    # Aggregating stuff
})
```