xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace p="http://kb.dk/p/";
import module namespace head="http://kb.dk/this/head" at "./header-stuff.xqm";
declare option exist:serialize "method=xml media-type=text/html"; 


declare variable $bundles := ("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","q","r","s","t","u","v");

declare variable $queries := <p:properties> 
{for $bundle in $bundles
let $param := <p:property key="{$bundle}">
{request:get-parameter($bundle,request:get-parameter("default","2"))}</p:property>
return $param
}
</p:properties>;

<html xmlns="http://www.w3.org/1999/xhtml">
  {head:print-head("Kaleidakustikon")}
  <body>
    <h1>Kaleidakustikon</h1>
    <p><a href="randomize.xq">Select cards randomly</a> | Select cards manually</p>


    <form method="get" action="/cgi-bin/build">
      {
	for $row in ("A","B","C")
	return
	  <div> 
	    {
	      let $lables:=
	      for $id in collection("/db/kuhlau/kaleidakustikon")//m:section[@type/string()=$row]/@xml:id/string()
	      return substring-before($id,".")
		
	      for $lable in distinct-values($lables)
	      order by $lable
	      return
	      <select name="{$lable}" id="{$lable}">
		{
		  for $sect 
		    in collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$lable]
		    order by substring-after($sect//m:section/@xml:id/string(),".") cast as xs:integer
		    return
		    for $alt in $sect//m:section/@xml:id
		    let $layer:=substring-after($alt/string(),".")
		    let $card:=
		      if(string-length($layer)=1) then
			concat("/kaleidakustikon/cards/",$lable,"_0",$layer,".jpg")
		      else
			concat("/kaleidakustikon/cards/",$lable,"_",$layer,".jpg")
     		    return 
		      element option {
			(attribute class {"card"},
			attribute title {$card},
 			attribute value {$layer},
			if($queries//p:property[@key/string()=$lable]/string()=$layer) then
			  attribute selected {"selected"}
			else "",
			  $lable,".",$layer
			)
		      }
		} 
	      </select>
	    }
	  </div>
	}
	<p>
	Get it as
       	<input type="hidden" name="getitas" value=""/>
       	<input type="submit" class="button" onclick="this.form.elements['getitas'].value='.xml';this.form.submit(); return false;" value="XML"></input>
       	<input type="submit" class="button" onclick="this.form.elements['getitas'].value='.pdf';this.form.submit(); return false;" value="PDF"></input> 
       	<input type="submit" class="button" onclick="this.form.elements['getitas'].value='.mid';this.form.submit();return false;" value="MIDI"></input>
	</p>
    </form>
  </body>
</html>
