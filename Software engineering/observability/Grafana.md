# Grafana

Different components:
- Promtail: collects logs
- Loki: stores logs, usually on port 3100
- Grafana: visualizes logs, usually on port 3000

## Checking connection

To see whether your service is connected to Loki or not, Go to Explore tab in UI and type this query:
```
{app="app-name"} |~ ".+"
```
