# Base image for Freesurfer on Flywheel

The folder name should match the name of the Docker image
- Inside the folder you need to have a Dockerfile
- Any input you require building the image

The Dockerfile is the set of instructions for building an image
- This includes the base OS or a previously built image
    - Here we are taking an Image built by FreeSurfer that satisfies all the requirements to run the software
    - The advantage is that this makes the process easier and confident all the FreeSurfer dependencies are satisfied. The disadvantage is this is not lightweight. It contains the whole package which is quite large rather than the sepcific tools for the workflow. 
    - In the simplist form the GO language used in the Dockerfile contains some basic commands that go infront of shell commands (FROM, ENV, RUN, COPY, ENTRYPOINT).

When building a Docker image, run inside directry with Dockerfile and use tags for versioning: 

> docker build -t username/beta:2.0 .
push to Docker Hub
> docker push username/beta:2.0 
