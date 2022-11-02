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

## Histogram

drawing the histogram of a picture with 256 brightness layers :

```python
plt.hist(image.flatten(),256,[0,256], color = 'r')
plt.show()
```