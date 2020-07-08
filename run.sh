#!/bin/sh

cp /config/* /runningconfig/

cp /config/clients.conf /etc/raddb/clients.conf
cp /config/users /etc/raddb/users

radiusd -x -sfl stdout
