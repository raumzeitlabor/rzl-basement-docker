#!/bin/bash

echo "trying to fetch repository..."
if [ -d rzl-basement ]; then
	echo "repo exists, pulling updates..."
	cd rzl-basement
	git pull
else
	echo "repo doesn't exist, cloning..."
	git clone https://github.com/raumzeitlabor/rzl-basement.git;
	cd rzl-basement
fi

echo "cleaning, running tests and building with leiningen..."
lein clean && lein test && lein uberjar

echo "building docker image..."
cd ..
docker build -t basement .

echo "build script finished"
echo "run with:"
echo "    docker run -p 8080:8080 basement"
