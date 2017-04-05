FROM satom9to5/entrykit

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

VOLUME ["/var/lib/mysql"]
RUN ansible-playbook localhost.supervisor.mysql.yml

WORKDIR /
COPY setup.sh /usr/local/bin/
EXPOSE 3306

ENTRYPOINT [ \
  "prehook", "/usr/local/bin/setup.sh", "--", \
  "prehook", "sudo /usr/bin/supervisord -n" \
]
