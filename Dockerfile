FROM osgeo/gdal:ubuntu-full-3.1.2

ENV PORT=8888

RUN apt-get update && apt-get install -y \
    python3-pip

RUN python -m pip install \
    gdal \
    geopandas \
    jupyter \
    matplotlib \
    rasterstats \
    rasterio

RUN mkdir data
WORKDIR /data

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
