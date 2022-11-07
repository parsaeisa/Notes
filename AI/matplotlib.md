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

## Histogram

drawing the histogram of a picture with 256 brightness layers :

```python
plt.hist(image.flatten(),256,[0,256], color = 'r')
plt.show()
```