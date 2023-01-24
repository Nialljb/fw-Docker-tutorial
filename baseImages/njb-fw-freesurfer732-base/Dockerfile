# Use the latest Python 3 docker image
FROM freesurfer/freesurfer:7.3.2 as base
 
# Setup environment for Docker image
ENV HOME=/root/
ENV FLYWHEEL="/flywheel/v0"
WORKDIR $FLYWHEEL
RUN mkdir -p $FLYWHEEL/input

# Copy the contents of the directory the Dockerfile is into the working directory of the to be container
COPY ./ $FLYWHEEL/

# Install Dev dependencies (conda, jq, poetry, flywheel installed in base)
# software-properties-common=0.96.20.2-2 && yum install --no-install-recommends -y
RUN yum update -y  && \
    yum clean all && \
    yum update -y && yum install jq -y && \
    yum install -y python3 && yum install -y python3-pip && \
    pip3 install flywheel-gear-toolkit && \
    pip3 install flywheel-sdk && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure entrypoint
RUN bash -c 'chmod +rx $FLYWHEEL/run.py' && \
    bash -c 'chmod +rx $FLYWHEEL/app/'
ENTRYPOINT ["python","/flywheel/v0/run.py"] 
# Flywheel reads the config command over this entrypoint