#!/bin/bash

ELASTICSEARCH_DIR=${ELASTICSEARCH_DIR:-/var/lib/elasticsearch}

chown -R elasticsearch:elasticsearch ${ELASTICSEARCH_DIR}

/usr/bin/supervisord -n 
