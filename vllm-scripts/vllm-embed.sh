docker run --name vllm-embed --runtime nvidia --gpus "device=1" \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    -v ./chat_templates:/root/chat_templates \
    --env "HUGGING_FACE_HUB_TOKEN=<YOUR_TOKEN>" \
    -p 7001:7001 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model meta-llama/Meta-Llama-3-8B-Instruct \
    --served-model-name llama-embed \
    --task embed \
    --port 7001

    # --chat-template /root/chat_templates/tool_chat_template_llama3.1_json.jinja \
    # --model meta-llama/Meta-Llama-3-8B-Instruct \
    # --model BAAI/bge-base-en-v1.5 \
    # --model BAAI/bge-m3 \
    # --model intfloat/e5-mistral-7b-instruct \
