# Gitlab

There is a gitlab.com but for using it's runners you should pay money. 

Hence, the firms try to run their own self-managed gitlab on their own servers. 

There are two ways to create your self managed gitlab:
- docker 
- omnibus

> Always remember that gitlab has a very accurate document.

## Docker 

You need two images one for the gitlab itself and one for runners. You need to register each runner when you are creating them. 

This is a usefull link for running gitlab with docker :

https://www.czerniga.it/2021/11/14/how-to-install-gitlab-using-docker-compose/

It has a docker image that contains both images : 

The docker file :
```
# docker-compose.yml
version: '3.7'
services:
  web:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    hostname: 'localhost'
    container_name: gitlab-ce
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://localhost'
    ports:
      - '8080:80'
      - '8443:443'
    volumes:
      - '$GITLAB_HOME/config:/etc/gitlab'
      - '$GITLAB_HOME/logs:/var/log/gitlab'
      - '$GITLAB_HOME/data:/var/opt/gitlab'
    networks:
      - gitlab
  gitlab-runner:
    image: gitlab/gitlab-runner:alpine
    container_name: gitlab-runner    
    restart: always
    depends_on:
      - web
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - '$GITLAB_HOME/gitlab-runner:/etc/gitlab-runner'
    networks:
      - gitlab

networks:
  gitlab:
    name: gitlab-network
```

But it had some bugs. I used omnibus myself and it was so better. 

## Omnibus

You can easily search omnibus gitlab.

This is installed using `apt-get`.

This is bunch of commands and you need to search about them. 

it is started by the command below : 
```bash
sudo gitlab-ctl start
```

* You can use stop and status instead of start. 

You need to install gitlab-runner using apt-get too and you can configure it using the file in `/etc/gitlab-runner/config.toml`

You cannot see it with `ls`.

> After installing the gitlab itself it's UI is very straighforward for runners. 

### A bug
When I choosed docker as the executor for runner I got this error : 

[put the image]

But when I changed it's executor to **shell** it became fixed. 