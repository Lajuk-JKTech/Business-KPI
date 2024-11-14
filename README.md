
# 📓 Notebook Guide

This README provides a step-by-step guide on how to set up and run the notebook effectively. Please follow each step to ensure the notebook runs smoothly.

## 🛠️ Prerequisites

- Python 3.x
- Jupyter Notebook or Jupyter Lab
- The necessary Python libraries (install via `pip install -r requirements.txt` if available)
- Access to the PostgreSQL and Neo4j databases

## 🚀 Getting Started

Follow the steps below to configure and execute the notebook.

### Step 1: Update Constants

Before running the notebook, update the **"Constants"** cell with your API keys and database configurations:

```python
# OpenAI API Key
OPENAI_API_KEY = "your_openai_api_key_here"

# PostgreSQL Database Configuration
PG_HOST = "35.224.138.50"
PG_PORT = "5432"
PG_USER = "jktech"
PG_PASSWORD = "123456"
PG_DATABASE = "ekedb"
PG_SCHEMA = "public"

# Neo4j Database Configuration
NEO4J_URL = "neo4j://35.224.138.50:7687"
NEO4J_USERNAME = "neo4j"
NEO4J_PASSWORD = "neo4j@123456"

# SQLAlchemy Database URLs
DATABASE_URL = "postgresql+psycopg2://jktech:123456@35.224.138.50/ekedb"
DATABASE_URL_GLOSSARY_TABLE = "postgresql://jktech:123456@localhost:5432/ekedb"
```

> **Note:** The `DATABASE_URL_GLOSSARY_TABLE` is the URL of the database where the glossary table will be created.

### Step 2: Create Glossary Table and Insert Data

1. Navigate to the section titled **"Glossary Table and Data"** in the notebook.
2. Run all the cells in this section to:
   - Create the glossary table.
   - Insert sample data into the table.
3. After running the cells successfully, **comment out** the following code block to avoid re-inserting the sample data on subsequent runs:

   ```python
   # Run Only Once to insert Dummy data then comment out this line
   insert_glossary_data()
   ```

### Step 3: KPI Functions Usage

To use the KPI functions, go to the **"KPI Functions"** section in the notebook, specifically under **"Database Query"**.

#### Available Function:

```python
get_top_matched_glossary(user_id, question_embedding, top_n=5)
```

**Function Parameters:**
- `user_id`: The ID of the user who created the KPI. Use `"50deb7bb-9f71-4ec8-8fb7-7043ed5d7ab5"` as the fixed user ID for testing.
- `question_embedding`: The embedding vector generated from the question using the `generate_question_embeddings(question)` function.
- `top_n`: The number of top matches to return (default is 5).

**Example Usage:**

```python
user_id = "50deb7bb-9f71-4ec8-8fb7-7043ed5d7ab5"
embedding = generate_question_embeddings("What is the key metric for performance?")
top_matches = get_top_matched_glossary(user_id, embedding, top_n=5)
print(top_matches)
```

### Key Points

1. The extraction database **does not use a vector store** for embeddings. Instead, embeddings are stored as JSON in the database.
2. **Cosine similarity** is computed during retrieval after fetching the embeddings from the database.
3. Use the `generate_question_embeddings(question)` function to create embeddings for comparison against the glossary table.

## 🛠️ Troubleshooting

- Ensure all necessary libraries are installed. If not, use the following command:
  
  ```bash
  pip install -r requirements.txt
  ```

- Verify your database connections using the provided credentials.
- If the sample data is already inserted, make sure to comment out the sample data insertion code to prevent duplicate entries.

## 📖 Additional Notes

- This notebook assumes you have access to the PostgreSQL and Neo4j databases with the given credentials.
- The user ID `"50deb7bb-9f71-4ec8-8fb7-7043ed5d7ab5"` is used throughout the notebook for consistency. Replace it with a valid user ID if needed.

## ✅ Conclusion

You are now ready to run the notebook. Follow the steps above, and you should be able to execute all the cells without any issues. Happy coding! 🚀
