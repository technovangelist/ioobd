#!/bin/bash

# Array of lines to add to .bashrc
lines_to_add=(
    "alias ollama='~/ollama/ollama'"
    "alias la='ls -la'"
    "export EDITOR=vim"
    # Add more lines as needed
)

# Path to the .bashrc file
bashrc_file="$HOME/.bashrc"

# Function to add a line if it doesn't exist
add_line() {
    if ! grep -Fxq "$1" "$bashrc_file"; then
        echo "$1" >> "$bashrc_file"
        echo "Added: $1"
    else
        echo "Already exists: $1"
    fi
}

# Add each line
for line in "${lines_to_add[@]}"; do
    add_line "$line"
done

echo "Process completed."
echo "Remember to run 'source ~/.bashrc' to apply changes"


sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go -y

(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

wget -o image1 https://cdn.britannica.com/47/188747-050-1D34E743/Bill-Gates-2011.jpg

gh auth login

git clone https://github.com/ollama/ollama.git

cd ollama
gh pr checkout 6963

make -C llama -j 5

go build .

~/ollama/ollama serve &
