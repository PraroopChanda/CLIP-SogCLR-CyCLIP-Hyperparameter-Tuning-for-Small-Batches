#!/bin/bash

##NECESSARY JOB SPECIFICATIONS
#SBATCH --time=1:00:00
#SBATCH --mem=40G
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --output=final_eval_cyclip_nadam.out

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
gamma=0.5390333896985938
epochs=30
ita_type=cyclip

CUDA_VISIBLE_DEVICES=0 python ./iSogCLR/bimodal_exps/clip2.py \
    --data_path ${data_path} \
    --ann_path ${ann_path} \
    --train_file ${train_file} \
    --train_image_root ${train_image_root} \
    --output_dir ../datasets/Besteval/cyclip_nadam \
    --init_model \
    --use_amp \
    --opt nadam \
    --ita_type ${ita_type} \
    --tau_init 0.01 \
    --sogclr_gamma ${gamma} \
    --eta_init 0.03 --sched cosine \
    --no-distributed \
    --lr 0.00012587716005886245 \
    --temp 0.005232218198443648 \
    --cylambda_1 0.45384301584103603 \
    --cylambda_2  0.6589497618647435 \
    --epochs ${epochs} \
    --evaluate --checkpoint ../datasets/Bestoutput/cyclip_nadam/checkpoint_30.pth \
    --zs_dataset imagenet --zs_datafolder ../datasets/imagenet/val
