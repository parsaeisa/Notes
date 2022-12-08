# Keras 

### Famous Methods

**Flatten** : for example takes a 28x28 matris and return a 1x784 matris

**Dense** : gives a fully connected layers

**Summary** : show a summary of model 

**model.compile** : we define optimizer and loss function in it

**model.fit** : train the model 

parameters : 
* verbose : print sth or not 
* we have epochs , shuffle and batch_size which you know what are they . 


**to_categorical** : the distance between each two output classes should be equal . for example if the required anwer is 2 , and model gives 3 or 7 , it should be penalized equally in both cases . 

to achieve this , we need convert classes to matrices . for example 

2 must become [0,0,1,0,0,0,0,0,0,0]

3 must become [0,0,0,1,0,0,0,0,0,0]
etc .

in order to get this representation , we use to_categoricall method . 

**plot_model** plots model very nicely and saves it into a file . 
```python
plot_model(
    model_temp_1,
    to_file="structure_1.png",
    show_shapes=True,
    show_layer_names=True,
)
```

## Layers
`Dropout` 

## Callbacks 
Call backs are methods that are executed after each epoch . here you can see some callbacks . 

**optimizers.schedules** is used for learning rate decay . 

**TensorBoards** gives a good visualizing on model . to use tensorboard use this :
```python
import datetime
log_dir = "logs/fit/" + datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir=log_dir, histogram_freq=1)
```

then add this callaback to your callbacks in fit method .like this : 
```python
# Fit model
  history = model.fit(
    x_train, 
    y_train, 
    batch_size = 64, 
    epochs = 20,
    validation_data=(x_test, y_test),
    callbacks=[tensorboard_callback]
  )
```

Then for seeing the charts : 

in google colab : 
```python
%load_ext tensorboard
%tensorboard --logdir logs/fit
```

in terminal : Same lines just without % at the begininng . 
[reference](https://www.tensorflow.org/tensorboard/get_started)

## CNN

CNN is acronym for Convolutional neural networks is a network which contains twi types of layers : 
* Conv2D 
```python
from tensorflow.keras.layers import Conv2D
Conv2D(filters, kernel_size,
       strides, padding,
       activation, input_shape)
```

* MaxPooling 
```python
MaxPooling2D(pool_size, strides, padding)
```

this link was helpfull : https://towardsdatascience.com/coding-a-convolutional-neural-network-cnn-using-keras-sequential-api-ec5211126875


## Foot of kuzeh gari

While multiclass classification , when you use softmax and an output layer with for example 10 units , you may face this error : 

> ValueError: Shapes (64, 1) and (64, 10) are incompatible site:stackoverflow.com

This is because you didn't apply to_categorical method on your labels  . 

* Sometimes val_loss is NaN because of mismatching types . 

#### First thing to apply on data 

these 2 lines normalize your input data . 

```python
x_train_1 = x_train_1.astype(float) / 255.0
x_test_1 = x_test_1.astype(float) / 255.0

y_train_1 = to_categorical(y_train_1, num_classes=10)
y_test_1 = to_categorical(y_test_1, num_classes=10)
```

### New methods to learn

`variable_scope`

`Session`

`Graph`

`placeholder`

`random_normal_initializer`

`constant_initializer`

`get_collection`

`tf.train.AdamOptimizer(self.lr).minimize(self.loss)`

## Useful links 
import models : https://www.tensorflow.org/api_docs/python/tf/keras/models

keras , cifar : https://www.kaggle.com/code/ektasharma/simple-cifar10-cnn-keras-code-with-88-accuracy/notebook#Reading-the-CIFAR-10-dataset-from-Keras-datasets-&-setting-train-and-test-data
