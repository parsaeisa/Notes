
# Deep learning

the bigger part of my focus in here is about programming . 


### Usefull libraries
* PyTorch 
* Keras
* TensorFlow 

## Deep Learning as a Black Box

### Inputs

Inputs include far more than just raw data; they encompass the data representation, inductive biases, hyperparameter constraints, and resource budgets:

* **Input Data & Ground Truth Targets:**
    * Feature Data ($X$): High-dimensional representations (images, text sequences, audio spectra, point clouds, or tabular embeddings).
    * Supervision Targets ($Y$): Ground truth labels, spatial masks, bounding boxes, or next-token targets used to calculate training error.

* **System & Compute Constraints:**
    * Time and compute budget (wall-clock limits, training epochs).
    * Hardware allocation (number of GPUs, available VRAM, mixed-precision flags like FP16/BF16).

### Inside

* **Hyperparameters (Training Configurations & Inductive Biases):**
    * Optimization rates and schedules (learning rate, momentum, weight decay, warmup steps).
    * Batch size and epoch limits.
    * Structural priors (network depth, hidden dimensions, attention heads, dropout/regularization rates).

* **Objective Function (Loss Criterion):**
    * The mathematical penalty formulation driving gradient updates (e.g., Cross-Entropy, Mean Squared Error, CTC loss).

### Outputs

The outputs go beyond simple accuracy scores and fall into three distinct tiers:

#### A. Artifacts & Mathematical Predictions

* **Optimized Model Weights & Checkpoints:**
    * The serialized state dictionaries (`.pt` or `.bin` files) capturing the learned parameter space.

* **Raw Outputs & Predictions:**
    * Model representations such as unnormalized logits, probability distributions (via Softmax/Sigmoid), segmentation masks, or extracted embedding vectors.

#### B. Task & Learning Performance Metrics

* **Statistical Quality Metrics:**
    * Standard classification scores: Accuracy, Precision, Recall, and F1-score.
    * Task-specific metrics: Mean Average Precision (mAP) for detection, Intersection over Union (IoU) / Dice coefficient for segmentation, and Perplexity / BLEU for language modeling.

* **Generalization Gap:**
    * The delta between training loss/accuracy and validation/test performance (measuring vulnerability to overfitting).

* **Uncertainty & Confidence Calibration:**
    * The reliability of predicted probabilities relative to true empirical error rates (e.g., Expected Calibration Error).

#### C. System & Operational Metrics (Production Feasibility)

* **Inference Latency:** The wall-clock duration required to process a single sample or batch (measured in milliseconds).

* **Throughput:** Volume of data processed per unit of time (e.g., Frames per Second [FPS] or Tokens per Second).

* **Memory Footprint:** VRAM utilization during execution and disk size of the serialized model weights.

* **Out-of-Distribution (OOD) Robustness:** Output stability and resilience against adversarial perturbations, sensor noise, or distribution shifts.