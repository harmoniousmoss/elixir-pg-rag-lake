# Simple Datalake for AI RAG Knowledge Base

A **Phoenix/Elixir** backend to ingest, store, index, and query documents for Retrieval-Augmented Generation (RAG).  
It uses PostgreSQL with the **pgvector** extension for vector storage, and integrates with Google’s Gemma open models to generate embeddings and answers.

---

## 🚀 Features

- **Document Ingestion**  
  Upload PDF, DOCX, TXT, or other structured files and extract text.
- **Embedding Generation**  
  Call Google’s Gemma open models to vectorize document chunks.
- **Vector Storage**  
  Store and index embeddings in Postgres via the `pgvector` extension.
- **RAG Search API**  
  Query your knowledge base and return top-k relevant document snippets.
- **User Management**  
  UUID-based users, secure password hashing (Bcrypt), roles (`admin`, `editor`, `viewer`).
- **JSON-only API**  
  No HTML or frontend—perfect as a microservice or to plug into any client.

---

## 🛠 Tech Stack

- **Language & Framework**: Elixir 1.15+, Phoenix 1.7  
- **Database**: PostgreSQL 14+ with pgvector  
- **ORM**: Ecto  
- **Vector Extension**: [`pgvector`](https://github.com/pgvector/pgvector)  
- **Embedding & LLM**: Google Gemma open models  
- **Auth**: Bcrypt (via `bcrypt_elixir`), UUID primary keys  

---

## ⚙️ Prerequisites

- Elixir & Erlang/OTP installed  
- PostgreSQL 14+  
- `pgvector` extension installed in your Postgres  
- Access to Google Gemma models (API credentials or local runtime)  
- (Optional) Docker & Docker Compose for local dev  

---

## ✅ To-Do

- [x] Initialize Phoenix project with `--no-html --no-assets --binary-id`  
- [x] Configure `config/dev.exs` for Docker Postgres + pgvector  
- [ ] Create `users` schema, migration & registration API  
- [ ] Implement document ingestion endpoint (`/api/documents`)  
- [ ] Wire up Gemma embedding integration (vector/ directory)  
- [ ] Build RAG search endpoint (`/api/search`)  
- [ ] Add background jobs (Oban) for ingestion & embeddings  
- [ ] Integrate JWT authentication (Guardian/Pow)  
- [ ] Enforce role-based access control on API routes  
- [ ] Provide Docker Compose for full local dev stack
