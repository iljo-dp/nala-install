#!/bin/bash

echo "deb http://deb.volian.org/volian/ scar main" | tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg

apt update && apt install nala-legacy

nala fetch

echo 'apt() {
  command nala "$@"
}' >> ~/.config/fish/config.fish

echo 'sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}' >> ~/.config/fish/config.fish
