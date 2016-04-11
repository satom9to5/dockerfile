FROM centos:7.2.1511

RUN yum update -y \
    && yum install -y wget git

ENV GO_VERSION 1.6
ENV GO_DOWNLOAD_URL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz

RUN wget "${GO_DOWNLOAD_URL}" -O /tmp/golang.tar.gz \
    && tar -C /usr/local/ -xzf /tmp/golang.tar.gz \
    && rm -f /tmp/golang.tar.gz

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:/usr/local/go/bin:${PATH}

RUN mkdir -p "${GOPATH}/src" "${GOPATH}/bin"
WORKDIR ${TOPATH}
