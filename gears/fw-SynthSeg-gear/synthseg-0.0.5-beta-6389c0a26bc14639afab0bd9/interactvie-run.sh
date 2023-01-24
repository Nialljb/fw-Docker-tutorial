#!/usr/bin/env bash 

IMAGE=flywheel/synthseg:0.0.5-beta

# Command:
docker run -it --rm --entrypoint bash --platform linux/amd64 \
	-v ~/Docker_tutorial/fw-SynthSeg-gear/run.py:/flywheel/v0/run.py \
	-v ~/Docker_tutorial/fw-SynthSeg-gear/app:/flywheel/v0/app \
	-v ~/Docker_tutorial/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/input:/flywheel/v0/input\
	-v ~/Docker_tutorial/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/output:/flywheel/v0/output\
	-v ~/Docker_tutorial/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/work:/flywheel/v0/work\
	-v ~/Docker_tutorial/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/config.json:/flywheel/v0/config.json\
	-v ~/Docker_tutorial/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/manifest.json:/flywheel/v0/manifest.json\
	$IMAGE
