FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

VOLUME ["/var/lib/redis"]
RUN ansible-playbook dockerfile.redis.yml

WORKDIR /
EXPOSE 6379
