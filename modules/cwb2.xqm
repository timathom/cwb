xquery version "3.1";

module namespace cwb2 = "http://bibfram.es/cwb2/";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace mml = "http://www.w3.org/1998/Math/MathML";

declare
%rest:path("/search/{$category}")
%rest:GET
function cwb2:search-by-category(
    $category as xs:string
) {
    <choices>{
        db:open("topics")/*/*[name/text() = $category]/subject
    }</choices>
};


declare
%rest:path("/open/form/{$id}")
%rest:GET
function cwb2:save-form(
    $id as item()*
) {
    (            
    doc("/opt/bitnami/apache-tomcat/webapps/basex/static/cwb/files/" || $id || ".xml")           
    )
};


declare
%rest:path("/save/form/{$id}")
%rest:POST("{$data}")
function cwb2:save-form(
    $id as item()*,
    $data as item()*
) {
    (
    let $title := $data//data[@type = 'title']/concat(a, b)
    let $index :=
        <data xmlns="">
            <title id="{$id}" title="{$title}"/>
        </data>
    return (
        file:write("/opt/bitnami/apache-tomcat/webapps/basex/static/cwb/files/" || $id || ".xml", $data), $index
    )       
    )
};

declare
%rest:path("/save/new")
%rest:POST("{$data}")
function cwb2:save-new(
    $data as item()*
) {
    let $id := random:uuid()(: ,
        $new := 
            $data//data[@type = 'title']/concat(a, b),
        $update :=        
            <title id="{$id}" title="{$new}"/> :)                               
    return (
        file:write("/opt/bitnami/apache-tomcat/webapps/basex/static/cwb/files/" || $id || ".xml", $data), $id
    )
};

(: declare
%rest:path("/index/{$id}")
%rest:POST("{$data}")
function cwb2:index(
    $id as item()*,
    $data as item()*
) {
    
        $new := 
            $data//data[@type = 'title']/concat(a, b),
        $update :=        
            <title id="{$id}" title="{$new}"/>                               
    return (
        file:write("/home/tat2/apps/basex/webapp/static/cwb/files/" || $id || ".xml", $data), $id
    )
}; :)

(: $index := 
            if (doc("/home/tat2/apps/basex/webapp/static/cwb/files/" || $id || ".xml")) then 
                doc("/home/tat2/apps/basex/webapp/static/cwb/files/" || $id || ".xml")
            else file:write("/home/tat2/apps/basex/webapp/static/cwb/files/index.xml",
                            <data xmlns="">{$update}</data>) :)

