FROM satom9to5/ansible

RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.entrykit.yml

CMD ["/usr/bin/supervisord", "-n"]
