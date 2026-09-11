
# Deep learning

the bigger part of my focus in here is about programming . 

### Usefull libraries
* PyTorch 
* Keras
* TensorFlow 

## Concepts

You can see the concepts in 4 different layers. Architectural Hierarchy of Deep Learning & AI Systems:

This mental model organizes the deep learning landscape into a clean four-tier hierarchy, moving from foundational learning theory up to operational system deployment.

### 1. Foundational Layer: Learning Paradigms
* **Core Question:** Under what philosophy and supervisory signal does the model update its weights?
* **Scope:** Finite and categorical (typically 4 to 5 core paradigms).
* **Categories:**
  * **Supervised Learning:** Direct optimization against explicit ground truth targets ($X \rightarrow Y$).
  * **Self-Supervised & Unsupervised Learning:** Deriving supervisory signals intrinsically from raw data (e.g., Autoregressive next-token prediction, Contrastive visual-text alignment, Masked modeling).
  * **Reinforcement Learning (RL):** Dynamic policy optimization via scalar reward/penalty signals from environment feedback (e.g., PPO, DPO, RLHF).
  * **Generative Modeling:** Learning the underlying empirical data distribution ($P(X)$) to synthesize novel samples (e.g., Score-based Diffusion, VAEs, Flow matching).
  * **Hybrid / Symbolic Paradigms:** Integrating gradient-based connectionist networks with deterministic logic rules or knowledge graphs (Neuro-Symbolic AI).

### 2. Intermediate Layer: Model Architectures & Families
* **Core Question:** How are tensors, computational graphs, and mathematical transformations structurally routed?
* **Representative Families:**
  * **Convolutional Networks (CNNs):** Spatial translation invariance and local feature extraction (e.g., ResNet, ConvNeXt, U-Net).
  * **Transformers:** Scalable self-attention mechanisms modeling long-range contextual dependencies across tokens (e.g., ViT, LLaMA, GPT).
  * **Sequential & State-Space Models (SSMs):** Sub-quadratic or recurrence-based temporal processing (e.g., LSTM, GRU, Mamba).
  * **Multimodal Architectures (VLMs):** Projecting distinct visual encoders into autoregressive language backbones via cross-attention or MLP adapters (e.g., LLaVA, Qwen2-VL).
  * **Volumetric & Neural Representations:** Implicit and explicit 3D scene parameters (e.g., 3D Gaussian Splatting, NeRF).

### 3. Mathematical Optimization Layer: Loss Functions & Solvers
* **Core Question:** Which mathematical objective quantifies error, and how do gradient trajectories converge toward an optimum?
* **Components:**
  * **Objective Functions (Losses):** Cross-Entropy, Mean Squared Error (MSE), Contrastive InfoNCE, Focal Loss, Adversarial minimax losses.
  * **Optimization Solvers:** Stochastic Gradient Descent (SGD), AdamW, RMSProp, Adafactor.
  * **Regularization & Numerical Stability:** Normalization layers (LayerNorm, RMSNorm, BatchNorm), Skip/Residual connections, Learning rate scheduling (Cosine decay, Warmup).

### 4. Application & Engineering Layer: Adaptation, Tooling & Systems
* **Core Question:** How are foundation models efficiently adapted, integrated with external enterprise data, and deployed without training from scratch?
* **Components:**
  * **Parameter-Efficient Fine-Tuning (PEFT):** Low-Rank Adaptation (LoRA, QLoRA), Prefix Tuning.
  * **Context Grounding & Data Integration:** Retrieval-Augmented Generation (RAG), GraphRAG, Knowledge Graphs, Semantic Ontologies.
  * **Orchestration & Interoperability:** Agentic state machines (LangGraph), data indexing (LlamaIndex), tool interfaces (Model Context Protocol - MCP).
  * **High-Throughput Serving & Hardware Acceleration:** KV-cache optimization, FlashAttention, TensorRT-LLM, vLLM.

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