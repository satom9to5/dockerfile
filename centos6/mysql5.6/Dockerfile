FROM centos:6

# epelレポジトリインストール
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

# MySQLインストール
RUN yum install -y mysql mysql-server mysql-utilities

VOLUME /var/lib/mysql5.6:/var/lib/mysql
EXPOSE 3306

ADD startup.sh /startup.sh

ENTRYPOINT ["./startup.sh"]

CMD ["/bin/sh", "/usr/bin/mysqld_safe"]
