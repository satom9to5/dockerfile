FROM centos:latest

RUN yum update -y 

RUN    yum install -y epel-release \
    && yum install -y which wget curl git unzip gcc make \
    && yum install -y python python-devel python-pip libffi-devel openssl-devel

RUN pip install --upgrade pip setuptools

ENV ANSIBLE_VERSION 2.0.1.0
ENV ANSIBLE_FULLNAME ansible-${ANSIBLE_VERSION}

RUN wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/ \
    && tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/ \
    && pip install /tmp/${ANSIBLE_FULLNAME} \
    && rm -rf /tmp/${ANSIBLE_FULLNAME}

RUN mkdir -p /etc/ansible \
    && echo "localhost" > /etc/ansible/hosts
