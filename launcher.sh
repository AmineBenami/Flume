#!/bin/bash

if [ ! -f "${FLUME_CONF_DIR}" ]
then
    FLUME_CONF_DIR=/data/config/
fi

FLUME_CONF_FILE=${FLUME_CONF_DIR}/flume.conf

if [ ! -f "${FLUME_CONF_FILE}" ]
then
    echo "Shall mount Flume config directory";  exit 1;
fi

if [ -z "$AGENT_NAME" ]
then
    AGENT_NAME="docker"
fi

if [ -z "$OPTIONS" ]
then
    OPTIONS="-Dflume.root.logger=INFO,console"
fi

${FLUME_HOME}/bin/flume-ng agent \
  -c ${FLUME_HOME}/conf/ \
  -f ${FLUME_CONF_FILE} \
  -n ${AGENT_NAME} \
  $OPTIONS &
tail -f /dev/null

