docker run --name vllm-inference --runtime nvidia --gpus "device=0"  \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    -v ./chat_templates:/root/chat_templates \
    --env "HUGGING_FACE_HUB_TOKEN=<YOUR_TOKEN>" \
    -p 7000:7000 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model meta-llama/Meta-Llama-3-8B-Instruct \
    --served-model-name llama-3-8b-instruct \
    --port 7000

    # --chat-template /root/chat_templates/tool_chat_template_llama3.1_json.jinja \
