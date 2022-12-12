# Matplotlib

showing bunch of images in a good format : 
* A method from torch called `make_grid` is used here .

```python
#visualize a batch of data using the make_grid helper function from Torchvision
for images, _ in train_loader:
    print('images.shape:', images.shape)
    plt.figure(figsize=(16,8))
    plt.axis('off')
    plt.imshow(make_grid(images, nrow=16).permute((1, 2, 0)))
    break
```

Showing two images side by side with title and size configuration : 
```python
plt.figure(figsize = (20,30))
plt.subplot(121),plt.imshow(im,cmap = 'gray')
plt.title('Original Image'), plt.xticks([]), plt.yticks([])
plt.subplot(122),plt.imshow(edges,cmap = 'gray')
plt.title('Edge Image'), plt.xticks([]), plt.yticks([])
plt.show()
```

## Subplots 
An example with set_title and axis off . 
```python
f, axarr = plt.subplots(2, 2)
axarr[0,0].imshow(img, cmap = cm.Greys_r)
axarr[0,0].set_title("Rank = 512")
axarr[0,0].axis('off')

axarr[0,1].imshow(img, cmap = cm.Greys_r)
axarr[0,1].set_title("Rank = %s" % 128)
axarr[0,1].axis('off')

axarr[1,0].imshow(img, cmap = cm.Greys_r)
axarr[1,0].set_title("Rank = %s" % 32)
axarr[1,0].axis('off')

axarr[1,1].imshow(img, cmap = cm.Greys_r)
axarr[1,1].set_title("Rank = %s" % 16)
axarr[1,1].axis('off')

plt.show()
```

## Plot DL models
To plot a DL model's loss and accuracy use this piece of code : 

`history` is returned from `model.fit` method .

```python
import matplotlib.pyplot as plt
acc = history.history['accuracy']
val_acc = history.history['val_accuracy']
loss = history.history['loss']
val_loss = history.history['val_loss']

epochs = range(len(acc))

plt.plot(epochs, acc, 'r', label='Training accuracy')
plt.plot(epochs, val_acc, 'b', label='Validation accuracy')
plt.title('Training and validation accuracy')
plt.legend()

plt.figure()

plt.plot(epochs, loss, 'r', label='Training Loss')
plt.plot(epochs, val_loss, 'b', label='Validation Loss')
plt.title('Training and validation loss')
plt.legend()

plt.show()
```

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
