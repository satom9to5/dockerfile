FROM satom9to5/entrykit

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

RUN ansible-playbook docker.nginx.custom.yml

WORKDIR /
EXPOSE 80

CMD ["/usr/bin/supervisord", "-n"]
