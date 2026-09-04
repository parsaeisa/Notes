# Computer vision

## finding datasets

- Web search engines: https://datasetsearch.research.google.com/
- Dataset catalogues: https://zenodo.org/
- Domain specific: https://www.who.int/data/collections
- Repositories for institutions ( for example Bonn ) : https://bonndata.uni-bonn.de/

## Concepts

- Markov random field
- Max-flow/Min-cut algorithm

## Usages

- Segmentation
- Denoising
- Energy minimization

## Tools
توضیحات کوتاه، فنی و استاندارد به انگلیسی برای هر یک از ابزارها و مفاهیم مشخص‌شده در تصویر:

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