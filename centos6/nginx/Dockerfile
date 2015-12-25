FROM centos

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# nginx, sshdインストール
RUN yum install -y openssh openssh-client openssh-server nginx supervisor

# supervisord設定
ADD supervisord.conf /etc/supervisord.conf

# nginx設定
ADD nginx.conf /etc/nginx/nginx.conf

# sshd設定
RUN echo 'root:root' | chpasswd
RUN ssh-keygen -g -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -g -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key
ADD sshd_config /etc/ssh/sshd_config

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
