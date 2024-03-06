#!/bin/bash
#SBATCH --job-name=download_w_cmems
#SBATCH --ntasks=6
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=36G
#SBATCH --time=24:00:00
#SBATCH --partition=base
#SBATCH --constraint=web

# make sure we have Singularity
module load gcc12-env
module load singularity

seq 1 999 | xargs -P6 -I {} srun --ntasks=1 --exclusive singularity run -B /sfs -B /gxfs_work1 -B $PWD:/work --pwd /work \
       	oscm2024_default_v2024.03.03.1.sif \
	bash -c ". /srv/conda/etc/profile.d/conda.sh && conda activate notebook && ./data_download/download_w_cmems.py --directory /work/data/ --item {}"

# print resource infos
jobinfo
