#!/bin/bash
jq \
--arg host ${BYTEBIN_HOST:-0.0.0.0} \
--argjson port ${BYTEBIN_PORT:-8080} \
'.host = $host | .port = $port' <<< '{}' > config.json

$(which java) -jar /opt/bytebin/bytebin.jar
