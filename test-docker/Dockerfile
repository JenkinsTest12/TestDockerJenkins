FROM base/image
MAINTAINER John Smith <john.smith@example.com>

ADD ./entrypoint.sh ./srv/entrypoint.sh
ADD ./app ./srv/app
ADD ./conf/nginx.conf ./etc/nginx
ADD ./conf/gunicorn.conf /etc/init/gunicorn.conf
RUN /opt/venv/bin/pip install -r /srv/app/testapp/requirements.txt
CMD ["sh", "./srv/entrypoint.sh"]

# start supervisor to run our wsgi server
#CMD cd /opt/app/ && /opt/venv/bin/python app.py

EXPOSE 5000
