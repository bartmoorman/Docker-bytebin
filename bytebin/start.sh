#!/bin/bash
jq \
--arg host ${BYTEBIN_HOST:-0.0.0.0} \
--argjson port ${BYTEBIN_PORT:-8080} \
--argjson keyLength ${BYTEBIN_KEY_LENGTH:-7} \
--argjson lifetimeMinutes ${BYTEBIN_LIFETIME_MINUTES:-1440} \
--argjson maxContentLengthMb ${BYTEBIN_MAX_CONTENT_LENGTH_MB:-10} \
'.host = $host | .port = $port | .keyLength = $keyLength | .lifetimeMinutes = $lifetimeMinutes | .maxContentLengthMb = $maxContentLengthMb' <<< '{}' > config.json

$(which java) -jar /opt/bytebin/bytebin.jar
