xquery version "1.0" encoding "UTF-8";

import module  namespace  crds="http://kb.dk/this/app/crds" at "./card_selector.xqm";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare option output:method "xml";
declare option output:media-type "text/xml; charset=UTF-8";

let $app := "/db/mei"
let $col := "/kaleidakustikon"

return 
  crds:embed_selected_cards($app,$col)
