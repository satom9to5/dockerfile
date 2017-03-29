FROM satom9to5/java

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

RUN ansible-playbook localhost.embulk.yml
