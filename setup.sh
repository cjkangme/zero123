#!/bin/bash

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda.sh
bash $HOME/miniconda.sh -b -p $HOME/miniconda
export PATH=$HOME/miniconda/bin:$PATH
rm $HOME/miniconda.sh

# Create conda environment
conda create -n zero123 python=3.9 -y
source $HOME/miniconda/bin/activate zero123

# Install Python packages
cd $HOME/zero123/zero123
pip install -r requirements.txt
git clone https://github.com/CompVis/taming-transformers.git
pip install -e taming-transformers/
git clone https://github.com/openai/CLIP.git
pip install -e CLIP/

# Download pretrained models
wget https://cv.cs.columbia.edu/zero123/assets/105000.ckpt

# Download Additional models
cd $HOME/zero123/3drec
pip install -r requirements.txt

echo "Conda environment 'zero123' is activated. Ready to use."
