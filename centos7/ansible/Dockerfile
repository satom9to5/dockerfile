FROM centos:7.2.1511

RUN yum update -y 

# epel
RUN yum install -y epel-release

RUN yum install -y wget curl git unzip gcc make

ENV ANSIBLE_VERSION 2.0.1.0
ENV ANSIBLE_FULLNAME ansible-${ANSIBLE_VERSION}

RUN yum install -y python-pip python-devel

RUN wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/ \
    && tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/ \
    && pip install /tmp/${ANSIBLE_FULLNAME} \
    && rm -rf /tmp/${ANSIBLE_FULLNAME}

RUN mkdir -p /etc/ansible \
    && echo "localhost" > /etc/ansible/hosts
