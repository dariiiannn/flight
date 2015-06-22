xquery version "1.0-ml";

module namespace ext = "http://marklogic.com/rest-api/resource/absolutes";

declare namespace roxy = "http://marklogic.com/roxy";

import module namespace a = "http://marklogic.com/roxy/models/absolutes-lib" at "/app/models/absolutes-lib.xqy";
import module namespace s = "http://marklogic.com/roxy/models/static" at "/app/models/static.xqy";
import module namespace sf = "http://marklogic.com/roxy/models/create-static-files" at "/app/models/create-static-files.xqy";
import module namespace aj = "http://marklogic.com/roxy/views/absolutes.json" at "/app/views/absolutes.json.xqy";

(: 
 : To add parameters to the functions, specify them in the params annotations. 
 : Example
 :   declare %roxy:params("uri=xs:string", "priority=xs:int") ext:get(...)
 : This means that the get function will take two parameters, a string and an int.
 :)

(:
 :)
declare 
%roxy:params("")
function ext:get(
  $context as map:map,
  $params  as map:map
) as document-node()*
{
  map:put($context, "output-types", "application/xml"),
  xdmp:set-response-code(200, "OK"),
  document { aj:absolutes-json(s:static-absolutes()) }
};

(:
 :)
declare 
%roxy:params("")
function ext:put(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  xdmp:set-response-code(200, "OK"),
  document { sf:create-files() }
};

(:
 :)
declare 
%roxy:params("")
function ext:post(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()*
{
  map:put($context, "output-types", "application/xml"),
  xdmp:set-response-code(200, "OK"),
  document { "POST called on the ext service extension" }
};

(:
 :)
declare 
%roxy:params("")
function ext:delete(
    $context as map:map,
    $params  as map:map
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  xdmp:set-response-code(200, "OK"),
  document { "DELETE called on the ext service extension" }
};
