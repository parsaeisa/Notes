# Gitlab pipeline - Bootcamp

## Steps 

- Showing a usecase of gitlab pipeline 
- Define stages
- Rules
- Examples
- Makefile
- Job structure
- Dependencies
- Timing
- Pushing images
- Artifact

- Pushing image to a registry 

## Showing a usecase

> There is an stage in development when lots of things happen there. This is a place that you can use many tools. 

Just a simple job that echos a word in just one stage. 

The difference between job & pipeline. 

## Job structure



## Makefile 

Some commands are too big to be in gitlab pipeline. It is a best practice to add those commands in makefile, and in the gitlab file, just write: `make [command]`.

It has two points : 
- It lessens the size of gitlab file. 
- It is easier for developers to run commands locally. 

# Dependencies

Jobs can be dependant to each other. 

Sometimes, a job for being executed needs another job to be completed.

# Timing

before_script & after script

It can be a continue to dependencies section. 

# Pushing images

just say it theoritically. don't show anything in code, just tell them that they will learn this in docker chapter. 

## Examples

What examples should I bring ?

Ideas : 
- write a simple golang app. In pipeline: 
    - test
    - lint
