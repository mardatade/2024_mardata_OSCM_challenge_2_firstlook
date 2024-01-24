#!/usr/bin/env bash

# load credentials
. "$HOME/.cmems_creds"

# download
docker run \
    -e COPERNICUS_MARINE_SERVICE_USERNAME \
    -e COPERNICUS_MARINE_SERVICE_PASSWORD \
    -v "$PWD":/work -w /work \
    -it --rm copernicusmarine:latest get \
    -o /work/data/ --force-download \
    --dataset-id cmems_obs-wind_glo_phy_my_l4_P1M
