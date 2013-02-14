#!/bin/sh

# We deploy the documents by sending them to the eXist database

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port disdev-01.kb.dk:8080  \
    --suffix xml \
    --load ./ \
    --context /exist/rest/db/ \
    --target kuhlau/kaleidakustikon/


./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port disdev-01.kb.dk:8080  \
    --suffix xq \
    --load ./ \
    --context /exist/rest/db/ \
    --target kuhlau/
