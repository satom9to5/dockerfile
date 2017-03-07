FROM satom9to5/supervisor

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.fluentd.yml

WORKDIR /
EXPOSE 24224
