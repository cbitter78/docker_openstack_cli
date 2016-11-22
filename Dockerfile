FROM ubuntu:trusty

MAINTAINER Charles Bitter "cbitter78@gmail.com"

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y software-properties-common build-essential git ssh vim curl zip wget

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y python2.7 python2.7-dev libpython2.7-dev libssl-dev libffi-dev

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python2.7
RUN pip install --upgrade pip setuptools virtualenv virtualenvwrapper

RUN pip install 'python-novaclient==2.26.0'
RUN pip install 'python-neutronclient==2.3.4'
RUN pip install 'python-keystoneclient==1.6.0'
RUN pip install 'python-glanceclient==0.19.0'
RUN pip install 'python-swiftclient==2.0.3'
RUN pip install --upgrade ndg-httpsclient
RUN wget -t 3 -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip &&  \
       unzip -d /usr/sbin /tmp/terraform.zip && rm /tmp/terraform.zip

ADD run.sh /run.sh
CMD /run.sh
RUN chmod +x /run.sh
