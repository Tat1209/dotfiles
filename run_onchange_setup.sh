#!/bin/bash
set -e

echo "Updating package lists and installing/updating Git & Neovim..."

sudo apt-get update
sudo apt-get install -y git neovim