FROM node:4.8.4

ENV METEOR_VERSION=1.5.1
ENV LC_ALL=POSIX
ENV METEOR_ALLOW_SUPERUSER=1

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
        curl \
        g++ \
        make \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl "https://install.meteor.com/?release=${METEOR_VERSION}" | /bin/sh

ENV PATH=$PATH:/root/.meteor

WORKDIR /app

ENTRYPOINT ["meteor"]
