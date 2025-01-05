# Numpy

Always try to use numpy built-in methods , because 
numpy does every thing efficiently and in multi-threads . 
and it is so fast because it is implemented with C++ . 

* try your best to not use for loop !!

## Techniques

consider a is a numpy array . the below line multiplies 
each element in a to the number . 

```python
    b = a * 5
```

b is a numpy array .

also in numpy you can act an array as a function and give it parameters as array . It can be a little bit complicated . look at this example : 
```python
a = np.array([1,1,2,2,3,4,5,6])
b = np.array([0,1,0,1,0,1,0])
```
In the code above , b[a] is : array([1, 1, 0, 0, 1, 0, 1, 0])

The code gives each element in a as an input argument to b , and act it like a math function . 

the b arrays elements are 0 when the index is even and are 1 when the indexes are odd . So it's a function which determines whether a number is even or odd . 

For applying a condition to an array this technique can be used (`d` is a numpy array):
```python
# d[condition] gives us [elements having that condition]
d[d==0]=1e-6
```
This code, searches for every elements in `d` which are equal to zero. 

## Methods 

To learn:
- unique
- cumsum
- interp
- dstack

`unique` extracts unique elements of an array - parameters : array

`full` creates an array with same value - parameters : array shape , value . 

Please:
```python
# Use this:
x, y = arr.shape()

# Instead of this:
x = arr.shape[0]
y = arr.shape[1]
```
For God sake :))

`meshgrid` Creates coordinate matrices from two input vectors. For example:
```python
import numpy as np

x = np.array([1, 2, 3])
y = np.array([4, 5])

X, Y = np.meshgrid(x, y)

print(X)
# Output:
# [[1 2 3]
#  [1 2 3]]

print(Y)
# Output:
# [[4 4 4]
#  [5 5 5]]
```

`diag` does different things for different shape of inputs:
- For vectors: converts them to diagonal matrices:
```python
arr = np.array([1, 2, 3])
diagonal_matrix = np.diag(arr)
# Output: array([[1, 0, 0],
#                [0, 2, 0],
#                [0, 0, 3]])
```
- For matrices: extract the diagonal elements:
```python
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])
diagonal_elements = np.diag(matrix)
# Output: array([1, 5, 9])
```

`cumsum`: At first I wondered about it's difference with `np.sum`. This is the difference:
```python
arr = np.array([1, 2, 3, 4])
np.sum(arr) # Output: 10
np.cumsum(arr)  # Output: [1, 3, 6, 10]

# And in two dimension arrays:
matrix = np.array([[1, 2], [3, 4]])
np.sum(matrix, axis=0)  # Output: [4, 6] (sum along rows)
np.cumsum(matrix, axis=0)  # Output: [[1, 2], [4, 6]]
```

The output of `cumsum` is a array but the output of `sum` is a number for each array.

`np.searchsorted`: It is used to find the indices where elements should be inserted into a sorted array to maintain the array's order.

```python
arr = np.array([1, 3, 5, 7])
values = [4, 6]

# Find indices to insert
indices = np.searchsorted(arr, values)
print(indices)  # Output: [2, 3]

# Explanation:
# 4 should be inserted before 5 (index 2).
# 6 should be inserted before 7 (index 3).
```

### Where
When you use `np.where` for an image, it gives you **two arrays**. The first array is y indexes of elements having that condition and the second one is x indexes of those.
```python
y_indices, x_indices = np.where(img >= threshhold)
```

#### stacking two images side by side

```python
res = np.hstack((img, clh))

plt.figure(figsize=(16, 16))
plt.imshow(res, cmap='gray')
```

`np.prod` : takes an array or a tuple (slice) and calculates multiplication of all of its memberes . 


* unique
* cumsum
* interp

## Submodules

### linalg
`linalg` is a submodule used for linear algebra. It has some methods:
- `solve`: For solving equations like Ax=b.