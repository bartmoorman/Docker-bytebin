FROM bmoorman/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

ENV BYTEBIN_PORT=8080

WORKDIR /config

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    openjdk-17-jre-headless \
    jq \
    wget \
 && wget --quiet --directory-prefix /opt/bytebin https://ci.lucko.me/job/bytebin/lastSuccessfulBuild/artifact/target/bytebin.jar \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY bytebin/ /etc/bytebin/

VOLUME /config

EXPOSE ${BYTEBIN_PORT}

CMD ["/etc/bytebin/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --insecure --silent --show-error --fail "http://localhost:${BYTEBIN_PORT}/" || exit 1
