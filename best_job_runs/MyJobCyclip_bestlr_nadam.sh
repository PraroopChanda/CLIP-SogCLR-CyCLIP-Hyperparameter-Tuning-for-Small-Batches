#!/bin/bash
# Template for a standard shell env

#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=8
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=best_cyclip_nadam.out

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
    --output_dir ../datasets/Bestoutput/cyclip_nadam \
    --init_model \
    --use_amp \
    --ita_type cyclip \
    --tau_init 0.01 \
    --sogclr_gamma 0.8 \
    --eta_init 0.03 --sched cosine \
    --opt nadam \
    --no-distributed \
    --lr  0.00012587716005886245 \
    --temp 0.005232218198443648 \
    --cylambda_1 0.45384301584103603 \
    --cylambda_2 0.6589497618647435 \
    --epochs 30 \
    --train_and_val 