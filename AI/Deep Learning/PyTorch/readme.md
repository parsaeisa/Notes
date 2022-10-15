# PyTorch

when a model is defined , it must inherit torch.nn.Module


### Optimizer 

when optimizing in DNNs , we have a forward-pass and a backward-pass . 

forward-pass :
```python
prediction = model(data)
```

backward-pass :
```python
loss = (prediction - labels).sum()
loss.backward() # backward pass
```

after these two steps , model parameters are updated . 

we need to define an optimizer , we load an optimizer with this method : 
```python
optim = torch.optim.SGD(model.parameters(), lr=1e-2, momentum=0.9)
```

SGD is one of the most usefull optimizers which computes gradient descent and decrease the error based on it . 


**torch.optim** has famous optimizers like Adam , SGD , adagrad etc . 

then **optim.step** is used to initiate gradient descents .