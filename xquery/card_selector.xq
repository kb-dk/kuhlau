xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace transform="http://exist-db.org/xquery/transform";

declare option exist:serialize "method=xml media-type=text/xml"; 

declare variable $bundles := ("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","q","r","s","t","u","v");

declare variable $queries := <properties> 
{for $bundle in $bundles
let $param := <property key="{$bundle}">
{request:get-parameter($bundle,request:get-parameter("default","2"))}</property>
return $param
}
</properties>;

let $music:=<mei xmlns="http://www.music-encoding.org/ns/mei"
     meiversion="2010-05">
  <meihead>
    <filedesc>
      <titlestmt>
	<title>Kaleidakustikon</title>
      </titlestmt>
      <pubstmt>
      </pubstmt>
    </filedesc>
  </meihead>
  <music>
    <body>
      <mdiv>
	<score>
	  <scoredef key.mode="major" 
		    key.pname="f" 
		    key.sig="1f" 
		    meter.count="3" 
		    meter.unit="4" >
	    <staffgrp symbol="brace" barthru="true">
	      <staffdef n="1" clef.line="2" clef.shape="G"/>
	      <staffdef n="2" clef.line="4" clef.shape="F"/>
	    </staffgrp>
	  </scoredef>
	  {

	    for $q in $queries/*
	    let $id:=concat($q/@key/string(),".",$q/string())
	    let $node:=
	      if(collection("/db/kuhlau/kaleidakustikon")//m:section/@xml:id/string()=$id) then
		collection("/db/kuhlau/kaleidakustikon")//m:section[@xml:id/string()=$id]
	      else
		collection("/db/kuhlau/kaleidakustikon")//m:section[@type/string()="missing"]
            return
	      if($node/@type="B") then
		if(request:get-parameter("h",request:get-parameter("default","2")) eq "2") then
   		  $node
		else
		  transform:transform($node,doc("/db/kuhlau/transpose.xsl"),())		  
	      else
		$node
	  }
	</score>
      </mdiv>
    </body>
  </music>
</mei>
return $music
