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

## Methods 

`unique` extracts unique elements of an array - parameters : array

`full` creates an array with same value - parameters : array shape , value . 

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
* 