FROM centos:6

# epelレポジトリインストール
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# MySQLインストール
RUN yum install -y mysql mysql-server 

EXPOSE 3306

ENTRYPOINT ["/bin/bash"] 
