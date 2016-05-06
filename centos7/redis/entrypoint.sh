#!/bin/bash

REDIS_DIR=${REDIS_DIR:-/var/lib/redis}

chown -R redis:redis ${REDIS_DIR}

/usr/bin/supervisord -n 
