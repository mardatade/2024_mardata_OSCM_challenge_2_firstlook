#!/usr/bin/env python

import pandas as pd
import numpy as np

import copernicusmarine
from pathlib import Path

import logging
import sys

import click


GOOGLE_URL = (
    "https://docs.google.com/spreadsheets/d/e/"
    "2PACX-1vRc68AJFFw8aLFOcw4sTu6HIFPzSXZ3OlEFFDMZwXHV"
    "-3i-vMOCPutVbNKuDuhY8hpjs8BoU93l8-TR/pub?output=csv"
)


def read_df(google_url):
    # read
    df = pd.read_csv(google_url)
    
    # split the dataset id lists into separate rows
    # (standardise whitespace, split into rows, join back in)
    df = df.set_index(df.index.rename('_id'))
    df = df.join(
        df["Dataset ID(s)"].str.replace("\n", " ")
        .str.split(regex="(\s+)", expand=True)
        .stack(0)
        .rename("Dataset ID")
    )
    df = df.drop(columns=["Dataset ID(s)", ])
    df = df.reset_index(drop=True)
    
    # replace NaNs with Nones for easier fallback to defaults
    df = df.replace(np.nan, None)
    
    return df


def download_with_copernicus(dataset, data_path="."):
    data_path = Path(data_path)
    dowload_path = data_path / dataset.loc["Product ID"]

    try:
        return copernicusmarine.subset(
            dataset_id=dataset.loc["Dataset ID"],
            start_datetime=dataset.loc["start time"],
            minimum_longitude=dataset.loc["lon min"],
            maximum_longitude=dataset.loc["lon max"],
            minimum_latitude=dataset.loc["lat min"],
            maximum_latitude=dataset.loc["lat max"],
            file_format="zarr",
            
            output_directory=dowload_path,
            force_download=True,
        )
    except Exception as e:
        try:
            return copernicusmarine.get(
                dataset_id=dataset.loc["Dataset ID"],
                output_directory=dowload_path,
                # service="original-files",
                force_download=True,
            )
        except Exception as e:
            print(f"Skipping {dataset.loc['Dataset ID']}.")


@click.command()
@click.option('--item', default=1, help='Item to download')
@click.option('--directory', default=".", help="where to store")
def download_nth_item(item, directory):

    logging.basicConfig(
        filename=f'download_log_{item:04d}.log', 
        encoding='utf-8',
        level=logging.DEBUG,
    )
    logging.debug(f'Downloading for {item}.')

    root = logging.getLogger()
    root.setLevel(logging.DEBUG)
    
    handler = logging.StreamHandler(sys.stdout)
    handler.setLevel(logging.INFO)
    # handler.setFormatter(formatter)
    root.addHandler(handler)
    
    df = read_df(google_url=GOOGLE_URL)
    _df = df.iloc[item]
    logging.debug(str(download_with_copernicus(_df, data_path=directory)))

if __name__ == '__main__':
    download_nth_item()
