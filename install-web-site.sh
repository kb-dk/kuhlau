#!/bin/sh

export KUHLAU="/home/kaleidakustikon/"
export CGI="/kb/httpd/cgi-bin/"
export USER="apache"

if [ ! -d "$KUHLAU" ]; then
    mkdir "$KUHLAU"
fi

if [ ! -d "$KUHLAU/cache" ]; then
    mkdir "$KUHLAU/cache"
    chown "$USER:$USER" "$KUHLAU/cache"
fi

tar cvf - `find etc -type f -print | grep -v '\.svn'` | \
    (cd "$KUHLAU" ; tar xvf - )

cp buildly "$CGI"
