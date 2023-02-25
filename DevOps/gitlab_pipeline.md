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
Not defined yet . just see an example :
```bash
variables:
 DOCKER_DRIVER: overlay2
 REGISTRY_IMAGE_TAG: "$SNAPPCLOUD_TEH1_REGISTRY/mozart/$CI_PROJECT_NAME-v2"
 DOCKER_API_VERSION: "1.39"
 DOCKER_REGISTRY_USERNAME: "gitlab-ci"
 DOCKER_REGISTRY_PASSWORD: ${SNAPPCLOUD_TEH1_MOZART_TOKEN}
 DOCKER_REGISTRY_ADDRESS: ${SNAPPCLOUD_TEH1_REGISTRY}
rules:
 - if: $CI_COMMIT_TAG
 - if: '$CI_COMMIT_BRANCH == "master"'
 - if: '$CI_COMMIT_BRANCH =~ /^dev*/'
 - if: $CI_COMMIT_BRANCH
   when: manual
   allow_failure: true
   
```
I think these conditions are in OR . 


### Gitlab predfined variables

https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

you can use these variables without any need to define them  . 

For example if we can get the branch name With these parameters, a thing that we can do is to determine that push to which branches can trigger jobs.

Or by using commit_message, we can put a condition that if commit message contained in certain word ( by instance "do_not_test" ) , no testing jobs should be triggered on it.

## Best practices

These jobs are triggered when a push executes on a branche. 

Not all jobs need to run. Some of them can be triggered manually. For example a job that pushes our docker image to a certain registry for test.

### What to do in pipelines ?
The main purpose of using pipelines is automating processes that should be performed frequently.

This is a list of operations that is better to do with pipelines : 
* Testing : running unit-tests
* Lint : checkes the cleanliness of codes
* Security : Running security scanning , security scanning tools can be called with bash
* Pushing image to a registry
* Deploy

> Complete this list

### Makefile 

Consider for testing purposes we need multiple lines with bash. If we put them in our pipeline file It would be too heavy and long. 
We can put those scripts in Makefile and assign them a name. Then with just `make <that name>` command, all of them would be executed, you can read more about Makefiles in [here](https://github.com/parsaeisa/Notes/blob/main/makefile.md)
