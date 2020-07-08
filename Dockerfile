FROM alpine:3.9

WORKDIR /radius

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-radclient && \
    apt-get install -y && \
    rm /var/cache/apk/*

VOLUME ["/config"]

RUN mkdir /runningconfig

RUN curl https://raw.githubusercontent.com/thomasma13/freeradius_docker/master/run.sh --output /run.sh

RUN chmod -x /run.sh

EXPOSE 1812/udp 1813/udp

CMD ["/run.sh"]
