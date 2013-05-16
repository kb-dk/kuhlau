#!/bin/sh

# We deploy the documents by sending them to the eXist database

HOSTPORT="labs.kb.dk:8080"
#HOSTPORT="disdev-01.kb.dk:8080"
#HOSTPORT="localhost:8080"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xml \
    --delete ./ \
    --context /exist/rest/db/ \
    --target kuhlau/kaleidakustikon/

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xml \
    --load ./ \
    --context /exist/rest/db/ \
    --target kuhlau/kaleidakustikon/


./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xq \
    --load ./ \
    --context /exist/rest/db/ \
    --target kuhlau/
