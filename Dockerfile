FROM alpine:3.9

LABEL maintainer="chris.rohrer@ubuntunet.net"

WORKDIR /radius

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-radclient && \
    rm /var/cache/apk/*

VOLUME ["/config"]

CMD "chmod 0640 /config"
CMD "chmod 0640 /config/*"

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-d", "/config", "-sfl", "stdout"]
