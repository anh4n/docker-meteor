FROM node:4.6.2

ENV LC_ALL=POSIX
ENV METEOR_ALLOW_SUPERUSER=1

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
        curl \
        g++ \
        make \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl "https://install.meteor.com/" | /bin/sh

ENV PATH=$PATH:/root/.meteor

WORKDIR /app

VOLUME ["/app"]

ENTRYPOINT ["meteor"]