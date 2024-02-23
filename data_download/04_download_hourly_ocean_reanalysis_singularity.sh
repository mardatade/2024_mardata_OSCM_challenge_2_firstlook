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
    copernicusmarine_latest.sif subset \
    -o /work/data/ --force-download \
    --start-datetime 2020-01-01 \
    --minimum-longitude -28.0 --maximum-longitude -12.0 \
    --minimum-latitude 8.0 --maximum-latitude 20.0 \
    --dataset-id mems_mod_glo_phy_my_0.083deg_P1D-m \
    -f "mems_mod_glo_phy_my_0.083deg_P1D-m.zarr"
