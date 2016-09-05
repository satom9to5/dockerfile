FROM centos:latest

# install necessary package
RUN    yum update -y \
    && yum install -y wget git unzip

# epel 
RUN yum install -y epel-release
# remi
RUN rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# supervisor
RUN yum install -y --enablerepo=epel supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# nginx
RUN yum install -y --enablerepo=epel nginx
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./wordpress.conf /etc/nginx/conf.d/wordpress.conf

CMD ["/usr/bin/supervisord", "-n"]
