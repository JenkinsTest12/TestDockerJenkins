FROM base/image
MAINTAINER John Smith <john.smith@example.com>

ADD ./entrypoint.sh ./srv/entrypoint.sh
ADD ../../app ./srv/S
CMD ["sh", "./srv/entrypoint.sh"]

# start supervisor to run our wsgi server
CMD cd /opt/app/ && /opt/venv/bin/python app.py

EXPOSE 5000
