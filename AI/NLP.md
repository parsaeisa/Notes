# **N**atural **L**anguage **P**rocessing

New words:
- Sentence splitting

## Reducing word variaty

### Stemming

### Lemmatization

Linguistically more accurate than Stemming but more expensive. 

### Tokenization

A tokenizer is a tool or component that splits text into smaller units called tokens. Tokens can be characters, words, subwords, characters, or **even sentences**, depending on the tokenizer's **design and purpose**.

It is used in pipelines in three stages:
- Pre-processing
- Encoding
- Post-processing

Example:
```python
from transformers import AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")

text = "Tokenizers are amazing!"
tokens = tokenizer.tokenize(text)

print(tokens)
# Output: ['token', '##izers', 'are', 'amazing', '!']
```

As you can see it takes a pretrained model as input while initialization.


## Famous things

I think it is essential to know two famous things in these groups:
- Powerful pre-trained models. **And** I think we should know famous models for each action. Like tokenizing. 
- Good datasets

## Good python libraries

- `datasets`
- `torch`
- `transformers`
- `typing`

Good modules in `transformers`: `AutoModelForSequenceClassification`, `AutoTokenizer`, `DataCollatorWithPadding`, `EvalPrediction`, `Trainer`, `TrainingArguments`


## Metrics

One good library for metrics is `sklearn.metrics`.

There some metrics that give you good insight about data. 

Some of them are based on True/False-Positive/Negative:
- Precision: TP / ( TP + FP ) --> Measures how many of the predicted positive labels are actually correct
- Recall: TP / ( TP + FN ) --> Measures how many of the actual positive labels were correctly predicted
- F1-score: 2 * ( Precision * Recall ) / ( Precission + Recall )

Other ones:
- Accuracy: Correct predictions / Total number of predictions 
- ROC-AUC: idk what it is. Is it even a metric ?