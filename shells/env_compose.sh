#!/bin/bash

DOCKER_COMPOSE=${DOCKER_COMPOSE:-/usr/local/bin/docker-compose}

COMPOSE_ENV_FILE='./compose.env'
PARAM=''

for OPT in "$@"
do
  case "${OPT}" in
    '-f')
      COMPOSE_ENV_FILE="${2}"
      shift 2
      ;;
    *)
      PARAM=${PARAM}" ${1}"
      shift 1
      ;;
  esac
done

if [ ! -f "${COMPOSE_ENV_FILE}" ]; then
  echo "${COMPOSE_ENV_FILE} is not found!"
  exit 1
fi

echo "$(grep -v '^#' ${COMPOSE_ENV_FILE} | sed 's|#.*$||g' | tr '\n' ' ') ${DOCKER_COMPOSE} ${PARAM}" | bash
