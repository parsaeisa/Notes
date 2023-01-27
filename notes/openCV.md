# OpenCV

`py-tesseract` is used to convert image to string . It supports Persian language . 

Installation for linux : 
```bash
!sudo apt-get install tesseract-ocr-fas
```

Installation for python : 
```bash
!sudo apt install tesseract-ocr
!pip install pytesseract
```

We can show an image using openCV.imshow() , but in colab its better to use plt.imshow : 
```python
plt.imshow(img , cmap='gray')
```

* with cmap argument you can choose the color of your image . 

## Convert color
The images that are being scanned by imread , is BGR at first . 

Converting a picture to gray : 
```python
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
```

## Histogram

drawing the histogram of a picture with 256 brightness layers : 

```python
plt.hist(image.flatten(),256,[0,256], color = 'r')
plt.show()
```

<br />

### Histogram equalization

**cv2.equalizeHist(img)** : is a method in openCV which equalize Histograms . output of this method 
is an image with equalized histogram . 

**CLAHE** : the code below applies CLAHE to an image :
(img is the output of imread method )
```python
clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
clh = clahe.apply(img)
```

### Shape extraction 

## Canny edge detector 

There is a method called `cv2.Canny` which takes 3 arguments . first one is image . 

The second one and third one , whatever these items are bigger , the weak edges are more removed . 

The maximum derivative in a picture is 255 ( two adjacent pixels , one of them is white and 255 and the other is black 0 and the derivative is the difference of brightness level ) and for taking gradient in Canny , Sobel is used , so the derivative is 8 times bigger than the actual derivative , so these parameters can be big about 2000 ( 8 * 255 ) . 

and 2nd param should be smaller than 3rd parameter . 

mid level edges must be between these two parameters --> refer to Canny structure . 

```python
edges = cv2.Canny(im, 50, 200)
```

## Bluring

Bluring is made when a **Gaussian filter** is applied to a picture . code : 

* Gaussian filter is an averaging filter . Its size can be 3 , 5 , 7 etc . 

```python
kernel = np.ones((5,5),np.float32)/25
dst = cv2.filter2D(im,-1,kernel)
```

## Contours

In OpenCV, finding contours is like finding white object from black background. So remember, object to be found should be white and background should be black. 

An image should be tresholded or should use Canny edge detector to be black and white before applying findContours on it . 

Contours has some features like : 
* area : contourArea method which takes a single contour 
* perimeter : or arcLength
* centroid
* bounding box

## Otsu

Before using otsu don't forget to convert image's color to gray . 

Example of otsu : 
```python
ret,otsu_thresh = cv2.threshold(gray,127,200,cv2.THRESH_BINARY)
```

Example of adaptive thresholding : 
```pytohn
ada_otsu_thresh = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 11, 2)
```

These are just examples , based on your problem change their inputs .

## Contours

Open cv has a method named find_contours which detects the objects in the image . For each object in the image , it returns a cnt . 

```python
contours,hierarchy = cv2.findContours(thresh, cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
```

There is also other methods which are usefull : 

`contourArea` computes the **area** in a cnt . 

`arcLength` computes the **perimeter** of a cnt .

`convexHull` computes the area of smallest convex shape that an specific shape fits in . We can act the output of this method like a cnt and compute its area . 

`drawContours` draws shapes on our image . 

This is the code of drawing a convex hull of a shape : 
```python
hull = cv2.convexHull(cnt)
x1, y1 = hull[0][0]
img = cv2.drawContours(img,[hull],0,(255,255,0),2)
```

https://docs.opencv.org/4.x/dd/d49/tutorial_py_contour_features.html

## LBP

Local binary pattern which shows us very useful information about an image . 

`skimage` has a method that produces this . 

```python
lbp = feature.local_binary_pattern(image, numPoints,
			radius, method="uniform") 
plt.imshow(lbp)
```
and we can convert it to histogram with the code below : 

```python
(hist, _) = np.histogram(lbp.ravel(),
			bins=np.arange(0, numPoints + 3),
			range=(0, numPoints + 2))
```
