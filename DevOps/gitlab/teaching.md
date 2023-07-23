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

- Pushing image to a registry 

## Introduction

Tell them about the concept of devops. 

DevOps is developer operations. Operations means running software tools. Softwares such testing softwares, linting softwares, security scanning softwares, etc.

Explain them it is better to do these jobs alongside with developing, before a code is ready to be used for deployment. 

DevOps is a practice, not a role. 

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

## Examples

What examples should I bring ?

Ideas : 
- write a simple golang app. In pipeline: 
    - test
    - lint
    - line length limit - you can show them revive for example
