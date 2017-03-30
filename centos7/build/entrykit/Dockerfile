FROM satom9to5/ansible

RUN    sudo mkdir /ansible-playbook \
    && sudo chown docker:docker /ansible-playbook
WORKDIR /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook \
    && git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.entrykit.yml

CMD ["/usr/bin/supervisord", "-n"]
