#!/bin/bash
$(which jq) \
--arg host ${BYTEBIN_HOST:-0.0.0.0} \
--argjson port ${BYTEBIN_PORT} \
--argjson keyLength ${BYTEBIN_KEY_LENGTH:-7} \
--argjson lifetimeMinutes ${BYTEBIN_LIFETIME_MINUTES:-1440} \
--argjson maxContentLengthMb ${BYTEBIN_MAX_CONTENT_LENGTH_MB:-10} \
'.host = $host | .port = $port | .keyLength = $keyLength | .lifetimeMinutes = $lifetimeMinutes | .maxContentLengthMb = $maxContentLengthMb' <<< '{}' > config.json

exec $(which java) -jar /opt/bytebin/bytebin.jar
