## Contents of a Flywheel gear

- Dockerfile
- Manifest
- run.py
- app
- utils 
- docs
- README 

### Dockerfile
Set of instructions to build the image. This should be inside a folder with the name of the image to be built. Everything that is required to run the workflow should also be in this folder.

### Manifest
This is a json file with a {key:value} pair format that is used by Flywheel to parse specific configurations for the platform. These range from the versioning (match with Docker image name), citation, to user input options in the web interface. 

### run.py
This can be a more or less complicated run file. In the simplist form it can be the algorithm you want to run itself or it can be a seperate module. Here it is run as a seperate module the wraps logging around the algorithm/app/analysis to run. This uses Flywheel specific functions to assist with the log files when running gears. 

## app
This folder contains the algorithm/analysis to run as main.sh/main.py and any additional functions required. If a complex workflow is required subdirectories can be built to stage different elements of the analysis. 

## utils
Flywheel specific dependencies or third party functions can go in here

## docs
Everyone likes some light reading

## README
Ideally provide some informative information to users