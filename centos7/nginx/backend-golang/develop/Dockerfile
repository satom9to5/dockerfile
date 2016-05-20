FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-app-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

ARG APP_NAME=test_app
ARG APP_UPSTREAM_HOSTNUM=0

RUN ansible-playbook -e app_name=${APP_NAME} -e nginx_app_upstream_hostnum=${APP_UPSTREAM_HOSTNUM} dockerfile.nginx.develop_golang.yml

WORKDIR /
EXPOSE 80
