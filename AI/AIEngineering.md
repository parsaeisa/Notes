# AI Engineering

The discipline of transforming **existing foundation models** (LLMs/VLMs) into robust, deterministic, secure, and production-ready software systems **connected to** enterprise data and tools.

Rather than training neural networks from scratch, modern industrial AI Engineering focuses on building the software, context, and orchestration layers around foundation models. It bridges the gap between probabilistic AI behavior and enterprise requirements by leveraging semantic grounding (Knowledge Graphs and ontologies), standardized integration protocols (such as MCP), and cyclic agentic workflows (LangGraph/LlamaIndex) to ensure that AI-driven applications operate reliably and deterministically at scale.

An AI Engineer doesn't train a model from scratch.

New terms:
- Prompt Engineering
- Context Engineering: I think it has Tool calling, MCP and RAG around the prompt engineering
    - Context window
- Agent Harness

## Teminology

- Agent.md
- Skill.md
- MCP: AI agent connecting to data on another server
- A2A: AI agent talking to another AI agent. 
- Sub-agents: Small agents working parallel. We could have many of them. 

<img src="https://github.com/parsaeisa/Notes/blob/main/AI/Image/5%20AI%20terms%20you%20should%20know.png">

### MCP vs RAG vs AI Agent
<img src="https://github.com/parsaeisa/Notes/blob/main/AI/Image/MCP%20vs%20RAG%20vs%20AI%20Agent.png">

| Dimension | AI Agent | Model Context Protocol (MCP) |
| :--- | :--- | :--- |
| **Core Nature** | Autonomous decision-maker & reasoning entity (LLM-driven brain)[cite: 1, 2]. | Open, standardized communication protocol & interface layer (middleware)[cite: 1, 2]. |
| **Primary Role** | Multi-step planning, state management, reflection, and dynamic goal execution[cite: 1, 2]. | Exposing structured tools, resources, and contexts across systems via a universal schema[cite: 1, 2]. |
| **Focus** | **"What"** action to take next based on logic and context[cite: 2]. | **"How"** tools and host applications connect without custom glue code[cite: 1, 2]. |

#### The Driving Analogy

* **The AI Agent is the Driver:** It observes the road, evaluates conditions, plans routes, decides when to accelerate or brake, and navigates obstacles dynamically.
* **MCP is the Cockpit Interface (Steering Wheel, Pedals & Gearbox):** Standardized, uniform mechanical interfaces that connect the driver's intent to the car’s underlying hardware. Regardless of whether the car runs on petrol or electricity, the pedals and steering wheel operate identically, preventing the driver from needing to rewire the engine just to steer.

## MCP

It is a protocol which connects our Agent to different tools and platforms. 

On one side we can have different LLMs such as Claude, Gemini, Chat GPT and on the other side we have different tools such as Github, PostgreSQL, Slack, etc.

You may say why they are not using HTTP to connect to other tools, the answer is HTTP request has so many **irrelevant** parameters but MCP keeps the answer it gets from other places clean and relevant. It gives the LLM all it needs. MCP returns simplified LLM-friendly response:
```
{
  "content": [
    {
      "type": "text",
      "text": "Pod my-app is Running (3/3 containers ready). Node: worker-node-1. Uptime: 2 hours. No restarts."
    }
  ]
}
```

## Tools

LangChain, LlamaIndex: Orchestration Tools
- LlamaIndex: A Data and AI orchestration tool which loads documents (PDFs, Databases), turns them into vectors, indexes them and connects them to LLMs/VLMs.

Evaluation Tools: TruLens & Ragas
Document processing & Conversion: Docling, Marker

Ollama: Deploying tools

## 🤖 Top 5 Industrial AI Agent Archetypes Built by AI Engineers

In enterprise production environments, modern **AI Engineers** focus on architecting agents equipped with multi-step reasoning, tool execution, deterministic constraints, and self-correcting feedback loops.

### 1. Coding, CI/CD & Diagnostic Agents
* Primary Objective: Analyze pull requests, parse pipeline failure logs, identify bug root causes, and automatically generate regression test suites.
* Mechanism: Integrates with version control systems and testing runners via standardized protocols (e.g., Model Context Protocol - MCP), executing local linters, Git commands, and sandbox test executions.
* Common Tech Stack: `Claude Code / Cursor tooling`, `FastMCP`, `LangGraph`, `GitLab/GitHub Actions APIs`.

### 2. Deep Research & Knowledge-Grounded (GraphRAG) Agents
* Primary Objective: Answer complex enterprise queries that require multi-hop querying, cross-source fact verification, and data synthesis.
* Mechanism: Decomposes user queries into sub-tasks, performs multi-stage traversals across Vector Databases and RDF/Ontology Knowledge Graphs (via SPARQL/Neo4j), eliminating hallucinations through deterministic ground truth.
* Common Tech Stack: `LlamaIndex`, `LangGraph`, `Neo4j / GraphDB`, `Chroma / Milvus`, `RDFlib`.

### 3. Text-to-SQL & Data Analytics Agents
* Primary Objective: Translate natural language business questions into executable database queries, validate results, and produce automated insights.
* Mechanism: Inspects database schemas, writes structured queries (SQL/MongoDB Aggregations), runs test executions in isolated sandboxes, and auto-repairs syntax/schema errors based on database feedback.
* Common Tech Stack: `Vanna.ai`, `LangChain (SQLDatabaseToolkit)`, `PostgreSQL`, `ClickHouse`, `Pydantic`.

### 4. Operational Support & Transactional Action Agents
* Primary Objective: Resolve customer and internal requests end-to-end by creating support tickets, modifying orders, and safely triggering transactional operations in enterprise ERP/CRM systems.
* Mechanism: Routes user interactions through deterministic Finite State Machines (FSMs), verifies identity/authorization, and executes secure internal REST/gRPC API calls with strict schema validation.
* Common Tech Stack: `Tool / Function Calling APIs`, `Pydantic (Structured Outputs)`, `REST / gRPC Endpoints`, `OAuth2.0`.

### 5. Multimodal Inspection & Document Triaging Agents
* Primary Objective: Inspect visual engineering documents, invoices, sensor telemetry, and surveillance/drone imagery to extract structured data and trigger automated downstream actions.
* Mechanism: Passes image frames or scanned documents to Vision-Language Models (VLMs), parses text/spatial coordinates (Bounding Boxes), enforces JSON Schema compliance, and updates target databases.
* Common Tech Stack: `Qwen2-VL`, `LLaVA`, `DocVQA pipelines`, `PyTorch`, `FastAPI`.

## ByteByteGo

### Top 12 Agent Skills You Should Know
[ Not investigated completely yet ]
Agent skills are instructions and scripts that teach your LLM agent a new skill. The diagram below shows the 12 most-starred skill repos on GitHub as of August 2026.

* Superpowers (obra/superpowers): This skill makes your agent plan before it writes code.
* skills (mattpocock/skills): Matt Pocock's personal skill set makes your agent challenge your plan first. This is useful as agents can sometimes be too soft.
* andrej-karpathy-skills: Multica AI distilled Karpathy's advice on AI coding pitfalls into one skill.
* everything-claude-code: Skills that help you set up your coding agent. This is useful when you are starting Claude Code from scratch.
* skills (anthropics/skills): This is Anthropic's official skills. It makes your agent capable of creating outputs like Word or PDF files.
* ui-ux-pro-max-skill: This has instructions that teach your agent how to prevent AI-like designs.
* caveman: Julius Brussee's skill makes your agent reply in short caveman speak.
* ponytail: Dietrich Gebert's skill teaches your agent how to write code that is simple and clean.
* agent-skills: Google's Addy Osmani included production-grade engineering practices in a skill
* graphify (safishamsi/graphify): This skill converts a codebase into a knowledge graph, so an agent can navigate easier.
* Understand-Anything: Egonex AI converts a codebase into visual maps to explore.
* impeccable (pbakaus/impeccable): This skill makes an agent better at UI polish.