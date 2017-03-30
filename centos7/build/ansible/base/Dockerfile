FROM satom9to5/centos_ja

RUN yum update -y

RUN    yum install -y epel-release \
    && yum install -y which wget curl git unzip gcc make \
    && yum install -y python python-devel python-pip libffi-devel openssl-devel \
    && yum install -y sudo \
    && yum clean all

RUN pip install --upgrade pip setuptools

ENV ANSIBLE_VERSION 2.2.1.0
ENV ANSIBLE_FULLNAME ansible-${ANSIBLE_VERSION}

RUN wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/ \
    && tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/ \
    && pip install /tmp/${ANSIBLE_FULLNAME} \
    && rm -rf /tmp/${ANSIBLE_FULLNAME}

RUN grep "^Defaults.*secure_path" /etc/sudoers | sed "s|$|:/usr/local/bin|g" > /etc/sudoers.d/add_secure_path
RUN echo "Defaults:%wheel !requiretty" > /etc/sudoers.d/requiretty

RUN mkdir -p /etc/ansible \
    && echo "localhost" > /etc/ansible/hosts

RUN    useradd docker \
    && echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/docker \
    && git config --global user.email "" \
    && git config --global user.name "" 
USER docker
