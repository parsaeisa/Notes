# Computer vision

## finding datasets

- Web search engines: https://datasetsearch.research.google.com/
- Dataset catalogues: https://zenodo.org/
- Domain specific: https://www.who.int/data/collections
- Repositories for institutions ( for example Bonn ) : https://bonndata.uni-bonn.de/

## Concepts

- Markov random field
- Max-flow/Min-cut algorithm
- Onboard (Edge Model Compression & Distillation): INT8 Quantization
- Sequence Classification: CLIP, GRU, VideoCLIP, ViT(Vision Transformer)
- Multi-label classification
- ONNX Runtime, TensorRT: For deploying models on a GPU or CPU.

## Usages

- Segmentation
- Denoising
- Energy minimization

## Tools

**Inference & Optimization**

* TensorRT: An NVIDIA software development kit designed to optimize deep learning inference on GPUs via layer fusion, quantization (FP16/INT8), and kernel tuning to achieve maximum throughput and minimal latency.
* ONNX Runtime: A cross-platform accelerator that executes models serialized into the Open Neural Network Exchange (ONNX) format across diverse hardware backends (CPUs, GPUs, edge devices) without relying on Python or native framework runtimes.

**Data Robustness & Augmentation**

* Albumentations: A high-performance Python computer vision library specialized in fast, diverse image augmentations (e.g., lighting variations, geometric shifts, sensor noise) to improve model generalization and robustness against noisy production data.

**Experiment Tracking & Metrics**

* MLflow: An open-source MLOps platform used to systematically track training parameters, evaluation metrics (e.g., loss, mAP, precision, recall), code versions, and final model artifacts throughout development cycles.


* Weights & Biases (W&B): A cloud-native developer platform designed for live tracking of training dynamics, system hardware utilization, dataset versioning, and collaborative metric visualization.

**GPU Hardware & Scaling**

* CUDA: NVIDIA’s parallel computing platform and programming model that allows developers to run matrix operations and deep neural network layers directly on GPU cores.
* Multi-GPU (DDP): Distributed Data Parallel (DDP) is a framework paradigm (built into PyTorch) that shards training batches across multiple GPUs and synchronizes gradients, dramatically cutting training time for large architectures.

**Object Detection & Segmentation**

* YOLOv11: A modern, single-stage real-time object detection architecture optimized for fast inference and high accuracy on embedded and industrial production lines.
* SAM (Segment Anything Model): A foundation segmentation model that produces zero-shot, promptable pixel-level masks for any visual object without prior task-specific fine-tuning.
* Mask R-CNN: A two-stage deep learning architecture that extends Faster R-CNN by adding a pixel-level mask branch alongside bounding-box detection to perform instance segmentation.

**Industrial Anomaly Detection**

* PatchCore: A state-of-the-art visual anomaly detection method that constructs a memory bank of locally aggregated patch features from defect-free training images, identifying defects via nearest-neighbor distance without requiring defective samples during training.
* Anomalib: An open-source deep learning framework designed by Intel specifically for industrial defect detection, providing modular implementations of reference unsupervised anomaly detection algorithms (including PatchCore and Padim) alongside deployment-ready export tools.

**Controllable Image Generation & Generative Vision**

Tools designed for precise structural, text-guided, and geometric conditioning of diffusion and generative models:

* Hugging Face `diffusers`: The standard modular library for building, training, and running diffusion architectures (e.g., Stable Diffusion, SDXL, Flux) with custom pipelines and schedulers.
* ControlNet / T2I-Adapter: Conditioning frameworks that inject explicit spatial controls (e.g., depth maps, edge boundaries, keypoints, segmentation masks) into frozen text-to-image backbones.
* LoRA / PEFT (Parameter-Efficient Fine-Tuning): Lightweight fine-tuning methods allowing quick adaptation of cross-attention and projection layers to isolate specific styles or attributes without training the entire model.
* OpenCLIP / CLIP (ViT): Vision-Language foundational models used to evaluate text-image alignment and extract shared-latent space representations.

**Novel View Synthesis & Domain Adaptation (Fisheye / Multi-View)**

Frameworks for 3D scene reconstruction, novel viewpoint rendering, and handling distorted or unconventional camera optics:

* 3D Gaussian Splatting (3DGS) / `gsplat`: Modern representations providing real-time, differentiable rendering of scenes via explicit 3D Gaussians from multi-view captures.
* Nerfstudio / PyTorch3D: Integrated research toolchains for developing Neural Radiance Fields (NeRFs), managing camera projection rays, and manipulating 3D geometry.
* OpenCV (`cv2.fisheye` module): Core geometric tools for camera calibration, intrinsic/extrinsic parameter extraction, and distortion/undistortion algorithms (e.g., Kannala-Brandt models) bridging perspective and wide-angle domains.
* COLMAP: The reference Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline used to extract precise camera poses and sparse 3D geometry from multi-view image datasets.

**Imaging Factor Disentanglement**
Techniques and toolsets for independently isolating, training, and verifying latent factors (e.g., sensor type, lens characteristics, lighting, domain):

* PyTorch: The primary deep learning framework for designing customized factor-specific loss functions, gradient reversal layers, and learnable embedding spaces.
* Torchvision: Augmentation toolkits used to engineer factor-specific perturbations and data transforms that break cross-factor correlation leakage during evaluation and training.
* Hugging Face `transformers` (Pretrained VLMs): Vision-language backbones (e.g., Qwen-VL, LLaVA) employed as zero-shot evaluators or supervisory discriminators to guide factor alignment across unseen combinations.
* Scikit-learn: General scientific computing utilities used to analyze latent spaces, compute correlation matrices, and benchmark disentanglement metrics (e.g., mutual information, clustering).

## Multi-label Classification

It can be used in Auto-driving. When it wants to understand what is happening. Each data, each frame, can have multiple labels, such as "A kid passed by the street" or "A car turned left". 

### Core Frameworks & Tooling:

* Core Deep Learning Frameworks:
    * **PyTorch (`torch.nn`):** The primary industry and research standard; specifically uses `torch.nn.BCEWithLogitsLoss` (which combines a sigmoid layer with binary cross-entropy per class output) to handle non-mutually exclusive target predictions.
    * **PyTorch Lightning:** Used to build structured, scalable training loops, organize multi-label validation steps, and log per-epoch metrics cleanly.


* Evaluation & Metric Libraries:
    * **TorchMetrics:** Ideal for direct GPU-accelerated multi-label metric computation during training and validation loops.
    * **Scikit-learn (`sklearn.metrics`):** Standard tool for post-training evaluation, computing metrics such as Mean Average Precision (**mAP**), Macro/Micro **F1-Score**, Precision-Recall curves, and **Hamming Loss**.

* Vision Backbones & Sequence Tooling:
    * **Hugging Face Transformers / Timm (`pytorch-image-models`):** Used to load pre-trained vision/multimodal backbones (e.g., CLIP, ViT) and adapt their classification heads for multi-label output dimensions.

##