# LlamaIndex

It's a python open source library which sits between our files (data) and a foundation model (such as VLM/LLM).

### Core Index Peers in the LlamaIndex Hierarchy

* **`PropertyGraphIndex` (Modern Graph Peer):**
The successor to `KnowledgeGraphIndex`. Implements a Labeled Property Graph (LPG) model that supports rich node/edge metadata alongside native hybrid search (graph traversal + vector embeddings + text search).
* **`VectorStoreIndex` (Dense Semantic Peer):**
Maps document chunks into high-dimensional vector spaces for semantic similarity matching (e.g., cosine similarity). Lacks explicit relational reasoning.
* **`TreeIndex` & `SummaryIndex` (Hierarchical/Sequential Peers):**
    * `TreeIndex`: Aggregates text into a hierarchical tree of summaries for top-down thematic queries.
    * `SummaryIndex`: Stores documents as a flat sequence; ideal for global document summarization tasks.

* **`DocumentSummaryIndex` & `KeywordTableIndex` (Document-Level/Lexical Peers):**
    * `DocumentSummaryIndex`: Indexes LLM-generated summaries for individual documents to route queries efficiently before retrieving full text.
    * `KeywordTableIndex`: Relies on inverted keyword tables for sparse, non-semantic lexical retrieval.

### `KnowledgeGraphIndex` in LlamaIndex

`KnowledgeGraphIndex` builds a structured knowledge representation by extracting RDF-style triplets ($Subject \rightarrow Predicate \rightarrow Object$) from raw text via an LLM.

* **Extraction:** Chunks text and prompts an LLM to identify entities and directional relations.
* **Storage:** Persists discrete relational triplets in memory or dedicated graph databases (e.g., Neo4j, Nebulagraph).
* **Retrieval:** Extracts entities/keywords from user queries, maps them to corresponding nodes, and traverses connected subgraphs ($k$-hop paths) to synthesize grounded context.
