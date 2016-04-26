FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

RUN ansible-playbook -e kibana_elasticsearch_host="%(ENV_KIBANA_ELASTICSEARCH_HOST)s" -e kibana_server_basepath="/kibana" dockerfile.kibana.yml

WORKDIR /
EXPOSE 5601
