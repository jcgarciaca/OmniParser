#! /bin/bash
docker run -it --rm --gpus '"device=4,5"' \
    --name OmniParser \
    --net="host" \
    -v $(dirname $(dirname $PWD)):/OmniParser \
    jcgarciaca/OmniParser:latest \
    /bin/bash