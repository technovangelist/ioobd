#!/bin/bash

sudo apt update
sudo apt install golang-go -y
cd ~/ollama
gh pr checkout 6963

make -C llama -j 5

go build .

~/ollama/ollama serve &
