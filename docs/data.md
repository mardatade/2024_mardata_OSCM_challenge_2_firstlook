# Data

## Region and time of interest

- region of interest: $lat \in [8N, 20N]$, $lon \in [28W, 12W]$, $2.3\cdot 10^{6} km^2$
- time of interest: $time \in [2005, 2024]$, 20 years, 7300 days

## Volume estimates for gridded products:

- Copernicus ocean color:
  - https://data.marine.copernicus.eu/product/OCEANCOLOUR_GLO_BGC_L4_NRT_009_102/description
  - https://data.marine.copernicus.eu/product/OCEANCOLOUR_GLO_BGC_L4_MY_009_104/description
  - 4kmx4km horizontal resolution
  - 1.2 MB / time step / field
  - daily fields
  - 9 variables
  - 9 GB / 20 years per field
  - 81 GB / 20 years in total

- Copernicus ocean physics:
  - https://data.marine.copernicus.eu/product/GLOBAL_ANALYSISFORECAST_PHY_001_024/description
  - https://data.marine.copernicus.eu/product/GLOBAL_MULTIYEAR_PHY_001_030/description
  - 1/12deg x 1/12deg, 50 vertical levels
  - 10 MB / time step
  - hourly data
  - 6 3D variables
  - 90 GB / year / field
  - 540 GB / year
  - 10 TB / 20 years

- Copernicus ocean bgc:
  - https://data.marine.copernicus.eu/product/GLOBAL_ANALYSISFORECAST_BGC_001_028/description
  - 1/4deg x 1/4deg, 50 vertical levels
  - daily fields
  - 3-4 years of data
  - 13 3D variables
  - 1 MB / time step / field
  - 500 MB / year / field
  - 26 GB / 4 years

## Copernicus

- gridded atmospheric, hydrographic and biogeochemical Copernicus Marine Data
- https://data.marine.copernicus.eu/products
- Parameters
  - observations
    - hydrography (temp, salt, density)
    - sea-surface height
    - currents
    - winds
    - biology (...)
    - chemistry?
  - reanalysis
    - hydrography (temp, salt, density)
    - sea-surface height
    - currents
    - winds
    - biology
    - chemistry

## Others

- hydroacoustic biomass data (XY campaigns)
- bathymetry data
- CVOO time series data (biogeochemical data (ship), currents/temp/sal/o2 (mooring))
- autonomous surface vehicle (Saildrone/Wave Glider) data: temp/sal/bgc
- VIKING20X
- Tropflux or successor?
- Pirata?
- Plankton Image data?
