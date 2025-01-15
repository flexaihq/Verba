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
OPENAI_BASE_URL=https://inference-b2b7913e-79f9-465d-9572-7b6893376b16-0717b173.platform.staging.flexsystems.ai/v1
# OPENAI_MODEL=meta-llama/Meta-Llama-3-8B-Instruct # staging
OPENAI_MODEL=meta-llama/Llama-3.1-8B-Instruct
OPENAI_API_KEY=xxxxxxxx-5d24-4903-bdec-938e9b154370
CUSTOM_OPENAI=true
OPENAI_EMBED_BASE_URL=https://inference-2ea8eeb8-1931-4da6-8ea1-5e67a4e7002d-446f1ee8.platform.staging.flexsystems.ai/v1
# OPENAI_EMBED_MODEL=meta-llama/Meta-Llama-3-8B-Instruct # staging
OPENAI_EMBED_MODEL=meta-llama/Llama-3.1-8B-Instruct
OPENAI_EMBED_API_KEY=xxxxxxxx-be4c-4a81-82bd-ed590ba1a89a
CUSTOM_OPENAI_EMBED=true
DEFAULT_DEPLOYMENT=Local
CHATBOT_PROMPT="You are FlexBot, an assistant for question-answering tasks. Use the following pieces of retrieved context to answer the question. If you don't know the answer, just say that you don't know. Use three sentences maximum and keep the answer concise."
```

## Start the vLLM instances on FCS

### Prod config

```bash
flexai inference serve llama-`uuid` --hf-token-secret GC_HF_TOKEN -- --model=meta-llama/Llama-3.1-8B-Instruct
# flexai inference serve -a 2 llama-`uuid` --hf-token-secret GC_HF_TOKEN -- --model=meta-llama/Llama-3.3-70B-Instruct
flexai inference serve llama-embed-`uuid` --hf-token-secret GC_HF_TOKEN -- --model=mmeta-llama/Llama-3.1-8B-Instruct --task=embed

```

### Staging config

```bash
flexai inference serve llama-`uuid` --hf-token-secret GC_HF_TOKEN -- --model=meta-llama/Meta-Llama-3-8B-Instruct
flexai inference serve llama-embed-`uuid` --hf-token-secret GC_HF_TOKEN -- --model=meta-llama/Meta-Llama-3-8B-Instruct --task=embed

```

## Start the vLLM instances locally

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

Build your dev env with:

```bash
./build-dev-env.sh
```

Run your dev env with:

```bash
./start-dev-env.sh
```
