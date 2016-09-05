FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

ARG APP_NAME=test_app

RUN ansible-playbook -e app_name=${APP_NAME} dockerfile.fluentd.forward.app_to_elasticsearch.yml

WORKDIR /
EXPOSE 24224
