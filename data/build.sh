#!/bin/sh

file=`basename $* .xml`
xml_file="$file.xml"

if [ -f $xml_file ]; then
    xsltproc mei2lilypond.xsl "$xml_file" > "$file.ly"
    lilypond "$file.ly"
else
    echo "need an xml file as an argument for being able to transform it"
fi
