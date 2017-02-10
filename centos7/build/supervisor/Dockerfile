FROM satom9to5/entrykit

WORKDIR /
RUN rm -rf /ansible-playbook && git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.supervisor.yml

CMD ["/usr/bin/supervisord", "-n"]
