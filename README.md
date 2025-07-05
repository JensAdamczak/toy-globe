# toy-globe

## Step 1: Data preparation

### Get data
Topgraphy: [NASA topography data](https://neo.gsfc.nasa.gov/view.php?datasetId=SRTM_RAMP2_TOPO)

NASA blue marbel images (360x180px): [NASA blue marbel](https://neo.gsfc.nasa.gov/view.php?datasetId=BlueMarbleNG)

### Prepapre csv for Blender
[R script](globes_data_preparation.R) to prepare table with height, lat, lon, and r/g/b values for Blender.


## Step 2: Blender globe video
Import globe_data.csv from Step 1 into Blender via the Spreadsheet Data Importer.

```
Import-Export: Spreadsheet Data Importer
File > Import > Spreadsheet Import (.csv, .json)
Add Field Names and data types
```

Create rotating globe animation with geometry nodes.

## Step 3: Garageband soundtrack
Music generated with midi keyboard in Garageband.

## Step 4: Finalize in Davinci Resolve.
Create final video with Davinci Resolve.

