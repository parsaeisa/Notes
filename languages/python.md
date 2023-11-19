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