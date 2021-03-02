.PHONY:

build:
	docker build . -t gdal -f Dockerfile

run:
	docker run --rm -p 8888:8888 --name gdal --mount "type=bind,source=${PWD}/.,target=/code" gdal

bash:
	docker exec -it gdal bash

postgis:
	docker run --rm --name postgis -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgis/postgis
