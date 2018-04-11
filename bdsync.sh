#!/bin/sh
cd /down/bypy
while true
do
    bypy syncdown
    # date >> /test.log
    sleep 30
done
