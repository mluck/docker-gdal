# gdal
Docker container with GDAL and jupyter

Originally forked from [gtalarico/Dockerfile](https://gist.github.com/gtalarico/b6123596a4247a5e6fa5fb92cd675e84)
Docker Jupyter for GIS

## Usage

.PHONY:

build:
	docker build . -t gdal -f Dockerfile

run:
	docker run --rm -p 8888:8888 --name gdal --mount "type=bind,source=${PWD}/.,target=/code" gdal

bash:
	docker exec -it gdal bash

postgis:
	docker run --rm --name postgis -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgis/postgis
