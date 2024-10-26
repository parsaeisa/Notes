# Numpy

Always try to use numpy built-in methods , because 
numpy does every thing efficiently and in multi-threads . 
and it is so fast because it is implemented with C++ . 

* try your best to not use for loop !!

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

* unique
* cumsum
* interp
* dstack

## Methods 

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