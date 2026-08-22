# Foundation Models

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