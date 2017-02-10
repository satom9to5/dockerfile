FROM centos:latest

RUN yum update -y 

RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP:jp  
ENV LC_ALL ja_JP.UTF-8 
