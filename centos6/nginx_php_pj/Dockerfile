FROM centos:6

RUN yum clean all

# wgetインストール
RUN yum install -y wget

RUN cd /tmp/ && \
wget http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 && \
rpm --import RPM-GPG-KEY-EPEL-6

# yumレポジトリ追加
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Ansibleインストール
RUN yum install -y ansible

# PAM設定変更
RUN sed -i 's|^\(session.*required.*pam_limits.so.*\)|#\1|g' /etc/pam.d/runuser

# ポートフォワーディング設定
EXPOSE 80

# Ansibleインベントリファイルコピー
COPY docker_local /etc/ansible/docker
RUN chmod -x /etc/ansible/docker

CMD ["/bin/bash"]
