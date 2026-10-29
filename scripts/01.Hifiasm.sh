#!/bin/bash
#SBATCH --job-name=echlr_hifiasm
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=48gb
#SBATCH --time=10:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dgagler@amnh.org 
#SBATCH --output=logs/slurm-%x_%j.out
#SBATCH --error=errs/slurm-%x_%j.err

# source and activate conda environment
source /nas4/dgagler/conda/etc/profile.d/conda.sh
conda activate genome_assembly

# set variables and create results dir
cd "$SLURM_SUBMIT_DIR"
name="Elysia_chlorotica"
mkdir -p results

# run hifiasm
hifiasm -o results/${name}.asm -t ${SLURM_CPUS_PER_TASK} raw_data/ECAP-11.hifi_reads.bam
