FROM python:3.8-slim-buster


LABEL maintainer="Vikas Jha <vikasjhanitk@gmail.com>"
LABEL description="Dockerfile for Assignment 6"

WORKDIR /workspace

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install \
    torch==1.13.1+cpu \
    torchvision==0.14.1+cpu \
    torchaudio==0.13.1 \
    -f https://download.pytorch.org/whl/torch_stable.html \
    && rm -rf /root/.cache/pip

RUN pip install -e .