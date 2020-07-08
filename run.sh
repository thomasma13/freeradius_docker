#!/bin/sh

cp /config/* /runningconfig/

cp /config/clients.conf /etc/raddb/clients.conf
cp /config/users /etc/raddb/mods-config/files/authorize

radiusd -x -sfl stdout
