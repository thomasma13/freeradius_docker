FROM alpine:3.9

LABEL maintainer="chris.rohrer@ubuntunet.net"

WORKDIR /radius

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-radclient && \
    rm /var/cache/apk/*

VOLUME ["/config"]

RUN mkdir /runningconfig

CMD "cp /config/* /runningconfig/"

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-d", "/runningconfig", "-sfl", "stdout"]
