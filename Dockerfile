FROM donbeave/oracle-jdk

MAINTAINER Alexey Zhokhov <alexey@zhokhov.com>

ENV SDKMAN_DIR /usr/local/sdkman

RUN set -x \
    && apt-get update \
    && apt-get install -y unzip --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config

WORKDIR $SDKMAN_DIR

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
