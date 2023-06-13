# Clean code

If you have a method with many arguments, It smells (most of the times).

If you use too many `if` statements in your code, It may smell.

## Basic

* indentation
* namings
* putting constant in configs

## Assign everything to the correct part

Each part in a software code has a duty. Each part should not do anything any thing **more** or less.

For example, a repository layer should just interact with database, nothing more. We should not put any decision there. 
