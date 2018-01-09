FROM node:8.8.1

ENV METEOR_VERSION=1.6.0.1
ENV LC_ALL=POSIX

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
        curl \
        g++ \
        make \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER node

RUN curl "https://install.meteor.com/?release=${METEOR_VERSION}" | /bin/sh

ENV PATH=$PATH:/home/node/.meteor

WORKDIR /app

ENTRYPOINT ["meteor"]
