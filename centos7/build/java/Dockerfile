FROM satom9to5/entrykit

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

RUN ansible-playbook localhost.java.yml

WORKDIR /
