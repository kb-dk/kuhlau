#!/bin/sh

file=`basename $* .xml`

java -jar saxon/saxon9.jar  $*  mei2mup-1.0.4.xsl > "$file.mup"
$HOME/sources/mup-6.1/bin/mup "$file.mup" > "$file.ps"
$HOME/sources/mup-6.1/bin/mup "$file.mup" -m "$file.mid"
ps2pdf "$file.ps" 
