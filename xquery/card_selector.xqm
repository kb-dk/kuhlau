xquery version "1.0" encoding "UTF-8";
module  namespace  crds="http://kb.dk/this/app/crds";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare function crds:select_cards(
  $app as xs:string,
  $col as xs:string) as node() {

    let $db  := concat($app,$col)

    let $a := ("a","b","c","d","e","f","g")
    let $b := ("h","i","k","l","m","n","o")
    let $c := ("p","q","r","s","t","u","v")

    let $sequence :=
      if(request:get-parameter("getitas","") = ".mid") then
	($a,$a,$b,$b,$a,$c,$c,$a)
      else
	($a,$b,$c)

	let $rawmusic:=<mei xmlns="http://www.music-encoding.org/ns/mei"
	  meiversion="2013">
	<meiHead>
	  <fileDesc>
	    <titleStmt>
	      <title>Kaleidakustikon</title>
	      <respStmt>
		<persName>F. Kuhlau</persName>
	      </respStmt>
	    </titleStmt>
	    <pubStmt>
	    </pubStmt>
	  </fileDesc>
	</meiHead>
	<music>
	  <body>
	    <mdiv>
	      <score>
		<scoreDef key.mode="major" 
		key.pname="f" 
		key.sig="1f" 
		meter.count="3" 
		meter.unit="4" >
		  <staffGrp symbol="brace" barthru="true">
		    <staffDef n="1" clef.line="2" clef.shape="G"/>
		    <staffDef n="2" clef.line="4" clef.shape="F"/>
		  </staffGrp>
		</scoreDef>
		{
		  for $q in $sequence
		  let $id:=concat($q,".",request:get-parameter($q,request:get-parameter("default","2")))
		  let $node:=
		    if(collection($db)//m:section/@xml:id/string()=$id) then
		      collection($db)//m:section[@xml:id/string()=$id]
		    else
		      collection($db)//m:section[@type/string()="missing"]
		      return
			if($node/@type="B") then
			  if(request:get-parameter("h",request:get-parameter("default","2")) eq "2") then
   			    $node
			  else
			    transform:transform($node,doc(concat($app,"/transpose.xsl")),())		  
			  else
			    $node
		}
	      </score>
	    </mdiv>
	  </body>
	</music>
      </mei>
      let $music := 
	if(request:get-parameter("apparatus","") = "yes") then
	  (: This is for the case that we want to preserve the apparatus :)
	  $rawmusic
	else
	  (: This is for the case that we want to select a set of readings from the apparatus :)
	  crds:copy($rawmusic)
	  (:transform:transform($rawmusic,doc(concat($app,"/apparatus-criticus.xsl")),()) :)

      return 
	if(request:get-parameter("getitas","") = ".mid") then
	  transform:transform($music,doc(concat($app,"/strip-repeats.xsl")),())		  
	else
	  $music
  };

declare function crds:embed_selected_cards(
  $app as xs:string,
  $col as xs:string) as node() {

    let $mei :=
      <mei xmlns="http://www.music-encoding.org/ns/mei">
      {
	for $d in doc("/db/dcm/22001519789793.xml")/m:mei/m:meiHead
	return $d
      }
      {
	for $music in crds:select_cards($app,$col)//m:music[1]
	return 
	  $music
      }
      </mei>

      return $mei

};

declare function crds:copy($element as element()) {
  element {node-name($element)}
    {$element/@*,
     for $child in $element/node()
        return 
	  if ($child instance of element()) then 
	    if(contains(node-name($child),"app")) then
	      if(request:get-parameter($child/@xml:id,"")) then
		let $apparatus := request:get-parameter($child/@xml:id,"")
		for $grandchild in ($child/m:lem|$child/m:rdg)[ @xml:id = $apparatus ]/*
		return
		  if ($grandchild instance of element()) then 
		    crds:copy($grandchild)
		  else
		    $grandchild
	      else
		for $grandchild in ($child/m:lem|$child/m:rdg)[1]/*
		return
		  if ($grandchild instance of element()) then 
		    crds:copy($grandchild)
		  else
		    $grandchild
	    else
	      crds:copy($child)
          else $child
    }
};
