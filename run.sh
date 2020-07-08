#!/bin/sh

cp /config/* /runningconfig/

radiusd -d /runningconfig -sfl stdout
