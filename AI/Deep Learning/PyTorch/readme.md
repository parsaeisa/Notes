# PyTorch

PyTorch is an extension of NumPy which can interacts with GPU . 

The strongest counter part is **Tensorflow** library. Pytorch is better for Academic projects and in the production PyTorch has superiority. 

topics : 
* tensor
* optimizer
* loss function
* model

## What da ffuck are these shit methods
* Detach
* no_grad
* ttest_rel
* to(DEVICE)
* View
* squeeze
* Unsqueeze
* LongTensor
* expand
* masked fill
* log
* zero_grad
* Adam.step
* contiguous
* graph
* BatchNorm1d

## Finding videos of PyTorch working with GPUs

### About GPU deployment on Docker and Docker-compose

How to deploy containers with access to Graphic Cards. 
* `nvidia container toolkit docker tutorial`
* `docker compose nvidia gpu setup`
* `deploy pytorch model docker gpu`
* `fastapi pytorch docker nvidia gpu`

### Resolving Out of Memory (OOM) error and Managing GPU RAM

برای یادگیری نحوه تخصیص بهینه VRAM، پاک‌سازی کش و دیباگ مصرف گرافیک:

* `pytorch cuda out of memory fix`
* `pytorch gpu memory management`
* `pytorch cuda amp mixed precision tutorial`
* `profile pytorch gpu memory usage`

---

### ۳. بهینه‌سازی سرعت و پرفورمنس پردازش روی CUDA

برای دیدن ترفندهای مهندسی در افزایش سرعت پردازش روی کارت‌های انویدیا:

* `pytorch profiler tutorial`
* `pytorch multi gpu distributed data parallel (DDP) tutorial`
* `pytorch compile benchmark tutorial`

---

### ۴. کانال‌های یوتیوب معتبر و پیشنهادی

این کانال‌ها به‌طور متمرکز آموزش‌های صنعتی و عمیق در زمینه مهندسی MLOps و سخت‌افزار ارائه می‌دهند:

* **Aladdin Persson:** یکی از بهترین منابع برای پیاده‌سازی‌های سطح پایین پایتورچ، DDP و مدیریت دقیق CUDA.
* **Weights & Biases:** ویدیوهای بسیار کاربردی پیرامون دیباگ حافظه GPU و مانیتورینگ بلادرنگ مصرف کارت‌ها.
* **Prompt Engineering / Patrick Loeber:** آموزش‌های سرراست و پروژه-محور برای ترکیب PyTorch با Docker و FastAPI.

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
