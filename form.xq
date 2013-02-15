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

	for $row in (1 to count(collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")="a"]))
	return
	<tr> {
		for $bndl in $queries/*
		let $key:=$bndl/@key/string()
		let $select:=$bndl/string()
(:		let $layer:=substring-after(collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$key][$row]/@xml:id/string(),"."):)
		return collection("/db/kuhlau/kaleidakustikon")//m:section[substring-before(@xml:id/string(),".")=$key][$row]
(:		return <td>{($key,$layer)}</td>:)
	} </tr>
}
</table>
</body>
</html>
