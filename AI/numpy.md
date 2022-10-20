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

#### stacking two images side by side

```python
res = np.hstack((img, clh))

plt.figure(figsize=(16, 16))
plt.imshow(res, cmap='gray')
```