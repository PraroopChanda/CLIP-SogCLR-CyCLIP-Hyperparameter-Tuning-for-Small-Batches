#!/bin/bash
# Template for a standard shell env

#SBATCH --job-name=Myjob
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=8
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=best_clip_adamw.out

conda init  
export HF_DATASETS_OFFLINE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
source ~/.bashrc
conda activate myenv
cd ./iSogCLR
echo "Running file"


python -u ./bimodal_exps/clip1.py \
    --data_path ../datasets \
    --ann_path ../clip_train \
    --train_file cc3m_train_subset_90.json \
    --train_image_root cc3m_subset_100k \
    --output_dir ../datasets/Bestoutput/clip_adamw \
    --init_model \
    --use_amp \
    --ita_type clip \
    --tau_init 0.01 \
    --sogclr_gamma 0.8 \
    --eta_init 0.03 --sched cosine \
    --no-distributed \
    --train_and_val \
    --lr 6.732199259338269e-05 \
    --temp 0.06547641559385874 \
    --epochs 30


 