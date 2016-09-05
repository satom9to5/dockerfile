FROM supervisor

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

ARG GOPATH=/go
ENV GOPATH ${GOPATH}
ENV PATH ${GOPATH}/bin:/usr/local/go/bin:${PATH}

RUN ansible-playbook -e gopath=${GOPATH} -e supervisor_revel_umask_env=true dockerfile.golang.revel.yml

WORKDIR /
EXPOSE 9000
