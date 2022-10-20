# Matplotlib

## Histogram

drawing the histogram of a picture with 256 brightness layers :

```python
plt.hist(image.flatten(),256,[0,256], color = 'r')
plt.show()
```

## Subplot

Is used to plot some images or charts in a table . 

use : 
```python
    fig, (ax1, ax2, ax3) = plt.subplots(nrows=1, ncols=3)
```

It gives you some axs as outputs and you can behave this axs like they are plts . 
example : 

```python
ax1.imshow(source)
ax1.set_title('Source')
ax2.imshow(reference)
ax2.set_title('Reference')
ax3.imshow(matched)
ax3.set_title('Matched')

plt.show()
```

#### Parameters : 
* sharex & sharey
* figsize
* nrows & ncols

#### Methods : 
* set_title 
* tight_layout
* show
