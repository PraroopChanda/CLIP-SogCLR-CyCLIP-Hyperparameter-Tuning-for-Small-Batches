#!/bin/bash
# Template for a standard shell env

#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=8
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=best_cyclip_adamw.out

conda init  
export HF_DATASETS_OFFLINE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
source ~/.bashrc
conda activate myenv
cd ./iSogCLR
echo "Running file"


python -u ./iSogCLR/bimodal_exps/clip1.py \
    --data_path ../datasets \
    --ann_path ../clip_train \
    --train_file cc3m_train_subset_90.json \
    --train_image_root cc3m_subset_100k \
    --output_dir ../datasets/Bestoutput/cyclip_adamw \
    --init_model \
    --use_amp \
    --ita_type cyclip \
    --tau_init 0.01 \
    --sogclr_gamma 0.8 \
    --eta_init 0.03 --sched cosine \
    --no-distributed \
    --lr 0.0002828819771699495 \
    --temp 0.01621707878411723 \
    --cylambda_1 0.5940949145191814 \
    --cylambda_2 0.4976852107138287 \
    --epochs 30 \
    --train_and_val 