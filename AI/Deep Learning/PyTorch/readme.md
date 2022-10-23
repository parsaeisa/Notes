# PyTorch

PyTorch is an extension of NumPy which can interact with GPU . 

## Tensor
we can make torch tensors from :
* python arrays --> `tensor` method
* numpy arrays --> `from_numpy` method
* from another tensor --> for example `ones_like` and `rand_like` methods
* from shapes . these methods get shape as inputs and fill them with ones or zeros on rand numbers : `rand` , `ones` and `zeros` . 

#### Operation on tensors 

on two tensors : 
* `cat`
* `matmul`
* `mul`

single tensor : 
* `add_`
* `sum`


[Reference](https://pytorch.org/tutorials/beginner/basics/tensorqs_tutorial.html)

## Optimizer 

when optimizing in DNNs , we have a forward-pass and a backward-pass . 

forward-pass :
```python
prediction = model(data)
```

backward-pass :
```python
loss = (prediction - labels).sum()
loss.backward() # backward pass
self.optimizer.step() # Does this have to be here always ? 
```

after these two steps , model parameters are updated . 

we need to define an optimizer , we load an optimizer with this method : 
```python
optim = torch.optim.SGD(model.parameters(), lr=1e-2, momentum=0.9)
```

SGD is one of the most usefull optimizers which computes gradient descent and decrease the error based on it . 


**torch.optim** has famous optimizers like Adam , SGD , adagrad etc . 

then **optim.step** is used to initiate gradient descents .

* what are `zero_grad` and `no_grad` methods ? 

## Loss functions
There are other loss functions than `(prediction - labels).sum()` .

## Model
we need to use , save and load a model . 

A model must inherit torch.nn.Module

#### Define model
There are lots of models in PyTorch , for example a sequential model : 
```python
model = nn.Sequential( *layers )
```

#### Save 
```python
torch.save(model.state_dict(), filepath)
```

#### Load
```python
base_model = torch.load(filepath)
```

To load model weights, you need to create an instance of the same model first, and then load the parameters using the code below : 

```python
model = nn.Sequential( *layers )
model.load_state_dict(torch.load('model_weights.pth'))
model.eval()
```
