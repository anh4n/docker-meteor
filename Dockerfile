FROM node:4.6.2

ENV METEOR_VERSION=1.4.2.3
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

VOLUME ["/app"]

ENTRYPOINT ["meteor"]
