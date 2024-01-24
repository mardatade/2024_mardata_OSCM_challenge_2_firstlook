#!/usr/bin/env bash

# load credentials
. "$HOME/.cmems_creds"

# load singularity module
module load gcc12-env
module load singularity

# download
singularity run \
    --env COPERNICUS_MARINE_SERVICE_USERNAME="$COPERNICUS_MARINE_SERVICE_USERNAME" \
    --env COPERNICUS_MARINE_SERVICE_PASSWORD="$COPERNICUS_MARINE_SERVICE_PASSWORD" \
    -B "$PWD":/work -W /work \
    copernicusmarine_latest.sif get \
    -o /work/data/ --force-download \
    --dataset-id cmems_obs-wind_glo_phy_my_l4_P1M
