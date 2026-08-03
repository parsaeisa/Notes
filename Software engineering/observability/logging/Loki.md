# Loki

Here you can see some files for Loki and Grafana to see Loki's logs in.

loki-config.yaml:
```bash
auth_enabled: false

server:
  http_listen_port: 3100
  grpc_listen_port: 9096
  log_level: debug
  grpc_server_max_concurrent_streams: 1000

common:
  instance_addr: 127.0.0.1
  path_prefix: /tmp/loki
  storage:
    filesystem:
      chunks_directory: /tmp/loki/chunks
      rules_directory: /tmp/loki/rules
  replication_factor: 1
  ring:
    kvstore:
      store: inmemory

query_range:
  results_cache:
    cache:
      embedded_cache:
        enabled: true
        max_size_mb: 100

limits_config:
  metric_aggregation_enabled: true

schema_config:
  configs:
    - from: 2020-10-24
      store: tsdb
      object_store: filesystem
      schema: v13
      index:
        prefix: index_
        period: 24h

pattern_ingester:
  enabled: true
  metric_aggregation:
    loki_address: localhost:3100

ruler:
  alertmanager_url: http://localhost:9093

frontend:
  encoding: protobuf

querier:
  engine: {}
```

docker-compose.yml:
```bash
version: "3.9"
services:
  loki:
    image: grafana/loki:3.5.7
    container_name: loki
    command:
      - -config.file=/mnt/config/loki-config.yaml
      - -config.expand-env=true
    ports:
      - "3100:3100"
    volumes:
      - ./:/mnt/config   # mounts your current directory into /mnt/config
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    ports:
      - "3200:3000"
    depends_on:
      - loki
```

After running this docker-compose file:
- Go to grfana UI
- User pass is admin, admin
- Search "datasource"
- Add "Loki"
- Go to to explore
- Choose Loki

Then you should see logs.