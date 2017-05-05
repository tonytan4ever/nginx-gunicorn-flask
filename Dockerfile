# nginx-python3-gunicorn-flask-ubuntu-latest

FROM ubuntu:latest
MAINTAINER Tony Tan <tonyta198211n@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python python-pip python3-pip nginx supervisor

RUN pip3 install -U pip virtualenv

# Setup flask application
ENV DEFAULT_PY_ENV /deploy/.virtualenvs/default
RUN mkdir -p /deploy/app
RUN mkdir -p /deploy/.virtualenvs/
# setup python3 virtual environment
RUN virtualenv /deploy/.virtualenvs/default
COPY app /deploy/app
RUN /deploy/.virtualenvs/default/bin/pip install -r /deploy/app/requirements.txt
RUN /deploy/.virtualenvs/default/bin/pip install -U gunicorn

# Setup nginx
RUN rm /etc/nginx/sites-enabled/default
COPY flask.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

# Start processes
CMD ["/usr/bin/supervisord"]
