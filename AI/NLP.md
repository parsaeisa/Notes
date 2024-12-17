# **N**atural **L**anguage **P**rocessing

New words:
- Sentence splitting

## Reducing word variaty

### Stemming

### Lemmatization

Linguistically more accurate than Stemming but more expensive. 

## Famous pre-trained models

I think it is essential to know powerful famous pre-trained models. **And** I think we should know famous models for each action. Like tokenizing. 

## Metrics

One good library for metrics is `sklearn.metrics`.

There some metrics that give you good insight about data. 

Some of them are based on True/False-Positive/Negative:
- Precision: TP / ( TP + FP ) --> Measures how many of the predicted positive labels are actually correct
- Recall: TP / ( TP + FN ) --> Measures how many of the actual positive labels were correctly predicted
- F1-score: 2 * ( Precision * Recall ) / ( Precission + Recall )

Other ones:
- Accuracy: Correct predictions / Total number of predictions 