FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

ARG PJ_NAME=test_pj
ARG PJ_UPSTREAM_HOSTNUM=0

RUN ansible-playbook -e pj_name=${PJ_NAME} -e nginx_pj_upstream_hostnum=${PJ_UPSTREAM_HOSTNUM} dockerfile.nginx.develop_golang.yml

WORKDIR /
EXPOSE 80
