xquery version "1.0" encoding "UTF-8";

declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace m="http://www.music-encoding.org/ns/mei";
declare namespace ft="http://exist-db.org/xquery/lucene";

declare option exist:serialize "method=xml media-type=text/html"; 


declare variable $bundles := ("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","q","r","s","t","u","v");

declare variable $queries := <properties> 
{for $bundle in $bundles
	let $param := <property key="{$bundle}">
	{request:get-parameter($bundle,request:get-parameter("default","2"))}</property>
	return $param
}
</properties>;

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Kaleidakustikon</title>
</head>
<body>
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
      return
      <td valign="top">
      {
	for $sect in collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$lable]
	order by $sect//m:section/@xml:id/string()
	return
	for $alt in $sect//m:section/@xml:id
	let $layer:=substring-after($alt/string(),".")
	return
	<p>
	  {
	    if($queries//properties/@key/string()=$layer) then
	      <strong>
		{($lable,", ",$layer)}
	      </strong>
	    else
	      ($lable,", ",$layer)
	  }
	</p>
      } 
      </td>
    }
  </tr>
}

</table>
</body>
</html>
