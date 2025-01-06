# Python

when you put a ! at the beginning of a line , you can add bash commands . example : 
```python
!wget -N -q "https://raw.githubusercontent.com/nikomadol/datasets/main/FER-2013/archive.zip"
!unzip -n -q archive.zip
```

**Python is very handy for writing scripts.**

## Installing requirements

There several ways to install a project's dependencies. 

### Installing on your machine 

A project should have a **requirements.txt** file that includes all requirements. 


### Installing on a virtual machine

The `pipenv` should be installed on your machine. Then your project should have a `pipfile` and a `Pipefile.lock`. Then easily using this command a virtual environment is created on your machine (in your projects root directory):
```bash
pipenv install
```

After the command above, using this you can get to the virtual env shell:
```bash
pipenv shell
```

## Parallel

Terms `async` & `await` exist in python too.

## OOP

Implementing some concepts in python. 

In a class, when you want to write an abstract method use `@abstractmethod` and remember to not write anything in the method. 
```python
@abstractmethod
def abstractMethod(self):
    pass
```

For static methods you must use `@staticmethod` and **don't put** the `self` in arguments.
```python
@staticmethod
def staticMethod():
    # Operations 
```

## Bash Command

- `isort`: exposes a command line utility for sorting, organizing, and formatting imports within Python and Cython source files.

## Creating a command line interface

You should import `click` package.

You create an instance of `Group` object.

```python
your_cli = click.Group(
    name='your_cli',
    help='description',
)
```

Then, for defining a command, you use the code below :

```python
@your_cli.command('command1')
# For each of your arguments
@click.argument(
    'arg1',
    envvar='arg1',
    nargs=1,
    type=str,
)
# Through method arguments you can pass command arguments
def commands_method(arg1: str):
    pass
```

## pip 

When you see pip is not found on terminal use this instead of pip:
```bash
python -m pip [arguments]
```

Seeing the list of installed packages:
```bash
pip list
```

To see information of a package such as where a specific python package is installed:
```bash
pip show < package name >
```

### venv

Sometimes you don't have full access to all beneath layers and you cannot install whatever you want on machine. Here you use virtual environments. 

Normally venv is installed alongside with Python.

To create a new einvironment:
```python
python -m venv myenv
```

myenv is you new environment. ( we have python -m pip and we have also pip, so maybe you can easy run venv without any prefixes)

After creating a database a new directory is created with the name of your environment and you should activate it. To activate it:
```python
source myenv/bin/activate
```

After you are done, you can simply close the session using:
```python
deactivate
```