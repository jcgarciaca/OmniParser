FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-devel

ENV TZ="America/Bogota"
ARG DEBIAN_FRONTEND=noninteractive
RUN python -m pip install -U pip

RUN apt-get update \
    && apt-get install -y nano screen ffmpeg libsm6 libxext6 git-all \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/jcgarciaca/OmniParser.git && \
    cd OmniParser && \
    pip install -r requirements.txt

RUN for f in icon_detect/{train_args.yaml,model.pt,model.yaml} icon_caption/{config.json,generation_config.json,model.safetensors}; do huggingface-cli download microsoft/OmniParser-v2.0 "$f" --local-dir weights; done && \
    mv weights/icon_caption weights/icon_caption_florence

WORKDIR /OmniParser