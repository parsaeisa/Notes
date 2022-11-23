# SK learn

You can split you data set to train data and test data very easily with method **model_selection.train_test_split** . 

```python
from sklearn.model_selection import train_test_split

x_train, x_test, y_train, y_test = train_test_split(sgx, sgy, test_size=0.33)
```