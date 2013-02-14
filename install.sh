#!/bin/sh

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port disdev.kb.dk:8080  \
    --suffix xml \
    --load ./ \
    --context /exist/rest/db/ \
    --target kuhlau/kaleidakustikon
