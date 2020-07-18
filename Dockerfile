FROM bmoorman/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive
ARG BYTEBIN_PORT=8080

WORKDIR /config

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    jq \
    openjdk-8-jre-headless \
    wget \
 && wget --quiet --directory-prefix /opt/bytebin https://ci.lucko.me/job/bytebin/lastSuccessfulBuild/artifact/target/bytebin.jar \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY bytebin/ /etc/bytebin/

VOLUME /config

EXPOSE ${BYTEBIN_PORT}

CMD ["/etc/bytebin/start.sh"]
