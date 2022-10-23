# Bash commands 

You can write a *.sh file which consists of bash commands and then 
execute all of them by running that file . 

in bash we have **for** , **if** and **switch case** .

In the case that they are needed search for them , just know that they exist . 

**declare** allows you to update attributes applied to variables . 
parameters : 
* -A : defines associative array ( associative array is like dictionaries in python )
* -a : defines indexed array
* -r : defines readonly variables .


**curl** is used to make a http request . 

A curl script can be generated by Postman . 

* A script is a piece of code that executes only one time . It can be in any language .

parameters : 
* complete it ...

**find** is a built-in function which finds a file or directory . 
parameters : 
* -name : with this you specify the file or directory name .
* -type : if its d , you are searching for a directory .

**echo**

consider you have a parameter called len , if you execute "echo len" ,
you will get the "len" . 

To act len like its a variable and to get its value , you should type "echo ${len}"

An example : 
```bash
declare -a names
names=(
  'name1'
  'name2'
  'name3'
)

len=${#names[@]}

for name in "${!names[@]}"; do
    echo ${names[$name]}
    if [ ${names[$name]} == 'name2' ]; then
        echo 'found'
    fi
done
```

We can also define methods with bash . for example : 

{bring an example}

and call it like this : 
```bash
    deploy_project $project
```