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