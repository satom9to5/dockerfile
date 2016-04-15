FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.elasticsearch.yml
