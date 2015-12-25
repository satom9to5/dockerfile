FROM centos

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# nginx, sshdインストール
RUN yum install -y openssh openssh-client openssh-server nginx haproxy supervisor
RUN yum install -y php php-mysql php-mbstring php-pecl-memcache php-fpm --enablerepo=remi-php55

# ディレクトリ設定
RUN mkdir -p /product/hoge

# supervisord設定
ADD supervisord.conf /etc/supervisord.conf

# nginx設定
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/www.conf /etc/nginx/conf.d/www.conf
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak

# php-fpm設定
ADD php-fpm.conf /etc/php-fpm.conf
ADD php-fpm.d/www.conf /etc/php-fpm.d/www.conf
RUN touch /var/log/php-fpm/www-error.log
RUN chown nginx:nginx /var/log/php-fpm/www-error.log

# sshd設定
RUN echo 'root:root' | chpasswd
RUN ssh-keygen -g -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -g -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key
ADD sshd_config /etc/ssh/sshd_config

# haproxy設定
ADD haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
