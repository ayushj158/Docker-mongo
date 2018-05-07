#!/bin/bash
#buildding mongo image
build_return_code = Imagedocker build -t mongo .
if [ "$build_return_code" -eq "0" ]; then
    echo "Mongo image built successfully,creating a container now."
    container_return_code = docker run --name mongo --net forex -dp 27017:27017 -v opt/mongodb:/data/db mongo
	if [ "$container_return_code" -eq "0" ]; then
		echo "Continaer started "
	else
		echo Container start failed"
		exit
	fi
else
	echo "Building image faield."
    exit
fi


