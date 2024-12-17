# **N**atural **L**anguage **P**rocessing

New words:
- Sentence splitting

## Project components

### Collator

collator organizes and batches data together for training or evaluation. It ensures that the input data (e.g., tokenized text) is properly formatted into consistent tensors of the same size, ready for processing by a model.

It is needed because tokenized sequences vary in length. Possible actions are:
- Padding: Adding characters to beginning and end of words
- Truncation: Removing characters

```python
from transformers import AutoTokenizer, DataCollatorWithPadding

# Load tokenizer
tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")

# Tokenize sample data
texts = ["Hello!", "This is an example.", "Tokenization!"]
tokenized_texts = [tokenizer(text, truncation=True) for text in texts]

# Use a data collator to pad and batch the tokenized data
data_collator = DataCollatorWithPadding(tokenizer=tokenizer)

batch = data_collator(tokenized_texts)

print(batch)
```

`DefaultDataCollator`: Assumes inputs are already padded.

### Tokenization

A tokenizer splits text into smaller units called tokens. Tokens can be characters, words, subwords, characters, or **even sentences**, depending on the tokenizer's **design and purpose**.

Each model has it's own tokenizer.

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



## Reducing word variaty

### Stemming

### Lemmatization

Linguistically more accurate than Stemming but more expensive. 

## Famous things

I think it is essential to know two famous things in these groups:
- Powerful pre-trained models. **And** I think we should know famous models for each action. Like tokenizing. 
- Good datasets

## Good python libraries

- `datasets`
- `torch`
- `transformers`: Hugging face
- `typing`

Good modules in `transformers`: `AutoModelForSequenceClassification`, `AutoTokenizer`, `DataCollatorWithPadding`, `EvalPrediction`, `Trainer`, `TrainingArguments`

### datasets

To learn methods:
- `map`

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

Implementation:
```python
from sklearn.metrics import accuracy_score, precision_recall_fscore_support
def compute_metrics(eval_pred):
    logits, labels = eval_pred
    predictions = logits.argmax(axis=-1)  # Get predicted class
    precision, recall, f1, _ = precision_recall_fscore_support(labels, predictions, average="binary")
    accuracy = accuracy_score(labels, predictions)
    return {
        "accuracy": accuracy,
        "precision": precision,
        "recall": recall,
        "f1": f1,
    }
```

This method, must be passed to a `Trainer` from huggingface library. 