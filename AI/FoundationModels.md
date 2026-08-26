# Foundation Models

## LLM models
The most well-known and widely used open-source / open-weight Large Language Models (LLMs) in the current market, categorized by organization and use case:

* **Llama Family (Developed by Meta):**
    * **Models:** Llama 3 / Llama 3.1 / Llama 3.3 (available in 8B, 70B, and 405B parameter sizes)
    * **Significance:** Considered the gold standard and benchmark in the open-source community, backed by the largest ecosystem and tool integration support.

* **Qwen Family (Developed by Alibaba):**
    * **Models:** Qwen 2.5 and specialized variants such as Qwen 2.5-Coder
    * **Significance:** Leading in code generation, mathematical reasoning, multilingual support, and ultra-long context windows (up to 128k tokens).

* **DeepSeek Family (Developed by DeepSeek AI):**
    * **Models:** DeepSeek-V3 and the reasoning-focused DeepSeek-R1
    * **Significance:** Highly capable, featuring a cost-effective Mixture-of-Experts (MoE) architecture and deep reasoning capabilities on par with proprietary closed models.

* **Mistral / Mixtral Family (Developed by Mistral AI):**
    * **Models:** Mistral 7B, Mixtral 8x7B / 8x22B, Mistral Large, and Codestral
    * **Significance:** High execution efficiency and an early pioneer in implementing optimized MoE architectures.

* **Gemma Family (Developed by Google):**
    * **Models:** Gemma 2 (in 2B, 9B, and 27B sizes)
    * **Significance:** Lightweight, exceptionally fast, and optimized for local hardware deployments as well as research tasks.

* **Phi Family (Developed by Microsoft):**
    * **Models:** Phi-3 / Phi-3.5 (Mini and Medium editions)
    * **Significance:** Top-tier models in the Small Language Model (SLM) category, trained on curated high-quality synthetic datasets and designed to run smoothly on edge and mobile devices.

## VLM models

Leading Open-Source Vision-Language Models (VLMs)

* Qwen-VL Family (Alibaba):
    * Models: Qwen2-VL, Qwen2.5-VL (2B, 7B, 72B)
    * Significance: Industry benchmark for image understanding, long video processing, native dynamic resolution, and DocVQA.


* LLaVA Family (Community / Open-Source):
    * Models: LLaVA-1.5, LLaVA-NeXT (LLaMA/Mistral/Qwen backbones)
    * Significance: Standard reference architecture for linear MLP projection and academic baselines.


* Pixtral Family (Mistral AI):
    * Models: Pixtral 12B, Pixtral Large
    * Significance: High inference speed, native variable aspect ratios, and efficient multimodal tokenization.


* InternVL Family (OpenGVLab):
    * Models: InternVL 2.0 / 2.5 (1B to 78B)
    * Significance: Top-tier multimodal reasoning and heavy visual task performance across benchmarks.


* PaliGemma Family (Google):
    * Models: PaliGemma 1 / 2 (3B, 10B, 28B; SigLIP + Gemma)
    * Significance: Optimized for foundational tasks including captioning, object detection, and visual question answering.


* SmolVLM / Idefics (Hugging Face):
    * Models: SmolVLM (<3B), Idefics 3
    * Significance: Ultra-lightweight and efficient for local hardware and on-device deployment.

VLM Implementation Complexity for Student & Research Projects:

| Complexity | Models / Scales | Core Hardware & Engineering Constraints |
| --- | --- | --- |
| 🟢 **Low** | **SmolVLM (2B), PaliGemma (3B), Qwen2-VL (2B)** | Consumer-grade hardware (single GPU, 8GB–12GB VRAM, Google Colab), plug-and-play Hugging Face pipelines. |
| 🟡 **Medium** *(Standard for M.Sc. Theses)* | **Qwen2.5-VL (7B), LLaVA-NeXT (7B/13B), Pixtral (12B)** | Requires 16GB–24GB VRAM (RTX 4090/A100) for LoRA/QLoRA fine-tuning; optimal balance between reasoning quality and resource demands. |
| 🔴 **High** | **InternVL (26B/78B), Qwen2-VL (72B), LLaVA-NeXT (70B/110B)** | Requires multi-GPU/cluster setups (multiple A100/H100 nodes), high VRAM, and distributed parallelization configurations. |

### Core Architecture

To work with VLMs, you need to understand how data from two different modalities (image and text) are fused into a shared latent space. The architecture of most VLMs consists of three main components:

* **Vision Encoder:** Networks such as **ViT (Vision Transformer)**, **CLIP**, or **SigLIP** that convert the input image into vector embeddings.
* **LLM Backbone:** Models such as **LLaMA**, **Qwen**, or **Mistral** that handle text processing and reasoning.
* **Connector / Projection Layer:** The layer that maps image embeddings into a feature space intelligible to the LLM. Common techniques include:
    * **MLP Projection:** One or multiple simple linear layers (e.g., the LLaVA architecture).
    * **Cross-Attention / Q-Former:** Cross-attention mechanisms (e.g., BLIP-2 and InstructBLIP).
    * **Perceiver Resampler:** Techniques for compressing the number of visual tokens (e.g., Flamingo).

### Core Tasks & Use Cases

Understanding standard tasks is essential for the evaluation and implementation of VLMs:

* **Visual Question Answering (VQA):** Answering textual questions based on image content.
* **Image Captioning & Description:** Generating accurate textual descriptions for images.
* **Visual Grounding / Object Detection:** Detecting entities and outputting coordinates (Bounding Boxes) in text format.
* **Document AI & OCR:** Extracting text, tables, and diagrams from documents, invoices, and PDF files (DocVQA).
* **Multimodal RAG:** Retrieving and processing textual and visual documents concurrently.

## Finetuning

It is a **counterpart** to GraphRAGs.
PEFT - LORA - QLoRA