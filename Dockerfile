FROM ubuntu:14.04
MAINTAINER Nick

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ansible python-apt

ADD . /srv/

RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common
RUN sudo apt-add-repository ppa:ansible/ansible
RUN sudo apt-get update
RUN sudo apt-get -y install ansible

RUN ansible-playbook -vvvv --inventory-file=/srv/inventory.ini \
   /srv/start.yml -c local

CMD ["chmod", "+x", "/srv/entrypoint.sh"]
CMD ["ls"]
CMD ["sh", "./srv/entrypoint.sh"]
EXPOSE 80 443
