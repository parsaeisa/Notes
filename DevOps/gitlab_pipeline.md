# Gitlab pipeline

A pipeline is consisted of multiple jobs . 

### Structure of a gitlab pipline

* include
* **stages** : we just determine stages names and their order 
* **variables** :  we define constants there with uppercase letters .
* **Jobs** : we define commands that make our job . each job is there with its name on it . 

Each stage can have more than one job.

It means you have names include , stages and variables 
in your file but you don't have any word jobs . 

In include part you can add other yml files which contains
the job that you want to use . Obviously you don't
need to rewrite those jobs . 

```bash
include:
  - project: 'reference/project'
    file:
      - 'foo1.yml'
      - 'foo2.yml'
```

* While including a job , we can add rules for them in the below format : 

```bash

include:
  - project: 'reference/project'
    file:
      - 'foo1.yml'
    rule:
      - if: '$CI_COMMIT_BRANCH == "master"' # An example condition 
```

* CI_COMMIT_BRANCH is one of the  built-in variables that gitlab_pipeline has access to . 

In variables part you define variables . variables are 
uppercased . 

```bash
variables:
  GOOS: "linux" 
```

In stages you define stages of your pipeline , which 
determines the order of your jobs . each job has a stage
and executes when that stage arrives . 

```bash
stages:
  - test
  - build
  - package
  - release
```

### Structure of a gitlab job
* image :  the address of image that we wanna run our job on . 
* stage : here we define the stage of our job to define its order 
* script
* artifacts
* before_script
* after_script
* dependencies : dependencies are other jobs . for example if  “test” job is depending on “compile” job we write “-compile” here . 
* allow failure 
* rules
* except 
* variables

All script, before_script and after_script are bash commands .

### Artifacts
It is used when we want to store the result of our job in a file called artifact . 
Parts : 
name 
paths
expire_in
reports
Search in Google for values that they can take . 

### Except
Apparently We can access branch names , commit messages etc with variables defined in gitlab . ( search in google ) . For example, I think  $CI_COMMIT_MESSAGE  represents the commit message . and also we have 
$CI_COMMIT_BRANCH
$CI_COMMIT_TAG 
Except part is being determined to tell the job when not to execute . for example : 
```bash
except:
 variables:
   - $CI_COMMIT_MESSAGE =~ /\[do-not-test\]/
```

### Variable and rules


### Gitlab predfined variables

https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

you can use these variables without any need to define them  . 
