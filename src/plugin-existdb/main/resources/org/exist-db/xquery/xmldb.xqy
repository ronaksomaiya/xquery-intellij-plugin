xquery version "3.0";
(:~
 : eXist-db database functions
 :
 : @see http://exist-db.org/exist/apps/fundocs/view.html?uri=http://exist-db.org/xquery/xmldb&location=java:org.exist.xquery.functions.xmldb.XMLDBModule&details=true
 :)
module namespace xmldb = "http://exist-db.org/xquery/xmldb";

declare namespace a = "http://reecedunn.co.uk/xquery/annotations";
declare namespace o = "http://reecedunn.co.uk/xquery/options";

declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:add-group-member") function xmldb:add-user-to-group($user as xs:string, $group as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:authenticate($collection-uri as xs:string, $user-id as xs:string?, $password as xs:string?) as xs:boolean external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:passwd") %a:see-also("exist", "4.4", "sm:add-group-member") %a:see-also("exist", "4.4", "sm:remove-group-member") function xmldb:change-user($user-id as xs:string, $password as xs:string?, $groups as xs:string*) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:passwd") %a:see-also("exist", "4.4", "sm:add-group-member") %a:see-also("exist", "4.4", "sm:remove-group-member") function xmldb:change-user($user-id as xs:string, $password as xs:string?, $groups as xs:string*, $home-collection as xs:string?) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:chmod") function xmldb:chmod-collection($collection as xs:string, $mode as xs:integer) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:chmod") function xmldb:chmod-resource($collection as xs:string, $resource as xs:string, $mode as xs:integer) as item() external;
declare %a:since("exist", "4.4") function xmldb:clear-lock($collection-uri as xs:string, $resource as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:collection-available($collection-uri as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "5.0") %a:see-also("exist", "5.0", "xmldb:copy-resource") %a:see-also("exist", "5.0", "xmldb:copy-collection") function xmldb:copy($source-collection-uri as xs:string, $target-collection-uri as xs:string) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "5.0") %a:see-also("exist", "5.0", "xmldb:copy-resource") %a:see-also("exist", "5.0", "xmldb:copy-collection") function xmldb:copy($source-collection-uri as xs:string, $target-collection-uri as xs:string, $resource as xs:string) as item() external;
declare %a:since("exist", "5.0") function xmldb:copy-collection($source-collection-uri as xs:string, $target-collection-uri as xs:string) as xs:string external;
declare %a:since("exist", "5.0") function xmldb:copy-collection($source-collection-uri as xs:string, $target-collection-uri as xs:string, $preserve as xs:boolean) as xs:string external;
declare %a:since("exist", "5.0") function xmldb:copy-resource($source-collection-uri as xs:string, $source-resource-name as xs:string, $target-collection-uri as xs:string, $target-resource-name as xs:string?) as xs:string external;
declare %a:since("exist", "5.0") function xmldb:copy-resource($source-collection-uri as xs:string, $source-resource-name as xs:string, $target-collection-uri as xs:string, $target-resource-name as xs:string?, $preserve as xs:boolean) as xs:string external;
declare %a:since("exist", "4.4") function xmldb:create-collection($target-collection-uri as xs:string, $new-collection as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:create-group") function xmldb:create-group($group as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:create-group") function xmldb:create-group($group as xs:string, $group-manager-username as xs:string+) as xs:boolean external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:create-account") function xmldb:create-user($user-id as xs:string, $password as xs:string, $groups as xs:string+) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:create-account") function xmldb:create-user($user-id as xs:string, $password as xs:string, $groups as xs:string+, $home-collection-uri as xs:string?) as item() external;
declare %a:since("exist", "4.4") function xmldb:created($collection-uri as xs:string) as xs:dateTime external;
declare %a:since("exist", "4.4") function xmldb:created($collection-uri as xs:string, $resource as xs:string) as xs:dateTime external;
declare %a:since("exist", "4.4") function xmldb:decode($string as xs:string) as xs:string external;
declare %a:since("exist", "4.4") function xmldb:decode-uri($uri as xs:anyURI) as xs:string external;
declare %a:since("exist", "4.4") function xmldb:defragment($nodes as node()+) as item() external;
declare %a:since("exist", "4.4") function xmldb:defragment($nodes as node()+, $integer as xs:integer) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:remove-account") function xmldb:delete-user($user-id as xs:string) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("xpath-functions", "1.0-20070123", "fn:doc") function xmldb:document($document-uris as xs:string+) as node()* external;
declare %a:since("exist", "4.4") function xmldb:document-has-lock($collection-uri as xs:string, $resource as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:encode($string as xs:string) as xs:string external;
declare %a:since("exist", "4.4") function xmldb:encode-uri($string as xs:string) as xs:anyURI external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:user-exists") function xmldb:exists-user($user-id as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:find-last-modified-since($node-set as node()*, $since as xs:dateTime) as node()* external;
declare %a:since("exist", "4.4") function xmldb:find-last-modified-until($node-set as node()*, $until as xs:dateTime) as node()* external;
declare %a:since("exist", "4.4") function xmldb:get-child-collections($collection-uri as xs:string) as xs:string* external;
declare %a:since("exist", "4.4") function xmldb:get-child-resources($collection-uri as item()) as xs:string* external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:id") function xmldb:get-current-user() as xs:string external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-account-metadata") function xmldb:get-current-user-attribute($name as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-account-metadata-keys") function xmldb:get-current-user-attribute-names() as xs:string* external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-group($collection-uri as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-group($collection-uri as xs:string, $resource as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:get-mime-type($resource-uri as xs:anyURI) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-owner($collection-uri as item()) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-owner($collection-uri as item(), $resource as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-permissions($collection-uri as xs:string) as xs:int? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-permissions") function xmldb:get-permissions($collection-uri as xs:string, $resource as xs:string) as xs:int? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-user-groups") function xmldb:get-user-groups($user-id as xs:string) as xs:string+ external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4") function xmldb:get-user-home($user-id as xs:string) as xs:anyURI? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-user-primary-group") function xmldb:get-user-primary-group($user-id as xs:string) as xs:string external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:get-group-members") function xmldb:get-users($group-name as xs:string) as xs:string* external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:group-exists") function xmldb:group-exists($group as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:is-dba") function xmldb:is-admin-user($user-id as xs:string) as xs:boolean? external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:is-authenticated") function xmldb:is-authenticated() as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:last-modified($collection-uri as item(), $resource as xs:string) as xs:dateTime? external;
declare %a:since("exist", "4.4") function xmldb:login($collection-uri as xs:string, $user-id as xs:string?, $password as xs:string?) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:login($collection-uri as xs:string, $user-id as xs:string?, $password as xs:string?, $create-session as xs:boolean?) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:match-collection($regexp as xs:string) as xs:string* external;
declare %a:since("exist", "4.4") function xmldb:move($source-collection-uri as xs:string, $target-collection-uri as xs:string) as item() external;
declare %a:since("exist", "4.4") function xmldb:move($source-collection-uri as xs:string, $target-collection-uri as xs:string, $resource as xs:string) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:octal-to-mode") function xmldb:permissions-to-string($permissions as xs:integer) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:register-database($driver as xs:string, $create-db as xs:boolean) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:reindex($collection-uri as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:reindex($collection-uri as xs:string, $doc-uri as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:remove($collection-uri as xs:string) as item() external;
declare %a:since("exist", "4.4") function xmldb:remove($collection-uri as xs:string, $resource as xs:string) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:remove-group-member") function xmldb:remove-user-from-group($user as xs:string, $group as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:rename($source-collection-uri as xs:string, $new-collection-name as xs:string) as item() external;
declare %a:since("exist", "4.4") function xmldb:rename($collection-uri as xs:string, $resource as xs:string, $new-resource-name as xs:string) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:chown") %a:see-also("exist", "4.4", "sm:chmod") function xmldb:set-collection-permissions($collection-uri as xs:string, $user-id as xs:string, $group-id as xs:string, $permissions as xs:integer) as item() external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:chown") %a:see-also("exist", "4.4", "sm:chmod") function xmldb:set-mime-type($resource-uri as xs:anyURI, $mime-type as xs:string?) as empty-sequence() external;
declare %a:since("exist", "4.4") function xmldb:set-resource-permissions($collection-uri as xs:string, $resource as xs:string, $user-id as xs:string, $group-id as xs:string, $permissions as xs:integer) as item() external;
declare %a:since("exist", "4.4") function xmldb:size($collection-uri as xs:string, $resource as xs:string) as xs:long external;
declare %a:since("exist", "4.4") function xmldb:store($collection-uri as xs:string, $resource-name as xs:string?, $contents as item()) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:store($collection-uri as xs:string, $resource-name as xs:string?, $contents as item(), $mime-type as xs:string) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:store-as-binary($collection-uri as xs:string, $resource-name as xs:string?, $contents as item()) as xs:string? external;
declare %a:since("exist", "4.4") function xmldb:store-files-from-pattern($collection-uri as xs:string, $directory as xs:string, $pattern as xs:string+) as xs:string* external;
declare %a:since("exist", "4.4") function xmldb:store-files-from-pattern($collection-uri as xs:string, $directory as xs:string, $pattern as xs:string+, $mime-type as xs:string?) as xs:string* external;
declare %a:since("exist", "4.4") function xmldb:store-files-from-pattern($collection-uri as xs:string, $directory as xs:string, $pattern as xs:string+, $mime-type as xs:string?, $preserve-structure as xs:boolean) as xs:string* external;
declare %a:since("exist", "4.4") function xmldb:store-files-from-pattern($collection-uri as xs:string, $directory as xs:string, $pattern as xs:string+, $mime-type as xs:string?, $preserve-structure as xs:boolean, $exclude as xs:string*) as xs:string* external;
declare %a:since("exist", "4.4") %a:deprecated("exist", "4.4") %a:see-also("exist", "4.4", "sm:mode-to-octal") function xmldb:string-to-permissions($permissions-string as xs:string) as xs:integer external;
declare %a:since("exist", "4.4") function xmldb:touch($collection-uri as xs:string, $resource as xs:string) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:touch($collection-uri as xs:string, $resource as xs:string, $modification-time as xs:dateTime) as xs:boolean external;
declare %a:since("exist", "4.4") function xmldb:update($collection-uri as xs:string, $modifications as node()) as xs:integer external;
declare %a:since("exist", "4.4") function xmldb:xcollection($collection-uris as xs:string+) as node()* external;