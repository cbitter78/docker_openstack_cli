FROM ubuntu:trusty

MAINTAINER Charles Bitter "cbitter78@gmail.com"

# Install base os tools that are needed
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y software-properties-common build-essential git ssh \
                     vim curl wget man psmisc zsh patch mysql-client zip

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y python2.7 python2.7-dev libpython2.7-dev libssl-dev libffi-dev \
                     python-pip python-dev build-essential python-tox

RUN pip install --upgrade pip && pip install --upgrade virtualenv 

RUN pip install 'python-novaclient==2.26.0'
RUN pip install 'python-neutronclient==2.6.0'
RUN pip install --upgrade ndg-httpsclient
RUN wget -t 3 -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip &&  \
       unzip -d /usr/sbin /tmp/terraform.zip && rm /tmp/terraform.zip

CMD /bin/bash
