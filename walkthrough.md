# Building a Docker container for Flywheel gear
## Prerequisits: 
Download & setup Docker:
> https://www.docker.com/

Download & setup vscode:
> https://code.visualstudio.com/

- The Docker and GitHub extensions can also be added to vscode  

# 

## The Docker Dashboard

When Docker is running there should be a whale icon on the Mac menu bar. From here you can open the Dashboard or Docker Hub (online).
In the Dashboard you will see tabs for:
1. Containers
2. Images
3. Volumes  

The distinction between an *Image* and a *Container* is simply that a container is an image that is **running**. A feature of containers is that anything generated inside it while running is deleted when it is spun down. In order to retain derivitives or outputs of our container processes we may attach a *Volume*. A volume may be a database that may be dynamically updated. This could be attached to a container that spins up at a set time every day and runs a specific process if new data with a specific tag is identified. Output of this process is pushed back to the volume before the container is spun down. 

*The Dashboard can get messy and to avoid resources being used up unnnessarily it is worth doing a purge of unnused/retired images or containers. 

## Dockerfile (base image)

The Dockerfile is the set of instructions from which an image is built. This starts of with the OS and can be built up with the required packages. There may be multiple layers to an image and the starting point of the image we want to make may build on an exisiting one. For example to build a gear that runs on Flywheel with Freesurfer we can use a prebuilt Freesurfer image. This should contain all the required dependencies for Freesurfer. As we have a specific use case we will want to use this as a new base image that includes additional packages in order to run on Flywheel. Each time we want to build a new analysis gear that uses Freesurfer tools we can start with our pre-made fw-Freesurfer image. 
  

The first line of the Docker file imports a previous image
> FROM freesurfer/freesurfer:7.3.2 as base  

The layers of this prior image can view by cmd+click in the Dockerfile or follow the link below:
https://hub.docker.com/r/freesurfer/freesurfer/

The following lines in the Dockerfile are setting up the enviornment of the to be container
> ENV HOME=/root/  
> ENV FLYWHEEL="/flywheel/v0"  
> WORKDIR $FLYWHEEL  
> RUN mkdir -p $FLYWHEEL/input  

Here we are specifying the home and working directories and making an input directory which is the standard structure for Flywheel gears. 

We will want to copy the contents of the folder the Dockerfile is in when the container is spun up as this contains our algorithm
> COPY ./ $FLYWHEEL/

Next we want to install any addiional dependencies into the enviornment
> RUN yum update -y  && \\  
>    yum clean all && \\  
>    yum update -y && yum install jq -y && \\  
>    yum install -y python3 && yum install -y python3-pip && \\  
>    pip3 install flywheel-gear-toolkit && \\  
>    pip3 install flywheel-sdk && \\  
>    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

For python *poetry* can be used to install a large batch of packages 
https://python-poetry.org/ 

The final thing that is required is to configure the entry point. This is the first script that runs when a Docker container is initialised. 

> RUN bash -c 'chmod +rx $FLYWHEEL/run.py' && \
>    bash -c 'chmod +rx $FLYWHEEL/app/'  
> ENTRYPOINT ["python","/flywheel/v0/run.py"] 

## Building analysis gear

### Contents of a Flywheel gear

- Dockerfile
- Manifest
- run.py
- app
- utils 
- docs
- README 

#### Dockerfile
Set of instructions to build the image. This should be inside a folder with the name of the image to be built. Everything that is required to run the workflow should also be in this folder.  

The Gear Dockerfile pulls the base image we built before and creates a new layer on top of it with the specific requirements for the analysis being run.
- Add Freesurfer licence
- Setup Freesurfer env


#### Manifest
This is a json file with a {key:value} pair format that is used by Flywheel to parse specific configurations for the platform. These range from the versioning (match with Docker image name), citation, to user input options in the web interface. 

#### run.py
This can be a more or less complicated run file. In the simplist form it can be the algorithm you want to run itself or it can be a seperate module. Here it is run as a seperate module the wraps logging around the algorithm/app/analysis to run. This uses Flywheel specific functions to assist with the log files when running gears. 

#### app
This folder contains the algorithm/analysis to run as main.sh/main.py and any additional functions required. If a complex workflow is required subdirectories can be built to stage different elements of the analysis. 

#### utils
Flywheel specific dependencies or third party functions can go in here

#### docs
Everyone likes some light reading

#### README
Ideally provide some informative information to users

## Gear docs
Some documentation is included here on building the container ("Gear") when you are ready to test:
- Compiling/building container
- Pushing to Flywheel 
- Run gear (doesn't matter if it fails)
- Copy job ID and pull (download image as it runs on Flywheel)
- Adjust run script to run interactivly inside the container (mount local scripts - remember containers delete contents when shut down)
- Debug & test


## Common bugs:
- Manifest: error in fw logs  
- Run.py: error in fw logs  
- Algorithm  
    - Path issues: check inside fw job container  
    - Dependencies: works locally but not in container. Check installed in Dockerfile/poetry  
    - Mac M2 & TensorFlow don’t play nice (but will run on Unix).   
