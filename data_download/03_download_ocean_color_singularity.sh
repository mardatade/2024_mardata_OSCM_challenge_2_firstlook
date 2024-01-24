#!/usr/bin/env bash

# load credentials
. "$HOME/.cmems_creds"

# load singularity module
module load gcc12-env
module load singularity

for dataset_id in \
    "cmems_obs-oc_glo_bgc-optics_nrt_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-plankton_nrt_l4-gapfree-multi-4km_P1D" \
    "cmems_obs-oc_glo_bgc-plankton_nrt_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-pp_nrt_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-reflectance_nrt_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-transp_nrt_l4-gapfree-multi-4km_P1D" \
    "cmems_obs-oc_glo_bgc-transp_nrt_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-optics_my_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-plankton_my_l4-gapfree-multi-4km_P1D" \
    "cmems_obs-oc_glo_bgc-plankton_my_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-pp_my_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-reflectance_my_l4-multi-4km_P1M" \
    "cmems_obs-oc_glo_bgc-transp_my_l4-gapfree-multi-4km_P1D" \
    "cmems_obs-oc_glo_bgc-transp_my_l4-multi-4km_P1M" 

do
    echo $dataset_id;

    singularity run \
        --env COPERNICUS_MARINE_SERVICE_USERNAME="$COPERNICUS_MARINE_SERVICE_USERNAME" \
        --env COPERNICUS_MARINE_SERVICE_PASSWORD="$COPERNICUS_MARINE_SERVICE_PASSWORD" \
        -B "$PWD":/work -W /work \
        copernicusmarine_latest.sif \
        subset \
        -o /work/data/ --force-download \
        --minimum-longitude -28.0 --maximum-longitude -12.0 \
        --minimum-latitude 8.0 --maximum-latitude 20.0 \
        --dataset-id "$dataset_id" -f "${dataset_id}.zarr"

done
