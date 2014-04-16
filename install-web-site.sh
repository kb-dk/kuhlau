#!/bin/sh

export KUHLAU="/home/kaleidakustikon/"
export CGI="/kb/httpd/cgi-bin/"

if [ ! -d "$KUHLAU" ]; then
    mkdir "$KUHLAU"
fi



tar cvf - `find etc -type f -print | grep -v '\.svn'` | \
    (cd "$KUHLAU" ; tar xvf - )

cp buildly "$CGI"
