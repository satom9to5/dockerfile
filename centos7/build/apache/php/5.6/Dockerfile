FROM centos:latest

# install necessary package
RUN yum update -y

# epel 
RUN yum install -y epel-release
# remi
RUN rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# supervisor
RUN yum install -y --enablerepo=epel supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# apache php-fpm
RUN yum install -y --enablerepo=remi,remi-php56 httpd php php-mbstring
COPY httpd.conf /etc/httpd/conf/httpd.conf

CMD ["/usr/bin/supervisord", "-n"]
