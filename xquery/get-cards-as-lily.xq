xquery version "1.0" encoding "UTF-8";

import module  namespace  crds="http://kb.dk/this/app/crds" at "./card_selector.xqm";

declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "text";
declare option output:media-type "text/plain;charset=UTF-8";

let $app := "/db/mei2013"
let $col := "/kaleidakustikon"
let $pars:= <parameters>
<param name="tempo"   value='{request:get-parameter("tempo","120")}'/>
<param name="getitas" value='{request:get-parameter("getitas","")}'/>
</parameters>

return 
  transform:transform(crds:select_cards($app,$col),doc(concat($app,"/mei2lilypond.xsl") ),$pars)
