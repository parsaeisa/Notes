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