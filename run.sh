#!/bin/sh

cp /config/* /runningconfig/

radiusd -x -d /runningconfig -sfl stdout
