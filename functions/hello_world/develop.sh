#!/bin/bash

docker run -it --rm \
    -v "$(pwd)":/workspace \
    -w /workspace \
    hello_world
