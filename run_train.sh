#!/bin/bash
#SBATCH -N 1
#SBATCH -p gaia
#SBATCH --gres=gpu:volta:2
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=40
#SBATCH --constraint=xeon-g6
#SBATCH --job-name=ir069imgcomp
#SBATCH --output=%j.log
# Run using sbatch script.sh

SRC_DIR=/home/gridsan/mveillette/sandbox/high-fidelity-generative-compression
cd $SRC_DIR

# warmup run
#/home/gridsan/mveillette/python/miniconda3/envs/imgcomp/bin/python train.py --model_type compression --regime med --n_steps 1e6 --name ir069_med
# Refine run
#/home/gridsan/mveillette/python/miniconda3/envs/imgcomp/bin/python train.py --model_type compression_gan --regime low --n_steps 1e6 --n_epochs 50 --warmstart -ckpt experiments/sevir_compression_2020_09_19_23_41/checkpoints/sevir_compression_2020_09_19_23_41_epoch4_idx12252_2020_09_20_00:31.pt 
/home/gridsan/mveillette/python/miniconda3/envs/imgcomp/bin/python train.py --model_type compression_gan --regime low --n_steps 1e6 --n_epochs 200 --warmstart -ckpt experiments/ir069_med_sevir_compression_2020_10_15_22_32/checkpoints/ir069_med_sevir_compression_2020_10_15_22_32_epoch9_idx30630_2020_10_16_00:36.pt --name ir069_med 
