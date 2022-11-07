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

## Foot of kuzeh gari

While multiclass classification , when you use softmax and an output layer with for example 10 units , you may face this error : 

> ValueError: Shapes (64, 1) and (64, 10) are incompatible site:stackoverflow.com

This is because you didn't apply to_categorical method on your labels  . 

* Sometimes val_loss is NaN because of mismatching types . 

## Useful links 
import models : https://www.tensorflow.org/api_docs/python/tf/keras/models

