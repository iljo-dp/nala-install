#!/bin/bash

echo "deb http://deb.volian.org/volian/ scar main" | tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg

apt update && apt install nala-legacy

nala fetch

echo "alias apt='nala'" >> ~/.config/fish/config.fish
echo "alias apt-get='nala'" >> ~/.config/fish/config.fish

source ~/.config/fish/config.fish
