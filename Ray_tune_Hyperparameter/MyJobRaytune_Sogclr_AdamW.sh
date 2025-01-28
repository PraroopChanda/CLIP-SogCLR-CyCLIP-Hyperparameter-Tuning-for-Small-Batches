#!/bin/bash
# Template for a standard shell env

#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=30G
#SBATCH --cpus-per-task=8
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=ray_sogclr_eval_adamw.out 

conda init  
export HF_DATASETS_OFFLINE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
source ~/.bashrc
conda activate myenv
cd ./iSogCLR
echo "Running file"


python -u ./iSogCLR/bimodal_exps/raytune_eval_search.py \
    --data_path ../datasets \
    --ann_path ../clip_train \
    --train_file cc3m_train_subset.json \
    --train_image_root cc3m_subset_100k \
    --output_dir ../dump_temp1/output/clip \
    --init_model \
    --use_amp \
    --ita_type sogclr \
    --tau_init 0.01 \
    --sogclr_gamma 0.8 \
    --eta_init 0.03 --sched cosine \
    --no-distributed \
    --epochs 8 \
    --train_and_val