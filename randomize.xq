xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace math="http://www.w3.org/2005/xpath-functions/math/";
declare namespace app="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace ft="http://exist-db.org/xquery/lucene";
declare namespace p="http://kb.dk/p/";

declare option exist:serialize "method=xml media-type=text/html"; 


declare variable $bundles := ("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","q","r","s","t","u","v");

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Kaleidakustikon</title>
  </head>
  <body>
    <h1>Kaleidakustikon</h1>
    <p>Generate random form</p>
    <form method="get" action="form.xq">
      <table>
	{
	  for $row in ("A","B","C")
	  return
	  <tr> 
	    <th valign="top">{$row}</th>
	    {
	      let $lables:=
	      for $id in collection("/db/kuhlau/kaleidakustikon")//m:section[@type/string()=$row]/@xml:id/string()
	      return substring-before($id,".")
		
	      for $lable in distinct-values($lables)
	      let $number:=count(collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$lable])
	      let $rand:=util:random($number)+1
	      order by $lable
	      return
	      <td valign="top">
		<select name="{$lable}">
		  {
		    for $sect 
		      in collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$lable]
		      
		      order by substring-after($sect//m:section/@xml:id/string(),".") cast as xs:integer
		      return
		      for $alt in $sect//m:section/@xml:id
		      let $layer:=substring-after($alt/string(),".")
		      return 
			element option {
			  (
			    attribute value {$layer},
			    if($alt/position()=$rand) then
			      attribute selected {"selected"}
			    else "",
  			    $rand,": ",$lable,".",$layer
			  )
			}
		  } 
		</select>
	      </td>
	    }
	  </tr>
	}

      </table>
      <input type="submit" name="getitas" value="Get form"/>
    </form>
  </body>
</html>