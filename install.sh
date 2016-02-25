#!/bin/sh

# We move cgi-bin to /home/kaleidakustikon/cgi-bin SLU 2016-02-25

export KUHLAU="/home/kaleidakustikon/"
#export CGI="/kb/httpd/cgi-bin/"
export CGI="$KUHLAU/cgi-bin/"
export USER="apache"

set -e
set -x

if [ ! -d "$KUHLAU" ]; then
    mkdir "$KUHLAU"
fi

if [ ! -d "$KUHLAU/cache" ]; then
    mkdir "$KUHLAU/cache"
    chown "$USER:$USER" "$KUHLAU/cache"
fi

tar cvf - $(find etc -type f -print | grep -v '\.svn') | \
    (cd "$KUHLAU" ; tar xvf - )

cp buildly "$CGI"
$ sudo ./pnr-install-web-site.sh

