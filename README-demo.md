# Demo instructions

## Requirements

1. Since it is a RAG app, the model has a RAG prompt, and you have to get at least one document in the DB before using the chat
2. You can find documents in this bucket: <https://eu-west-3.console.aws.amazon.com/s3/buckets/rag-demo-flexai>
3. You need a HF api key
4. It is recommended to clear the chat (using the button below the send message icon) between questions to reset the context and prevent it from overflowing.
5. When you have large documents (> 2 Mo), it is better to import them one by one.

## Example of .env

```bash
$ cat .env
OPENAI_BASE_URL=http://localhost:7000/v1
OPENAI_MODEL=llama-3-8b-instruct
OPENAI_API_KEY=DUMMYDUMMYDUMMYDUMMY1
CUSTOM_OPENAI=true
OPENAI_EMBED_BASE_URL=http://localhost:7001/v1
OPENAI_EMBED_MODEL=llama-embed
OPENAI_EMBED_API_KEY=DUMMYDUMMYDUMMYDUMMY2
CUSTOM_OPENAI_EMBED=true
```

## Start the vLLM instances

Set your HF token in the files bellow before running:

```bash
./vllm-scripts/vllm-inference.sh # inference server running on http://0.0.0.0:7000
./vllm-scripts/vllm-embed.sh # embedding server running on http://0.0.0.0:7001
```

## Dev env

Create your env and activate it

```bash
/usr/bin/python3.11 -m venv venv
source venv/bin/activate
```

Run your dev env with:

```bash
./start-dev-env.sh
```
