xquery version "1.0" encoding "UTF-8";
module namespace head="http://kb.dk/this/head";
declare namespace request="http://exist-db.org/xquery/request";

declare function head:print-head($title  as xs:string) as node()
{
  let $base_uri:=concat("http://",request:get-header('HOST'))
  let $html_head:=
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>{$title}</title>
    <link 
       type="text/css" 
       href="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/themes/base/jquery.ui.core.css" 
       rel="stylesheet" />
    <link 
       type="text/css" 
       href="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/themes/base/jquery.ui.theme.css" 
       rel="stylesheet" />
    <link 
       type="text/css" 
       href="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/themes/base/jquery.ui.selectmenu.css" 
       rel="stylesheet" />
    <link type="text/css" 
       href="{$base_uri}/kaleidakustikon/style/kaleidakustikon.css" 
       rel="stylesheet" />

    <script type="text/javascript" 
       src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/jquery-1.8.3.js">
      //
    </script>
    <script type="text/javascript" src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/ui/jquery.ui.core.js">
    //
    </script>
    <script type="text/javascript" src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/ui/jquery.ui.widget.js">
    //
    </script>
    <script type="text/javascript" src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/ui/jquery.ui.position.js">
    //
    </script>
    
    <script type="text/javascript" src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/ui/jquery.ui.selectmenu.js">
    //
    </script>
        
    <script type="text/javascript" src="{$base_uri}/kaleidakustikon/jquery-ui-selectmenu/main-script.js">
    //
    </script>
  </head>
  return $html_head
};
