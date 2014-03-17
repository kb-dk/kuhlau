#!/bin/sh

# We deploy the documents by sending them to the eXist database

#HOSTPORT="labs.kb.dk:8080"
HOSTPORT="disdev-01.kb.dk:8081"
TARGET="mei2013"
# TARGET="kuhlau"
#HOSTPORT="localhost:8080"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xml \
    --delete ./data/ \
    --context /exist/rest/db/ \
    --target "$TARGET/kaleidakustikon/"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xml \
    --load ./data/ \
    --context /exist/rest/db/ \
    --target "$TARGET/kaleidakustikon/"


./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xq \
    --load ./xquery/ \
    --context /exist/rest/db/ \
    --target "$TARGET/"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xqm \
    --load ./xquery/ \
    --context /exist/rest/db/ \
    --target "$TARGET/"


./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xsl \
    --load ./xquery \
    --context /exist/rest/db/ \
    --target "$TARGET/"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix xsl \
    --load ./data \
    --context /exist/rest/db/ \
    --target "$TARGET/"

./load_exist.pl \
    --user admin \
    --password flormelis \
    --host-port $HOSTPORT  \
    --suffix owalk.xml \
    --load ./data \
    --context /exist/rest/db/ \
    --target "$TARGET/"
