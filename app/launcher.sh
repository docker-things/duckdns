#!/bin/sh

while [ 1 = 1 ]; do
    echo url="https://www.duckdns.org/update?domains=${UPDATE_DOMAINS}&token=${UPDATE_TOKEN}&ip=" | curl -k -o /app/duck.log -K - > /dev/null 2>&1
    sleep ${UPDATE_INTERVAL}s
done