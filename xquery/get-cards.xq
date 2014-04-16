xquery version "1.0" encoding "UTF-8";

declare namespace local="http://kb.dk/this/is/me";
declare namespace xdb="http://exist-db.org/xquery/xmldb";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace m="http://www.music-encoding.org/ns/mei";

declare option output:method "xml";
declare option output:media-type "text/html; charset=UTF-8";

declare function local:echo-parameters($pars as xs:string*,
		                       $getitas as xs:string) as xs:string
{
  let $h := fn:head($pars)
  let $t := fn:tail($pars) 
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
    <link type="text/css" href="/kaleidakustikon/style/edition.css" rel="stylesheet"/>
  </head>
  <body>
  
    <div id="main">
    <h1>{$title}{" "}</h1>
    <br clear="both"/>
    <div>
      {$cards}
    </div>
    <div>
      <h2>Variant readings and editorial emendations</h2>
      <form action="/storage/mei2013/get-cards.xq" method="get">
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
    </div>
    </div>
  </body>
</html>



