#!/bin/sh
msg() {
    echo send msg by ifttt: $*
    curl -X POST -H "Content-Type: application/json" -d '{"value1":"'"$*"'"}' https://maker.ifttt.com/trigger/message/with/key/b2IOtkUxYpiZjRQ3Sji6qj
}
cd /down
for line in $(cat list.txt)
do
    you-get $line
    sleep 1
done
msg you-get done
