#!/bin/sh

$KUHLAU="/home/kaleidakustikon"
if[ ! -d "$KUHLAU" ]; then
    mkdir $KUHLAU
fi



tar cvf - `find etc -type f -print | grep -v '\.svn'` | (cd "$KUHLAU" ; tar xvf - )
