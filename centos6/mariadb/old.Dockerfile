FROM centos

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# MariaDBインストール
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum install -y MariaDB-client MariaDB-server

# supervisor, sshdインストール
RUN yum install -y openssh openssh-client openssh-server supervisor
ADD supervisord.conf /etc/supervisord.conf

# sshd設定
RUN echo 'root:root' | chpasswd
RUN ssh-keygen -g -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -g -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key
ADD sshd_config /etc/ssh/sshd_config

EXPOSE 22 3306 

#CMD ["/usr/bin/supervisord"]
CMD ["/sbin/init"]
