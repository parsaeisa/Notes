# **N**atural **L**anguage **P**rocessing

New words:
- Sentence splitting
- Inference:
- Knowledge graph: It is a graph which shows the relation between different objects. This is both human-readable and machine-processable.
- Grid search: It's a way for finding the best hyper parameteres.

New methods:
- `compute_class_weights` from `sickit_learn`

## Project steps

These steps are a bit more detailed and that is because they are inspired from an actuall working NLP project. 

- Preprocessing: One thing in this step is somehow like aggregate queries in databases.
- [ pre-training steps described below ]
- Defining model
- Configuring parameters
- Train the model

### Steps before training model

There some steps which can be taken and can be not taken:
- Text Cleaning: Remove unnecessary characters, punctuation, or HTML tags from the text.
- Tokenization: Split text into tokens suitable for input to pre-trained models.
- Padding/Truncation: Adjust sequences to a fixed length by padding or truncating, considering model-specifictoken limits.
- Label Encoding: Convert sub-narratives into multi-hot encoded vectors or numerical representations.
- Handling Imbalanced Data: Compute class weights to address label imbalance during training.
- Train-Validation Split: Split the dataset while ensuring label distribution consistency across subsets.
- Text Augmentation: Introduce variations in text (e.g., synonym replacement) to increase dataset diversity.
- Embedding Preparation (if needed): Generate embeddings using pre-trained models for classical ML methods.
- Normalization: Normalize token embeddings if required by the model or framework.
- Exploratory Data Analysis (EDA): Analyze label co-occurrence, frequency, and input text length distributions.

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
Each model has it's own tokenizer and as you can see it takes a pretrained model as input while initialization.

While tokenizing there are some parameters that we should set:
- Padding

A good practice for tokenizing a dataset ( from dataset package ):
```python
def tokenize_function(examples):
    return tokenizer(examples['Text'], padding="max_length", truncation=True)

tokenized_datasets = hf_dataset.map(tokenize_function, batched=True)
```


## Reducing word variaty

### Stemming

### Lemmatization

Linguistically more accurate than Stemming but more expensive. 

## Famous things

I think it is essential to know two famous things in these groups:
- Powerful pre-trained models. **And** I think we should know famous models for each action. Like tokenizing. 
- Good datasets

### Famous Models

There are some categories. e.g. for binary classification we have:
- BERT-Based Models: `bert-base-uncased`, `roberta-base`, `distilbert-base-uncased`
- Fine-Tuned BERT Variants: `finbert`, `scibert`, `bioBERT`
- Transformer Architectures for Small Datasets: `albert-base-v2`, `distilroberta-base`
- Handling Long Texts: `longformer-base-4096`, `bigbird-roberta-base`
- Models for Imbalanced Data: `xlm-roberta-base`, `deberta-base`
- Lightweight Models for Faster Training: `tiny-bert`, `distilbert-base-uncased`

| Name | Description |
|------|-------------|
| "Qwen/Qwen2.5-0.5B-Instruct" | Recent small GPT-like model |

## Good python libraries

- `datasets`
- `torch`
- `transformers`: Hugging face
- `typing`

Good modules in `transformers`: `AutoModelForSequenceClassification`, `AutoTokenizer`, `DataCollatorWithPadding`, `EvalPrediction`, `Trainer`, `TrainingArguments`

### datasets

```python
from datasets import Dataset
```

Converting a dataframe to a dataset:
```python
# It should have two columns, data and label
hf_dataset = Dataset.from_pandas(df[['Text', 'Binary_Label']])
```

To learn methods:
- `map`: Used in tokenizing

### transformers
Modules:
- TrainingArguments: It gives hyper parameteres to a model
- AutoTokenizer
- AutoModelForSequenceClassification
- Trainer

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

## Strategy

You will hear strategies while learning about NLP projects. Strategies are applied when defining `training_args` (`TrainingArguments`). 

And by strategy they mean what to do with data at each step. 

- `eval_strategy`: At which time slot to evaluate. One example is "epoch", which tells to evaluate at end of each epoch. 
- `warmup_steps`: Warm-up steps for learning rate scheduler.
- `per_device_train_batch_size` & `per_device_eval_batch_size`: For batch size.

They are sometimes related to logging:
- `logging_steps=10`: Log every 10 steps

## Transformers

This image shows a good list of features and abilities of transformers:

<img src="https://github.com/parsaeisa/Notes/blob/main/AI/Image/transformer_features.png" width="800" height="450" >

It has a kind of parallel calculations which lets encoding the relations between all words in a same time.

Transformer has **self-attention** for understanding one sentence and has **Endoder-Decoder attention** for understanding relation between two sentences (Apparently first sentence goes to encoder and second sentence goes to the decoder)
