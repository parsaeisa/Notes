# Python

in this file you can see things that I learnt from python . 

#### Get relative path to a file 

```python
import os

dirname = os.path.dirname(__file__)
path = os.path.join(dirname , 'path/to/file/img1.png' )
```

## Common errors 
> too many values to unpack (expected 2)

it happens when you have something like this : 
```python
a, b = ['apple', 'banana', 'kiwi']
```

It occurs when the number of variables in the assignment is not the same as the number of values in the iterable.