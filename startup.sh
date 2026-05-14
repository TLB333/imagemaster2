#!/bin/bash

COMFYUI=/workspace/runpod-slim/ComfyUI

echo "=== Downloading Z-Image Turbo models ===" 
wget -q --show-progress -O $COMFYUI/models/diffusion_models/z_image_turbo_bf16.safetensors https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors
wget -q --show-progress -O $COMFYUI/models/text_encoders/qwen_3_4b.safetensors https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors
wget -q --show-progress -O $COMFYUI/models/vae/ae.safetensors https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors

echo "=== Downloading Flux Klein models ==="
wget -q --show-progress -O $COMFYUI/models/diffusion_models/flux-2-klein-9b-kv-fp8.safetensors https://huggingface.co/black-forest-labs/FLUX.2-klein-9b-kv-fp8/resolve/main/flux-2-klein-9b-kv-fp8.safetensors
wget -q --show-progress -O $COMFYUI/models/diffusion_models/flux-2-klein-9b.safetensors https://huggingface.co/Comfy-Org/flux2-klein-9B/resolve/main/split_files/diffusion_models/flux-2-klein-9b.safetensors
wget -q --show-progress -O $COMFYUI/models/diffusion_models/flux-2-klein-4b.safetensors https://huggingface.co/Comfy-Org/flux2-klein-4B/resolve/main/split_files/diffusion_models/flux-2-klein-4b.safetensors
wget -q --show-progress -O $COMFYUI/models/text_encoders/qwen_3_8b_fp8mixed.safetensors https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors
wget -q --show-progress -O $COMFYUI/models/vae/flux2-vae.safetensors https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors

echo "=== Downloading Impact Pack models ==="
wget -q --show-progress -O $COMFYUI/models/sams/sam_vit_b_01ec64.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
wget -q --show-progress -O $COMFYUI/models/ultralytics/bbox/face_yolov8m.pt https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt

echo "=== Installing Custom Nodes ==="
cd $COMFYUI/custom_nodes

git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack 2>/dev/null || (cd ComfyUI-Impact-Pack && git pull)
git clone https://github.com/ltdrdata/ComfyUI-Impact-Subpack 2>/dev/null || (cd ComfyUI-Impact-Subpack && git pull)
git clone https://github.com/ClownsharkBatwing/RES4LYF 2>/dev/null || (cd RES4LYF && git pull)
git clone https://github.com/rgthree/rgthree-comfy 2>/dev/null || (cd rgthree-comfy && git pull)
git clone https://github.com/kijai/ComfyUI-KJNodes 2>/dev/null || (cd ComfyUI-KJNodes && git pull)
git clone https://github.com/yolain/ComfyUI-Easy-Use 2>/dev/null || (cd ComfyUI-Easy-Use && git pull)
git clone https://github.com/JPS-GER/ComfyUI_JPS-Nodes 2>/dev/null || (cd ComfyUI_JPS-Nodes && git pull)
git clone https://github.com/comfyanonymous/ComfyUI_UltimateSDUpscale 2>/dev/null || (cd ComfyUI_UltimateSDUpscale && git pull)
git clone https://github.com/cubiq/ComfyUI_essentials 2>/dev/null || (cd ComfyUI_essentials && git pull)

echo "=== Installing pip requirements ==="
cd $COMFYUI/custom_nodes/ComfyUI-Impact-Pack && pip install -r requirements.txt --break-system-packages -q
cd $COMFYUI/custom_nodes/ComfyUI-Impact-Subpack && pip install -r requirements.txt --break-system-packages -q
cd $COMFYUI/custom_nodes/ComfyUI-KJNodes && pip install -r requirements.txt --break-system-packages -q
cd $COMFYUI/custom_nodes/ComfyUI-Easy-Use && pip install -r requirements.txt --break-system-packages -q
cd $COMFYUI/custom_nodes/ComfyUI_essentials && pip install -r requirements.txt --break-system-packages -q

echo "=== Downloading LoRAs from Civitai ==="
wget -q --show-progress "https://civitai.com/api/download/models/2617751?token=4835eb4e6c34cb7d19d7bbf47f167770" -O $COMFYUI/models/loras/Realistic_Snapshot_v5.safetensors
wget -q --show-progress "https://civitai.com/api/download/models/660731?token=4835eb4e6c34cb7d19d7bbf47f167770" -O $COMFYUI/models/loras/Z-TURBO_Photography_35mmPhoto_1536.safetensors
wget -q --show-progress "https://civitai.com/api/download/models/2465980?token=4835eb4e6c34cb7d19d7bbf47f167770" -O $COMFYUI/models/loras/Creating_Realistic_v1.safetensors

echo "=== ALL DONE — Restart ComfyUI now ==="
