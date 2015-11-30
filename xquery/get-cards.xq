xquery version "3.0" encoding "UTF-8";

import module namespace conf="http://kb.dk/this/is/my/conf" at "./conf.xqm";
declare namespace local="http://kb.dk/this/is/me";
declare namespace xdb="http://exist-db.org/xquery/xmldb";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
(:declare namespace fn="http://www.w3.org/2005/xpath-functions";:)
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace m="http://www.music-encoding.org/ns/mei";

declare option output:method "xml";
declare option output:media-type "text/html; charset=UTF-8";

declare function local:echo-parameters($pars    as xs:string*,
  $getitas as xs:string) as xs:string
  {
    let $h := head($pars)
    let $t := tail($pars) 
    return
      if(count($t)) then
	if($h eq "getitas") then
	  local:echo-parameters($t,$getitas)
	else
	  concat($h,"=",request:get-parameter($h,""),"&amp;",local:echo-parameters($t,$getitas))
	else
	  concat($h,"=",request:get-parameter($h,""),"&amp;getitas=",$getitas)
  };


  declare function local:hidden-pars($pars as xs:string*) as node()*
  {
    let $h := head($pars)
    let $t := tail($pars) 
    return
      if(count($t)) then
	if($h eq "getitas" or contains($h,"app") ) then
	  local:hidden-pars($t)
	else
	  (<input type="hidden" name="{$h}" value="{request:get-parameter($h,'')}" />,
	  local:hidden-pars($t))
	else
	  (<input type="hidden" name="{$h}" value="{request:get-parameter($h,'')}" />)

  };


  let $app := "/db/mei2013"
  let $col := "/kaleidakustikon"
  let $parameters :=  request:get-parameter-names()

  let $rawdoc :=
    doc(
      concat("http://localhost/storage/mei2013/get-cards-as-xml.xq?apparatus=yes&amp;",
      local:echo-parameters($parameters,".xml"))
    )

    let $title :=
    for $tit in $rawdoc/m:mei/m:meiHead/m:fileDesc/m:titleStmt/m:title/string()
    return $tit

    let $cards:=doc(concat("http://localhost/cgi-bin/buildly?",
      local:echo-parameters($parameters,".svg")))

      return 
      <html>
	<head>
	  <title>{$title}{" "}
	  </title>
	  <link type="text/css" href="{$conf:base_uri}/style/edition.css" rel="stylesheet"/>
	</head>
	<body>
	  <div id="main">
	    <div id="header">
	      <div class="kb_logo">
		<a href="http://www.kb.dk" title="Det Kongelige Bibliotek"><img
		style="border: 0px; vertical-align:middle;" title="Det Kongelige Bibliotek"
		alt="KB Logo" src="{$conf:base_uri}/style/images/kb.png"/></a></div>
		<h4>Friedrich Kuhlau</h4>
		<h1>Kaleidakustikon</h1>
	    </div>
	    <div>
	      {$cards}
	    </div>
	    <div>
	    { 
	    if($rawdoc//m:app) then
	      <form action="./get-cards.xq" method="get">
		<h2>Variant readings and editorial emendations</h2>
		{local:hidden-pars($parameters)}
		<table>
		  {
		    for $sect in $rawdoc//m:section
		    let $id := $sect/@xml:id
		    return
		    for $app in $sect//m:app
		    let $appid := $app/@xml:id/string()
		    return
	            for $rdg at $rdgpos in $app//m:lem | $app//m:rdg
		    let $rdgid := $rdg/@xml:id/string()
		    let $marker :=
		      if($rdgpos = 1) then
  	              <strong>{$id/string()}</strong>
  		    else
		      ()
		      
                      return
	              <tr>
			<td>{$marker}{" "}</td>
			<td>{$rdg/m:annot/string()}</td>
			<td>
			  {
			    if($appid and $rdgid) then
			      element input
			      { 
			      attribute type  {"radio"},
			      attribute name  {$appid},
			      attribute value {$rdgid},
			      if( contains(request:get-parameter($appid,""),$rdgid)) then
				attribute checked {"checked"}
			      else
				()
			      }
			    else
			      ()
			  }
			</td>
		      </tr>
		  }
		</table>
		<button type="submit">View selected readings</button>
	      </form>
	      else
		()
	    }
	    </div>
	    
	    <div id="footer">
	      <div class="dcm_logo">
		<img style="border: 0px; vertical-align:middle;" alt="DCM Logo"
		src="{$conf:base_uri}/style/images/dcm_logo_small.png"/>
		Danish Centre for Music Publication, 
		The Royal Library, Copenhagen 2014 |
		<a href="http://www.kb.dk/dcm">www.kb.dk/dcm</a>
	      </div>
	    </div>
	  </div>
	</body>
      </html>



