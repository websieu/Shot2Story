wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x Anaconda3-2023.09-0-Linux-x86_64.sh
./Anaconda3-2023.09-0-Linux-x86_64.sh
git clone https://github.com/websieu/Shot2Story Shot2Story
cd /root/Shot2Story/code
conda init bash
source ~/.bashrc
apt install libopenmpi-dev gcc
apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
conda env update --name shot2story --file conda_env.yml
source activate shot2story && conda env list

pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.0.0/en_core_web_sm-3.0.0-py3-none-any.whl
pip install git+https://github.com/Maluuba/nlg-eval.git@master
pip install -U openmim
mim install mmcv
pip install scenedetect
pip install huggingface_hub

mkdir /root/Shot2Story/code/pretrain && cd /root/Shot2Story/code/pretrain

wget https://huggingface.co/ByteDance-new/shot2story/resolve/main/shot_av_best_epoch.pth
wget https://huggingface.co/ByteDance-new/shot2story/resolve/main/transnetv2-pytorch-weights.pth

cd /root/Shot2Story

git add .
git config --global user.email "raymondt0809@gmail.com"
git config --global user.name "Raymondt"
git config pull.rebase true
git commit -m "a"

huggingface-cli login
cd /root/Shot2Story/code
python demo_video.py