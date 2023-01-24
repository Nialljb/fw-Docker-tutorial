# Use the latest Python 3 docker image
FROM nialljb/njb-fw-freesurfer:base as base

# Setup environment for Docker image
ENV HOME=/root/
ENV FLYWHEEL="/flywheel/v0"
WORKDIR $FLYWHEEL
RUN mkdir -p $FLYWHEEL/input

# Copy the contents of the directory the Dockerfile is into the working directory of the to be container
# FreeSurfer licence needs to be in a specific path
COPY ./ $FLYWHEEL/
COPY license.txt /usr/local/freesurfer/.license

# Dev dependencies (python, jq, flywheel installed in base)
# rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN yum update -y && \
    yum install -y unzip gzip wget && \
    yum clean all

RUN pip3 install jsonschema

# setup fs env
ENV PATH /usr/local/freesurfer/bin:/usr/local/freesurfer/fsfast/bin:/usr/local/freesurfer/tktools:/usr/local/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV FREESURFER_HOME /usr/local/freesurfer
ENV FREESURFER /usr/local/freesurfer

# Configure entrypoint
RUN bash -c 'chmod +rx $FLYWHEEL/run.py' && \
    bash -c 'chmod +rx $FLYWHEEL/app/'
ENTRYPOINT ["python3","/flywheel/v0/run.py"] 
# Flywheel reads the config command over this entrypoint