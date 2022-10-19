# Gitlab pipeline

### Structure of a gitlab pipline

### Gitlab built-in variables
* include
* stages
* variables
* [ the place where you define you jobs ]

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