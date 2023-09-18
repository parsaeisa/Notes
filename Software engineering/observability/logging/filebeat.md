# Filebeat

## Strutcure 

<img src="https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/observability/logging/images/filebeat.png" >

As you can see it read logs from **files**, aggregates them and sends them to other platforms like redis, kafka, elastic, etc.

## Running

Run filebeat with docker : 
```bash
docker pull docker.elastic.co/beats/filebeat:8.9.2
```

For starting filebeat, we need elastic search and kibana. In result, we need 4 components: 
* The app itself
* Filebeat
* Elastic
* Kibana 

This is a docker compose that includes all 4 components of logging with filebeat : 

```bash
version: "3.1"
services:
  server:
    build:
      context: ./
      dockerfile: Dockerfile
    labels:
      co.elastic.logs/enabled: true
      co.elastic.logs/json.keys_under_root: true
      co.elastic.logs/json.overwrite_keys: true
      co.elastic.logs/json.add_error_key: true
      co.elastic.logs/json.expand_keys: true

  filebeat:
    labels:
      co.elastic.logs/enabled: false
    user: root
    image: docker.elastic.co/beats/filebeat:7.14.0
    command: filebeat -e -strict.perms=false
    volumes:
      - ./filebeat.docker.yml:/usr/share/filebeat/filebeat.yml
      - /var/lib/docker/containers:/var/lib/docker/containers:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro

  elasticsearch:
    labels:
      co.elastic.logs/enabled: false
    environment:
      - discovery.type=single-node
    image: docker.elastic.co/elasticsearch/elasticsearch:7.14.0
    healthcheck:
      test: ["CMD", "curl", "-s", "-f", "http://localhost:9200/_cat/health"]
      interval: 3s
      timeout: 3s
      retries: 80
    ports:
      - 9200:9200

  kibana:
    labels:
      co.elastic.logs/enabled: false
    image: docker.elastic.co/kibana/kibana:7.14.0
    depends_on:
      elasticsearch:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "curl", "-s", "-f", "http://localhost:5601/api/status"]
      interval: 3s
      timeout: 3s
      retries: 80
    ports:
      - 5601:5601
```

I haven't try this docker-compose file, it may need some changes to be practical. But, I have tried the docker-compose file below and it's fine ( in this case I didn't run elastic and kibana locally and I just forwarded the port from elatic): 

```bash
version: "3.1"
services:
  server:
    build:
      context: ./
      dockerfile: Dockerfile
    labels:
      co.elastic.logs/enabled: true
      co.elastic.logs/json.keys_under_root: true
      co.elastic.logs/json.overwrite_keys: true
      co.elastic.logs/json.add_error_key: true
      co.elastic.logs/json.expand_keys: true
    network_mode: "host"

  filebeat:
    labels:
      co.elastic.logs/enabled: false
    user: root
    image: docker.elastic.co/beats/filebeat:7.14.0
    command: filebeat -e -strict.perms=false
    volumes:
      - ./filebeat.docker.yml:/usr/share/filebeat/filebeat.yml
      - /var/lib/docker/containers:/var/lib/docker/containers:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
    ports:
      - "9200:9200"
```

If everything was ok, you should see the picture below in your Kibana dashboard : 

<img src="https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/observability/logging/images/kibana-filebeat-raw.png" width="700" height="550">

This is in Logs/Stream section in dashboard.

Also [This](https://github.com/alcbotta/go-filebeat-elastic/tree/master) is a usefull github repo for this purpose.

> In the image above, logs are moved into kibana as texts, not jsons. We need logs to be json for being able to query them.

## Inputs 

Filebeat has two ways for getting input logs. 
* modules
* manually

You can access modules by this command: 
```bash 
./filebeat modules list
```

With the command above you can see most used tools for logging and you can easily enable them using `enable` command. 

```bash
./filebeat enable nginx
```

In the manually way, 