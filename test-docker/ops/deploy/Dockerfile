FROM base/python-base
MAINTAINER John Smith <john.smith@example.com>

# file management, everything after an ADD is uncached, so we do it as late as
# possible in the process.
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ../../app
# restart nginx to load the config
RUN service nginx stop

# start supervisor to run our wsgi server
#CMD supervisord -c /etc/supervisord.conf -n
