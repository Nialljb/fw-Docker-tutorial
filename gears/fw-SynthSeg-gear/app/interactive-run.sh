#!/usr/bin/env bash 

IMAGE=flywheel/ciso:0.0.8-beta

# Command:
docker run -it --rm --entrypoint bash \
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/run.py:/flywheel/v0/run.py\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/app:/flywheel/v0/app\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/ciso-0.0.8-beta-63853b1039140cea3fab0bdd/input:/flywheel/v0/input\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/ciso-0.0.8-beta-63853b1039140cea3fab0bdd/output:/flywheel/v0/output\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/ciso-0.0.8-beta-63853b1039140cea3fab0bdd/work:/flywheel/v0/work\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/ciso-0.0.8-beta-63853b1039140cea3fab0bdd/config.json:/flywheel/v0/config.json\
	-v /Users/nbourke/GD/scratch/fw-gears/ciso-0.0.9/ciso-0.0.8-beta-63853b1039140cea3fab0bdd/manifest.json:/flywheel/v0/manifest.json\
	$IMAGE
