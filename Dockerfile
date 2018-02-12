FROM alpine:3.7

LABEL maintainer="chris.rohrer@ubuntunet.net"

WORKDIR /radius

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-radclient && \
    ## Needed for j2cli
    # apk add --update python-dev python-setuptools && \ 
    rm /var/cache/apk/*

# RUN easy_install j2cli

COPY Radius/mods-config/attr_filter/pre-proxy /etc/raddb/mods-config/attr_filter/pre-proxy
COPY Radius/mods-enabled/f_ticks /etc/raddb/mods-enabled/f_ticks

EXPOSE 1812/udp 1813/udp 

CMD ["radiusd", "-sfx", "-l stdout"]
# CMD ["radiusd", "-X"]
