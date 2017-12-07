#!/bin/bash
. /opt/venv/bin/activate
cd /srv/app/testapp
exec gunicorn --name test \
              --workers 3 \
              --timeout 0 \
              --bind unix:/opt/venv/bin/gunicorn.sock testapp.wsgi:application &
exec service nginx start
#exec service gunicorn start
#exec opt/venv/bin/python srv/app/testapp/manage.py runserver 0.0.0.0:5000

