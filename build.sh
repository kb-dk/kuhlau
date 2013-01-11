#!/bin/sh

java -jar saxon/saxon9.jar  kaleidakustikon.xml  mei2mup-1.0.4.xsl > kaleidakustikon.mup
$HOME/sources/mup-6.1/bin/mup kaleidakustikon.mup > kaleidakustikon.ps
$HOME/sources/mup-6.1/bin/mup kaleidakustikon.mup -m kaleidakustikon.mid
ps2pdf kaleidakustikon.ps
