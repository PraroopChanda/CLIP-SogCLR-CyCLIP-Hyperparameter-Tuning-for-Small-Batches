#!/bin/bash

##NECESSARY JOB SPECIFICATIONS
#SBATCH --time=1:00:00
#SBATCH --mem=40G
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --output=final_eval_clip_adamW.out

#First Executable Line
conda init  
export HF_DATASETS_OFFLINE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
source ~/.bashrc
conda activate myenv
cd ./iSogCLR
echo "Running file"

#export PYTHONPATH="$PYTHONPATH:./bimodal_exps"
#export HUGGINGFACE_HUB_CACHE='./checkpoints/huggingface'

data_path=../datasets
ann_path=../clip_train
train_image_root=cc3m_subset_100k/
data=cc3m
train_file=${data}_train_subset_90.json
gamma=0.8
epochs=30
ita_type=clip

CUDA_VISIBLE_DEVICES=0 python ./iSogCLR/bimodal_exps/clip2.py \
    --data_path ${data_path} \
    --ann_path ${ann_path} \
    --train_file ${train_file} \
    --train_image_root ${train_image_root} \
    --output_dir ../datasets/Besteval/clip_adamW \
    --init_model \
    --use_amp \
    --ita_type ${ita_type} \
    --tau_init 0.01 \
    --sogclr_gamma ${gamma} \
    --eta_init 0.03 --sched cosine \
    --no-distributed \
    --lr 6.732199259338269e-05 \
    --temp 0.06547641559385874 \
    --epochs ${epochs} \
    --evaluate --checkpoint ../datasets/Bestoutput/clip_adamw/checkpoint_26.pth \
    --zs_dataset imagenet --zs_datafolder ../datasets/imagenet/val


