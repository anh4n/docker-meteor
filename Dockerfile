FROM node:0.10.43

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl g++ make \
    && apt-get autoclean

RUN curl https://install.meteor.com/ | /bin/sh

WORKDIR /app

VOLUME ["/app"]

ENTRYPOINT ["meteor"]