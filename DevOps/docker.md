# Docker

Docker is an easier way to run projects and their dependencies . 

## Basic commands

to see the list of pulled Images : 
```bash
docker images
```

to get running containers (and seeing their IDs):
```bash
docker ps
```

to pull a new Image :
```bash
docker pull <image name>:<image version>
```

to runa container from an image :
```bash
docker run <image name>:<image version>
```

to stop a container : 
```bash
docker stop <container id>
```

Get to the shell : 
```bash
docker exec -it [container-id] bash
```

Get a container's information : 
```bash
docker logs [container-id]
```

See what port, the container is connected to: 
```bash
docker port [container-id]
```

See a configuration variable in a container (for example for the memory): 
```bash
docker inspect <container id> -f "{{.HostConfig.Memory}}"
```

## Flags
`-d` distpaches and returns the terminal 

`--name` with this you can assign a name to your container and make it easier to work with . 



## Ineracting with registries 
Registry is a place which has images . The biggest registry is dockerhub . sometimes companies have their own private registry . 

The registry helps us to pull images for our applications more quickly.

login to a registry :
```bash
doker login -u [username] -p [password] [registry address]
```


### Push image
On occasion, we must push our images to a registery. These are commands for that objective.

First we must tag the image :
```bash
docker tag IMAGE[:TAG] [REGISTRYHOST/address to image]
```

Then we can push the image : 
```bash
docker push [name]:[tag]
```
this is the name of image or the registry . 

### Push to gitlab registry
https://docs.gitlab.com/ee/user/packages/container_registry/



## Interacting with containers
### Copy file in container
``` bash 
sudo docker cp db.sql <container id>:/
```
### Go to container terminal
```bash 
sudo docker exec -it <container id> bash
```

* You can get container Id from docker ps command .
* Sometimes /bin/sh works instead of bash . 



### Volume 

You can mount a directory or file from the host machine into the container.

Command : 
```bash
docker run -v <host_path>:<container_path> ...
```

## Useful commands

### Commit

Consider you have a container and you installed a CLI on it. You can save this container to an image by this command: 
```bash
docker commit <containerID> <image name>:<tag>
```

This is the place where I put docker commands which are usefull at least for me .
I hope this repo would help you !!

### Mysql
```bash 
sudo docker run -d -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -p 3307:3306 mariadb:10.2.14
```

### Mssql
```bash 
docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=Pass123!" -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:latest
# Executing a query (in the container) :
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Pass123!' -i q1.sql 
```

### Open telemetry
```bash 
 docker run --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14250:14250 \
  -p 14268:14268 \
  -p 14269:14269 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.29
```

### Gitlab
```bash
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest
```

jeager runs on http://127.0.0.1:16686/ .

* You can name your container with --name parameter while running the image . This can help you to interact more easily with containers .


## Docker file 

```
ENV TZ="Asia/Tehran" \
    PATH="/app:${PATH}"
```

```
WORKDIR /app
```

`EXPOSE`: You put a port after it and then the application is served on that port.
```
EXPOSE 8080
```

There are `ARG` and `LABEL` tag that learn what are they. 

You define `ARG`s and then you can use them in label. That's all I know.

> For a golang project you **just** copy the binary (created in pipelines) in `WORKDIR`. (don't use `WORKDIR`, bring the actual name of `WORKDIR`)

## Docker network 

By default, Docker containers run in a separate network namespace, which means that 127.0.0.1 inside the Docker container refers to the container itself, not your host machine.

If we want to send request from container to one of host ports, we have two options: 
- Set the host's ip address for sending requests. 
- Set docker's network to host : 
```bash
docker run --network host [OPTIONS] [image name]
```

### Bridge network 

What is brige network at all ?

## Label

I think docker assigns labels to it's running container. I don't know anything more. 
