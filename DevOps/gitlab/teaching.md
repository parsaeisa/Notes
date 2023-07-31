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

### gitlab built-in variables

https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

Show them this link, just echo one of them. 

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

## A variable in general

## A variable in each job. 

This is usefull when you want to push your image in different registries.

### Why different registries ? 

- Testing environments. 
- An application may contain more than one datacenter.

There are some variables that need to change everytime. 

Then tell them about templates.

## Template



## Setting a secret

Setting a secret.

## Othersssss

## Some other variables on dockerfile

## Use github registry

Steps :

- docker -h 
- docker login