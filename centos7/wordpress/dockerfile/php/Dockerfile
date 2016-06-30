FROM centos:7.2.1511

# install necessary package
RUN yum update -y \
    && yum install -y wget git unzip

# epel 
RUN yum install -y epel-release
# remi
RUN rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# supervisor
RUN yum install -y --enablerepo=epel supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# php-fpm
RUN yum install -y --enablerepo=epel remi-php70 php70 php70-php-mbstring php70-php-fpm php70-php-mcrypt php70-php-mysqlnd
ADD ./www.conf /etc/opt/remi/php70/php-fpm.d/www.conf
RUN sed -i 's|^daemonize = .*$|daemonize = no|g' /etc/opt/remi/php70/php-fpm.conf
RUN sed -i 's|^expose_php = .*$|expose_php = Off|g' /etc/opt/remi/php70/php.ini

CMD ["/usr/bin/supervisord", "-n"]
