FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

VOLUME ["/var/lib/elasticsearch"]
RUN ansible-playbook -e elasticsearch_host=0.0.0.0 dockerfile.elasticsearch.yml

WORKDIR /
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 9200
