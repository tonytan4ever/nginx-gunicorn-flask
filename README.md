## nginx-gunicorn-flask

This repository contains files necessary for building a Docker image of
Nginx + Gunicorn + Flask.


### Base Docker Image

* [ubuntu:latest](https://registry.hub.docker.com/_/ubuntu/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/danriti/nginx-gunicorn-flask/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

```bash
docker pull tonytan4ever/nginx-gunicorn-ubuntu-python3-latest
```


### Usage

```bash
docker run -d -p 8001:80 tonytan4ever/nginx-gunicorn-ubuntu-python3-latest
```

After few seconds, open `http://<host>` to see the Flask app.
