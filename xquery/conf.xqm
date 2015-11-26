xquery version "1.0" encoding "UTF-8";

module  namespace conf   = "http://kb.dk/this/is/my/conf";
declare namespace request= "http://exist-db.org/xquery/request";

declare variable $conf:base_uri:=concat("http://",request:get-header('HOST'),"/dcm/kaleidakustikon");
