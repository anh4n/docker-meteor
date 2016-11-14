FROM node:4.6.1

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl g++ make \
    && apt-get autoclean

RUN curl https://install.meteor.com/ | /bin/sh

ENV LC_ALL=POSIX

WORKDIR /app

VOLUME ["/app"]

ENTRYPOINT ["meteor"]