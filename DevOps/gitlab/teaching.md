# Gitlab pipeline - Bootcamp

## Steps 

- Introduction
- Showing a usecase of gitlab pipeline 
- Define stages
- variables
- Docker image
- Rules
- Examples
- Makefile
- Job structure
- Dependencies
- Timing
- Pushing images
- Artifact
- Include
- Secrets
- Tag 

- Pushing image to a registry 

## Introduction

Tell them about the concept of devops. 

DevOps is developer operations. Operations means running software tools. Softwares such testing softwares, linting softwares, security scanning softwares, etc.

Explain them it is better to do these jobs alongside with developing, before a code is ready to be used for deployment. 

DevOps is a practice, not a role. 

Write a simple golang project that has just one function and a it's test. 

Put it on git and tell them to download it. 

## Showing a usecase

> There is an stage in development when lots of things happen there. This is a place that you can use many tools. 

Just a simple job that echos a word in just one stage. 

The difference between job & pipeline. 

## Job structure

## Variables

- where are they defined ? 
- convention

> You should always follow conventions. 

## Docker image

Just tell them that docker image describes a computer, and tell them there is docker image for everything. 

## Makefile 

Some commands are too big to be in gitlab pipeline. It is a best practice to add those commands in makefile, and in the gitlab file, just write: `make [command]`.

It has two points : 
- It lessens the size of gitlab file. 
- It is easier for developers to run commands locally. 

Tell them about some usages of Makefile (about developer experience enhancement). Usages such as running migrations. 

# Dependencies

Jobs can be dependant to each other. 

Sometimes, a job for being executed needs another job to be completed.

# Timing

before_script & after script

It can be a continue to dependencies section. 

# Pushing images

One of the most important usages of pipelines. 

just say it theoritically. don't show anything in code, just tell them that they will learn this in docker chapter. 

Tell them about a way that each deploying is performed. 

An image is generated --> it get pushed to a registry --> A deploy command in a bigger computer

```

```

## Examples

What examples should I bring ?

Ideas : 
- write a simple golang app. In pipeline: 
    - test
    - lint
    - line length limit - you can show them revive for example


# Last session

## Gitlab running

explain to them your experience about running a self-managed gitlab. 

Mention **Omnibus**.

## Manual 

Try to build an image with docker using **-h**. Go a scenario that you don't know. Let them see how you learn new things.

## Define some jobs

images: 
- golang:1.18.5-alpine3.16
- docker:19.03.9

## Pre-defined values

Show them the link below :

 https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

Show some of them using `echo` command.

Try to use them for creating image.

## Variables

Variables are defined in 3 places : 
- in general
- in each job
- in secrets

### A variable in general

### A variable in each job. 

This is usefull when you want to push your image in different registries.

#### Why different registries ? 

- Testing environments. 
- An application may contain more than one datacenter.

There are some variables that need to change everytime. 

Then tell them about templates.

#### Template



### Setting a secret

Setting a secret.

## Rules

```bash
rules:
    - if: $CI_COMMIT_MESSAGE !~ /\[do-not-test\]/
```

Sometimes we do not need to test something. It takes time and resources. 

## Include

```
include:
- project: 'Group/Test'
  file:
    - hello.yml
```

Show them a scenario that included job's stage doesn't exist. Show them .pre & .post stage.

```
include:
  - local: 'hello.yml'
```

Give them an example like security.

## Manually

refer to snapp projects.

## Othersssss

## apk 

```bash
apk add make curl
make --version
```

## artifact

Putting result in a file.


```
artifacts:
    name: "$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG-helm"
    paths:
      - ${CI_PROJECT_NAME}.html
    expire_in: 1 week
    reports:
      junit: .report.xml
```

Reports are usually xml files. 

## Some other variables on dockerfile

Show them this link for gitlab keywords:

https://docs.gitlab.com/ee/ci/yaml/

## Use github registry

Steps :

- docker -h 
- docker login

``` bash
deploy:
    needs: [ build, test ]
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      # Login docker hub
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ragnacode
          password: ${{ secrets.DOCKERHUB_PWD }}

      # Copy production dockerfile
      - name: Copy production dockerfile to ./
        run: |
          cp ./deployments/dev/Dockerfile .

      # Deploy to Docker registry
      - name: Deploy to Docker registry
        uses: docker/build-push-action@v1
        with:
          username: ragnacode
          password: ${{ secrets.DOCKERHUB_PWD }}
          context: .
          repository: ragnacodes/legato_server
          tags: latest
```

## Clean up stage

Consider there is a testing app that tests your application. 

It come and runs all your applications dependencies. 

So it takes some resources and they must be de-allocated. 

So there is a job that does this. 

## If you had extra time

Go to docker-compose. 

Try your url shortener.