FROM centos

# sshdインストール
RUN yum install -y openssh openssh-server

# sshd設定
RUN sed -ri 's|^#PermitEmptyPasswords no|PermitEmptyPasswords yes|g' /etc/ssh/sshd_config
RUN sed -ri 's|^#PermitRootLogin yes|PermitRootLogin yes|g' /etc/ssh/sshd_config
RUN sed -ri 's|^UsePAM yes|UsePAM no|g' /etc/ssh/sshd_config

# 空パスワード設定
RUN passwd -d root

# コンテナ起動時sshd起動設定
RUN echo "start on startup" > /etc/init/sshd.conf
RUN echo "respawn" >> /etc/init/sshd.conf
RUN echo "exec /sbin/service sshd start" >> /etc/init/sshd.conf

# MariaDBインストール
RUN echo "[mariadb]" > /etc/yum.repos.d/mariadb.repo
RUN echo "name = MariaDB" >> /etc/yum.repos.d/mariadb.repo
RUN echo "baseurl = http://yum.mariadb.org/10.0/centos6-amd64" >> /etc/yum.repos.d/mariadb.repo
RUN echo "gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB " >> /etc/yum.repos.d/mariadb.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/mariadb.repo

RUN yum install -y MariaDB-client MariaDB-server

# コンテナ起動時sshd起動設定
RUN echo "start on startup" > /etc/init/mariadb.conf
RUN echo "respawn" >> /etc/init/mariadb.conf
RUN echo "exec /sbin/service mysql start" >> /etc/init/mariadb.conf

EXPOSE 22 3306

ENTRYPOINT ["/sbin/init"] 
