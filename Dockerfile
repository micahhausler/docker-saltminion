# Dockerfile for salt-minion
#
# Bootstraps salt into docker container. 

FROM ubuntu:precise

MAINTAINER Micah Hausler "micah.hausler@akimbo.io"

# Add ubuntu universe and salt ppa, then update and install
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:saltstack/salt
RUN apt-get update

RUN apt-get -y install salt-minion

RUN /etc/init.d/salt-minion stop
ADD ./minion /etc/salt/minion
ADD /bootstrap.sh /tmp/bootstrap.sh
RUN chmod 755 /tmp/bootstrap.sh

ENTRYPOINT ["/tmp/bootstrap.sh"]
