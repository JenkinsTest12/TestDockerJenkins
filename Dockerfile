FROM ubuntu:14.04
MAINTAINER John Smith <john.smith@example.com>

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
RUN apt-get update --fix-missing

# global installs [applies to all envs!]
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y python-pip python-virtualenv
RUN apt-get install -y nginx

# create a virtual environment and install all depsendecies from pypi
RUN virtualenv /opt/venv
ADD ./requirements.txt /opt/venv/requirements.txt
RUN /opt/venv/bin/pip install -r /opt/venv/requirements.txt

ADD ./entrypoint.sh ./srv/entrypoint.sh
ADD ./app ./srv/app
ADD ./conf/nginx.conf ./etc/nginx
ADD ./conf/gunicorn.conf /etc/init/gunicorn.conf
RUN /opt/venv/bin/pip install -r /srv/app/testapp/requirements.txt
CMD ["sh", "./srv/entrypoint.sh"]

# start supervisor to run our wsgi server
#CMD cd /opt/app/ && /opt/venv/bin/python app.py
EXPOSE 80
