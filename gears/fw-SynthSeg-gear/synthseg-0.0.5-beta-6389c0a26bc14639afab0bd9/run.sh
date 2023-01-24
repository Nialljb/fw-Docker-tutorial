#!/usr/bin/env bash 

IMAGE=flywheel/synthseg:0.0.5-beta

# Command:
docker run --entrypoint='python3 /flywheel/v0/run.py'\
	-e CONDA_DIR=/opt/conda\
	-e FLYWHEEL=/flywheel/v0\
	-e GPG_KEY=E3FF2839C048B25C084DEBE9B26995E310250568\
	-e LANG=C.UTF-8\
	-e PATH=/usr/local/freesurfer/bin:/usr/local/freesurfer/fsfast/bin:/usr/local/freesurfer/tktools:/usr/local/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\
	-e PYTHON_GET_PIP_SHA256=fa6f3fb93cce234cd4e8dd2beb54a51ab9c247653b52855a48dd44e6b21ff28b\
	-e PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/c20b0cfd643cd4a19246ccf204e2997af70f6b21/public/get-pip.py\
	-e PYTHON_PIP_VERSION=21.2.3\
	-e PYTHON_VERSION=3.8.11\
	-e FREESURFER=/usr/local/freesurfer\
	-e FREESURFER_HOME=/usr/local/freesurfer\
	-e container=oci\
	-v ~/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/input:/flywheel/v0/input\
	-v ~/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/output:/flywheel/v0/output\
	-v ~/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/work:/flywheel/v0/work\
	-v ~/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/config.json:/flywheel/v0/config.json\
	-v ~/synthseg-0.0.5-beta-6389c0a26bc14639afab0bd9/manifest.json:/flywheel/v0/manifest.json\
	$IMAGE
