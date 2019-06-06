xquery version "1.0-ml";
(:~
 : MarkLogic xdmp functions
 :
 : @see https://docs.marklogic.com/xdmp/admin
 : @see https://docs.marklogic.com/xdmp/appserver
 : @see https://docs.marklogic.com/xdmp/conversion
 : @see https://docs.marklogic.com/dates
 : @see https://docs.marklogic.com/xdmp/documents
 : @see https://docs.marklogic.com/xdmp/extension
 : @see https://docs.marklogic.com/xdmp/function-values
 : @see https://docs.marklogic.com/xdmp/http
 : @see https://docs.marklogic.com/xdmp/json
 : @see https://docs.marklogic.com/xdmp/server
 : @see https://docs.marklogic.com/xdmp/search
 : @see https://docs.marklogic.com/xdmp/xml
 : @see https://docs.marklogic.com/xdmp/context
 : @see https://docs.marklogic.com/xdmp/xslt (NOTE: XSLT only)
 : @see https://docs.marklogic.com/xdmp/security
 : @see https://docs.marklogic.com/xdmp/server-monitoring
 : @see https://docs.marklogic.com/xdmp/transaction
 : @see https://docs.marklogic.com/xdmp/update
 :)
module namespace xdmp = "http://marklogic.com/xdmp";

declare namespace a = "http://reecedunn.co.uk/xquery/annotations";
declare namespace o = "http://reecedunn.co.uk/xquery/options";

declare namespace db = "http://marklogic.com/xdmp/database";
declare namespace mt = "http://marklogic.com/xdmp/mimetypes";
declare namespace x509 = "http://marklogic.com/xdmp/x509";

declare option o:requires "marklogic/5.0";

declare %a:since("marklogic", "5.0") function xdmp:QName-from-key($key as xs:string) as xs:QName external;
declare %a:since("marklogic", "5.0") function xdmp:access($uri as xs:string, $action as xs:string) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:add-response-header($name as xs:string, $value as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:add64($x as xs:unsignedLong, $y as xs:unsignedLong) as xs:unsignedLong external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:amp($namespace as xs:string, $localname as xs:string, $module-uri as xs:string, $database as xs:unsignedLong) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:amp-roles($namespace-uri as xs:string, $localname as xs:string, $document-uri as xs:string, $database-id as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:and64($x as xs:unsignedLong, $y as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "6.0") function xdmp:annotation($function as function(*), $name as xs:QName) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:apply($function as xdmp:function) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:apply($function as xdmp:function, $params as item()*...) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:architecture() as xs:string external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:arrayValues($array as json:array) as item()* external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:arrayValues($array as json:array, $flatten as xs:boolean) as item()* external;
declare %a:since("marklogic", "8.0") function xdmp:atomizable() as xs:boolean external;
declare %a:since("marklogic", "7.0") function xdmp:atomizable($item as item()) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:aws-region() as string? external;
declare %a:since("marklogic", "9.0") function xdmp:aws-services-domain() as string? external;
declare %a:since("marklogic", "9.0") function xdmp:aws-services-partition() as string? external;
declare %a:since("marklogic", "5.0") function xdmp:base64-decode($encoded as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:base64-encode($plaintext as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:binary-decode($encoded as node(), $encoding-name as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:binary-is-external($source as binary()) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:binary-is-large($source as binary()) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:binary-is-small($source as binary()) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:binary-size() as xs:unsignedLong? external;
declare %a:since("marklogic", "5.0") function xdmp:binary-size($source as binary()?) as xs:unsignedLong? external;
declare %a:since("marklogic", "9.0") function xdmp:binary-to-integer($binary as xs:string) as xs:integer external;
declare %a:since("marklogic", "7.0") function xdmp:bootstrap-hosts() as xs:unsignedLong* external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(cache-status)")
        %a:since("marklogic", "5.0") function xdmp:cache-status() as element(cache-status)* external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(cache-status)")
        %a:restrict-until("$host-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:cache-status($host-id as xs:unsignedLong*) as element(cache-status)* external;
declare %a:since("marklogic", "8.0") function xdmp:caller-dialect() as xs:string? external;
declare %a:since("marklogic", "5.0") function xdmp:can-grant-roles($roles as xs:string*) as empty-sequence() external;
declare %a:restrict-until("$item", "marklogic", "8.0", "item()")
        %a:since("marklogic", "5.0") function xdmp:castable-as($namespace-uri as xs:string, $local-name as xs:string, $item as item()?) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:cluster() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:cluster($name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:cluster-effective-version() as xs:unsingedLong external;
declare %a:since("marklogic", "5.0") function xdmp:cluster-name() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:cluster-name($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:cluster-version-at-least($version as xs:unsignedInt) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:collation-canonical-uri($collation-uri as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:collection-delete($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:collection-id($uri as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:collection-locks() as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:collection-locks($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:collection-properties() as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:collection-properties($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "9.0") function xdmp:collections() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:commit() as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:configuration-timestamp() as xs:unsignedLong? external;
declare %a:since("marklogic", "5.0") function xdmp:configuration-timestamp($name as xs:string) as xs:unsignedLong? external;
declare %a:since("marklogic", "9.0") function xdmp:credential($id as xs:unsignedLong) as element(sec:credential) external;
declare %a:since("marklogic", "9.0") function xdmp:credential-id($credential-name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:credentials() as element(sec:credential)* external;
declare %a:since("marklogic", "9.0") function xdmp:credentials($uri as xs:string?) as element(sec:credential)* external;
declare %a:since("marklogic", "5.0") function xdmp:crypt($password as xs:string, $salt as xs:string) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:crypt2($password as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:current-last() as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:current-position() as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:data-directory() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:database() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database($name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-assignment-policy($database-id as xs:unsignedLong) as element(db:assignment-policy) external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $journal-archiving as xs:boolean?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?, $backup-kek-id as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?, $backup-kek-id as xs:string?, $backup-passphrase as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-cancel($jobid as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-purge($dir as xs:string, $keep-num-backups as xs:unsignedInt) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:database-backup-purge($dir as xs:string, $keep-num-backups as xs:unsignedInt, $incremental-dir as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-status($jobid as xs:unsignedLong) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-status($jobid as xs:unsignedLong, $hostid as xs:unsignedLong) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as element() external;
declare %a:restrict-until("$lag-limit", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:database-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-directory-creation($database-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:database-encryption-at-rest($database-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:database-encryption-key-id($database-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:database-forests($database-id as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:restrict-since("$include-replicas", "marklogic", "8.0", "xs:boolean")
        %a:since("marklogic", "5.0") function xdmp:database-forests($database-id as xs:unsignedLong, $include-replicas as xs:boolean?) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:database-global-nonblocking-timestamp($database-id as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?, $backup-kek-id as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-incremental-backup($forestIDs as xs:unsignedLong*, $pathname as xs:string, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?, $backup-kek-id as xs:string?, $backup-passphrase as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $incremental-dir as xs:string?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-incremental-backup-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $include-replicas as xs:boolean?, $incremental-dir as xs:string?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $lag-limit as xs:unsignedLong?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-is-forest-retired($database-id as xs:unsignedLong, $forest-id as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:database-is-rebalancer-enable($database-id as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:database-is-replica($database-id as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:database-journal-archive-purge($dir as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:database-journal-archive-purge($dir as xs:string, $incremental-dir as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:database-journal-archive-purge($dir as xs:string, $incremental-dir as xs:string, $journal-archive-path as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:database-name($database-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:database-node-query-rolesets($nodes as node()*) as element(sec:query-rolesets)* external;
declare %a:since("marklogic", "9.0") function xdmp:database-node-query-rolesets($nodes as node()*, $options as xs:string*) as element(sec:query-rolesets)* external;
declare %a:since("marklogic", "5.0") function xdmp:database-nonblocking-timestamp($database-id as xs:unsignedLong) as xs:unsignedLong external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong*")
        %a:restrict-since("$value", "marklogic", "8.0", "xs:anyAtomicType")
        %a:since("marklogic", "7.0") %a:until("marklogic", "9.0") function xdmp:database-partition-forests($value as item()) as xs:positiveInteger* external;
declare %a:since("marklogic", "8.0") function xdmp:database-path-namespaces() as element() external;
declare %a:since("marklogic", "7.0") function xdmp:database-path-namespaces($dbid as xs:unsignedLong) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?, $backup-passphrase as xs:string?) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:database-restore($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?, $backup-passphrase as xs:string?, $forest-map as map:map?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-cancel($jobid as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-status($jobid as xs:unsignedLong) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?) as element() external;
declare %a:since("marklogic", "8.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?) as element() external;
declare %a:since("marklogic", "9.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?, $backup-passphrase as xs:string?) as element() external;
declare %a:since("marklogic", "9.0") function xdmp:database-restore-validate($forestIDs as xs:unsignedLong*, $pathname as xs:string, $restoreToTime as xs:dateTime?, $include-replicas as xs:boolean?, $journal-archiving as xs:boolean?, $journal-archive-path as xs:string?, $incremental-backup as xs:boolean?, $incremental-backup-path as xs:string?, $backup-passphrase as xs:string?, $forest-map as map:map?) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:databases() as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:dayname-from-date($arg as xs:date?) as xs:string? external;
declare %a:since("marklogic", "6.0") function xdmp:decode-from-NCName($name as xs:string) as xs:string external;
declare %a:restrict-until("return", "marklogic", "6.0", "element()*")
        %a:restrict-since("return", "marklogic", "6.0", "xs:string*")
        %a:since("marklogic", "5.0") function xdmp:default-collections() as (element()*|xs:string*) external;
declare %a:restrict-until("return", "marklogic", "6.0", "element()*")
        %a:restrict-since("return", "marklogic", "6.0", "xs:string*")
        %a:since("marklogic", "5.0") function xdmp:default-collections($uri as xs:string) as (element()*|xs:string*) external;
declare %a:since("marklogic", "5.0") function xdmp:default-permissions() as element()* external;
declare %a:since("marklogic", "5.0") function xdmp:default-permissions($uri as xs:string) as element()* external;
declare %a:since("marklogic", "8.0") function xdmp:default-permissions($uri as xs:string, $output-kind as xs:string) as element()* external;
declare %a:since("marklogic", "5.0") function xdmp:describe($item as item()*) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:describe($item as item()*, $max-sequence-length as xs:unsignedInt?) as xs:string external;
declare %a:restrict-since("$max-item-length", "marklogic", "8.0", "xs:unsignedInt?")
        %a:since("marklogic", "5.0") function xdmp:describe($item as item()*, $max-sequence-length as xs:unsignedInt?, $max-item-length as xs:unsignedInt*) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:diacritic-less($string as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:directory($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:directory($uri as xs:string*, $depth as xs:string?) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:directory-create($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-create($uri as xs:string, $permissions as element(sec:permission)*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-create($uri as xs:string, $permissions as element(sec:permission)*, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-create($uri as xs:string, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-create($uri as xs:string, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?, $forest-ids as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-delete($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:directory-locks($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:directory-locks($uri as xs:string*, $depth as xs:string?) as document-node()* external;
declare %a:restrict-until("$uri", "marklogic", "8.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:directory-properties($uri as xs:string*) as document-node()* external;
declare %a:restrict-until("$uri", "marklogic", "8.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:directory-properties($uri as xs:string*, $depth as xs:string?) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-add-collections($uri as xs:string, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-add-permissions($uri as xs:string, $permissions as element(sec:permission)*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-add-properties($uri as xs:string, $props as element()*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-assign($uri as xs:string, $forest-count as xs:positiveInteger) as xs:positiveInteger external;
declare %a:since("marklogic", "7.0") function xdmp:document-assign($uri as xs:string, $forest-count as xs:positiveInteger, $assignment-policy as xs:string) as xs:positiveInteger external;
declare %a:since("marklogic", "5.0") function xdmp:document-delete($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-filter($doc as node()) as node() external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "7.0") function xdmp:document-filter($doc as node(), $options as (node()?|map:map?)) as node() external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong?")
        %a:since("marklogic", "5.0") function xdmp:document-forest($uri as xs:string) as xs:integer? external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong?")
        %a:since("marklogic", "5.0") function xdmp:document-forest($uri as xs:string, $forest-ids as xs:unsignedLong*) as xs:integer? external;
declare %a:restrict-until("return", "marklogic", "6.0", "node()")
        %a:restrict-until("return", "marklogic", "8.0", "node()?")
        %a:since("marklogic", "5.0") function xdmp:document-get($location as xs:string) as node()* external;
declare %a:restrict-until("return", "marklogic", "6.0", "node()")
        %a:restrict-until("return", "marklogic", "8.0", "node()?")
        %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:document-get($location as xs:string, $options as (node()?|map:map?)) as node()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-get-collections($uri as xs:string) as xs:string* external;
declare %a:since("marklogic", "9.0") function xdmp:document-get-metadata($uri as xs:string) as map:map? external;
declare %a:since("marklogic", "9.0") function xdmp:document-get-metadata-value($uri as xs:string, $keyName as xs:string) as xs:string? external;
declare %a:restrict-until("return", "marklogic", "8.0", "element()*")
        %a:since("marklogic", "5.0") function xdmp:document-get-permissions($uri as xs:string) as item()* external;
declare %a:since("marklogic", "8.0") function xdmp:document-get-permissions($uri as xs:string, $output-kind as xs:string) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-get-properties($uri as xs:string, $property as xs:QName) as element()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-get-quality($uri as xs:string) as xs:integer? external;
declare %a:since("marklogic", "5.0") function xdmp:document-insert($uri as xs:string, $root as node()) as empty-sequence() external;
declare %a:restrict-until("$permissions_or_options", "marklogic", "9.0", "element(sec:permission)*")
        %a:restrict-until("$permissions_or_options", "marklogic", "9.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:document-insert($uri as xs:string, $root as node(), $permissions_or_options as (element()*|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:until("marklogic", "9.0") function xdmp:document-insert($uri as xs:string, $root as node(), $permissions as element(sec:permission)*, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:until("marklogic", "9.0") function xdmp:document-insert($uri as xs:string, $root as node(), $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:until("marklogic", "9.0") function xdmp:document-insert($uri as xs:string, $root as node(), $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?, $forest-ids as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-load($location as xs:string) as empty-sequence() external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:document-load($location as xs:string, $options as (node()?|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-locks() as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-locks($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "9.0") function xdmp:document-partition-assign($root as node()) as xs:unsignedInt? external;
declare %a:since("marklogic", "9.0") function xdmp:document-partition-assign($root as node(), $partition-queries as map:map) as xs:unsignedInt? external;
declare %a:since("marklogic", "5.0") function xdmp:document-properties() as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:document-properties($uri as xs:string*) as document-node()* external;
declare %a:since("marklogic", "9.0") function xdmp:document-put-metadata($uri as xs:string, $metadata as map:map) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-remove-collections($uri as xs:string, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:document-remove-metadata($uri as xs:string, $metadata as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-remove-permissions($uri as xs:string, $permissions as element(sec:permission)*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-remove-properties($uri as xs:string, $property-names as xs:QName*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-set-collections($uri as xs:string, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:document-set-metadata($uri as xs:string, $metadata as map:map) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-set-permissions($uri as xs:string, $permissions as element(sec:permission)*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-set-properties($uri as xs:string, $props as element()*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:document-set-property($uri as xs:string, $prop as element()) as empty-sequence() external;
declare %a:restrict-until("$quality", "marklogic", "8.0", "xs:int")
        %a:since("marklogic", "5.0") function xdmp:document-set-quality($uri as xs:string, $quality as xs:integer) as empty-sequence() external;
declare %a:since("marklogic", "6.0") function xdmp:document-timestamp($uri as xs:string) as xs:integer? external;
declare %a:since("marklogic", "6.0") function xdmp:eager($arg as item()*) as item()* external;
declare %a:since("marklogic", "8.0") function xdmp:effective-version() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:elapsed-time() as xs:dayTimeDuration external;
declare %a:since("marklogic", "5.0") function xdmp:element-content-type($element as element()) as xs:string external;
declare %a:restrict-since("$message", "marklogic", "8.0", "element()")
        %a:since("marklogic", "5.0") function xdmp:email($message as node()) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:email($message as element(), $options as (element()?|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "6.0") function xdmp:encode-for-NCName($name as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:encoding-language-detect($document as node()) as element()* external;
declare %a:since("marklogic", "5.0") function xdmp:estimate($expression as item()*) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:estimate($expression as item()*, $maximum as xs:double?) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:eval($xquery as xs:string) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:since("marklogic", "5.0") function xdmp:eval($xquery as xs:string, $vars as (item()*|map:map?)) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:eval($xquery as xs:string, $vars as (item()*|map:map?), $options as (node()?|map:map?)) as item()* external;
declare %a:restrict-until("$ID", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:eval#3") function xdmp:eval-in($xquery as xs:string, $ID as xs:unsignedLong*) as item()* external;
declare %a:restrict-until("$ID", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:eval#3") function xdmp:eval-in($xquery as xs:string, $ID as xs:unsignedLong*, $vars as item()*) as item()* external;
declare %a:restrict-until("$ID", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:eval#3") function xdmp:eval-in($xquery as xs:string, $ID as xs:unsignedLong*, $vars as item()*, $modules as xs:unsignedLong?) as item()* external;
declare %a:restrict-until("$ID", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:eval#3") function xdmp:eval-in($xquery as xs:string, $ID as xs:unsignedLong*, $vars as item()*, $modules as xs:unsignedLong?, $root as xs:string?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:excel-convert($doc as node(), $filename as xs:string) as node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:excel-convert($doc as node(), $filename as xs:string, $options as (node()?|map:map?)) as node()* external;
declare %a:since("marklogic", "5.0") function xdmp:exists($expression as item()*) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:external-binary($path as xs:string) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:external-binary($path as xs:string, $starting-location as xs:double) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:external-binary($path as xs:string, $starting-location as xs:double, $length as xs:double) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:external-binary-path($source as binary()) as xs:string? external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "7.0") function xdmp:external-security($external-security as xs:string) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:filesystem-directory($pathname as xs:string) as element(dir:directory) external;
declare %a:since("marklogic", "8.0") function xdmp:filesystem-directory-create($pathname as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:filesystem-directory-create($pathname as xs:string, $options as (element()?|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:filesystem-directory-delete($pathname as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:filesystem-file($pathname as xs:string) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:filesystem-file-encryption-status($pathname as xs:string) as element(file-encryption-status)? external;
declare %a:since("marklogic", "5.0") function xdmp:filesystem-file-exists($pathname as xs:string) as xs:boolean external;
declare %a:since("marklogic", "7.0") function xdmp:filesystem-file-exists($pathname as xs:string, $host as xs:unsignedLong?) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:filesystem-file-get-time($pathname as xs:string) as xs:dateTime* external;
declare %a:since("marklogic", "5.0") function xdmp:filesystem-file-length($pathname as xs:string) as xs:unsignedLong? external;
declare %a:since("marklogic", "9.0") function xdmp:filesystem-file-set-time($pathname as xs:string, $actime as xs:string, $modtime as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "7.0") function xdmp:filesystem-filepath($pathname as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:foreign-cluster-status($host-id as xs:unsignedLong, $foreign-cluster-id as xs:unsignedLong) as element(foreign-cluster-status) external;
declare %a:since("marklogic", "5.0") function xdmp:foreign-clusters() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:forest($name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:forest-backup($forestID as xs:unsignedLong, $pathname as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:forest-backup-status($forestid as xs:unsignedLong*) as element()* external;
declare %a:since("marklogic", "5.0") function xdmp:forest-clear($forestIDs as xs:unsignedLong*) as empty-sequence() external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(forest-counts)")
        %a:restrict-until("$forest-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:forest-counts($forest-id as xs:unsignedLong*) as element(forest-counts)* external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(forest-counts)")
        %a:restrict-until("$forest-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:forest-counts($forest-id as xs:unsignedLong*, $show-elements as xs:string*) as element(forest-counts)* external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(forest-counts)")
        %a:since("marklogic", "7.0") function xdmp:forest-counts($forest-id as xs:unsignedLong*, $show-elements as xs:string*, $options as xs:string*) as element(forest-counts)* external;
declare %a:since("marklogic", "9.0") function xdmp:forest-database-replication-resume($forest-ID as xs:unsignedLong*, $forceBulkReplication as xs:boolean) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:forest-database-replication-suspend($forest-ID as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:forest-databases($forest as xs:unsignedLong) as xs:unsignedLong? external;
declare %a:since("marklogic", "9.0") function xdmp:forest-failover-info($id as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:forest-host($id as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:forest-name($forest-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:forest-online($forestID as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "7.0") function xdmp:forest-online($forestID as xs:unsignedLong, $timestamp as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "7.0") function xdmp:forest-online($forestID as xs:unsignedLong, $timestamp as xs:unsignedLong, $isReplica as xs:boolean) as xs:boolean external;
declare %a:since("marklogic", "7.0") function xdmp:forest-online($forestID as xs:unsignedLong, $timestamp as xs:unsignedLong, $isReplica as xs:boolean, $syncingOk as xs:boolean) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:forest-open-replica($forestIDs as xs:unsignedLong*) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:forest-restart($forestIDs as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:forest-restore($forestID as xs:unsignedLong, $pathname as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:forest-rollback($forestIDs as xs:unsignedLong*, $timestamp as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:forest-state($forestID as xs:unsignedLong) as xs:string* external;
declare %a:restrict-until("$forest-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:forest-status($forest-id as xs:unsignedLong*) as element(forest-status) external;
declare %a:since("marklogic", "6.0") function xdmp:forest-updates-allowed($forest-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:forest-validate-replica-index($forest-IDs as xs:unsignedLong*, $options as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:forests() as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?, $letter-value as xs:string?) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?, $letter-value as xs:string?, $ordchar as xs:string?) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?, $letter-value as xs:string?, $ordchar as xs:string?, $zero-padding as xs:string?) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?, $letter-value as xs:string?, $ordchar as xs:string?, $zero-padding as xs:string?, $grouping-separator as xs:string?) as xs:string external;
declare %a:restrict-until("$picture", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$letter-value", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$ordchar", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$zero-padding", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$grouping-separator", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$grouping-size", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$grouping-size", "marklogic", "8.0", "xs:string?")
        %a:restrict-since("$grouping-size", "marklogic", "8.0", "xs:integer?")
        %a:since("marklogic", "5.0") function xdmp:format-number($value as xs:numeric, $picture as xs:string?, $language as xs:string?, $letter-value as xs:string?, $ordchar as xs:string?, $zero-padding as xs:string?, $grouping-separator as xs:string?, $grouping-size as (xs:string?|xs:integer?)) as xs:string external;
declare %a:restrict-until("$arg", "marklogic", "8.0", "xs:string")
        %a:restrict-since("$arg", "marklogic", "8.0", "node()")
        %a:since("marklogic", "5.0") %a:see-also("marklogic", "8.0", "xdmp:from-json-string#1") function xdmp:from-json($arg as (xs:string|node())) as item()* external;
declare %a:since("marklogic", "8.0") function xdmp:from-json-string($arg as xs:string) as item()* external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:fromJSON($arg as node()) as item()* external;
declare %a:restrict-until("$function", "marklogic", "8.0", "xs:QName")
        %a:since("marklogic", "5.0") function xdmp:function($function as xs:QName?) as xdmp:function external;
declare %a:restrict-until("$function", "marklogic", "8.0", "xs:QName")
        %a:since("marklogic", "5.0") function xdmp:function($function as xs:QName?, $module-path as xs:string?) as xdmp:function external;
declare %a:since("marklogic", "5.0") function xdmp:function-module($function as xdmp:function) as xs:string external;
declare %a:restrict-until("return", "marklogic", "8.0", "xs:QName")
        %a:since("marklogic", "5.0") function xdmp:function-name($function as xdmp:function) as xs:QName? external;
declare %a:since("marklogic", "6.0") function xdmp:function-parameter-name($function as function(*), $position as xs:integer) as xs:QName external;
declare %a:since("marklogic", "6.0") function xdmp:function-parameter-type($function as function(*), $position as xs:integer) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:function-return-type($function as function(*)) as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:function-signature($function as function(*)) as xs:string? external;
declare %a:since("marklogic", "6.0") function xdmp:functions() as function(*)* external;
declare %a:restrict-until("return", "marklogic", "6.0", "node()")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-get#1") function xdmp:get($path as xs:string) as node()? external;
declare %a:restrict-until("return", "marklogic", "6.0", "node()")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-get#2") function xdmp:get($path as xs:string, $default-namespace as xs:string?) as node()? external;
declare %a:restrict-until("return", "marklogic", "6.0", "node()")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-get#2") function xdmp:get($path as xs:string, $default-namespace as xs:string?, $options as xs:string*) as node()? external;
declare %a:since("marklogic", "5.0") function xdmp:get-current-roles() as xs:unsignedLong* external;
declare %a:restrict-until("return", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:get-current-user() as xs:string? external;
declare %a:since("marklogic", "7.0") function xdmp:get-current-userid() as xs:unsignedLong external;
declare %a:since("marklogic", "6.0") function xdmp:get-invoked-path() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-original-url() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-orphaned-binaries($id as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-body() as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-body($format as xs:string?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-client-address() as xs:string? external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-client-certificate() as xs:string? external;
declare %a:since("marklogic", "8.0") function xdmp:get-request-error-format() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-field($name as xs:string) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-field($name as xs:string, $default as xs:string?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-field-content-type($field-name as xs:string) as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-field-filename($field-name as xs:string) as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-field-names() as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-header($name as xs:string) as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-header($name as xs:string, $default as xs:string?) as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-header-names() as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-method() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-path() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-port() as xs:integer? external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-protocol() as xs:string? external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-url() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-user() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:get-request-username() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-response-code() as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-response-encoding() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-server-field($name as xs:string) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-server-field($name as xs:string, $default as item()*) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-server-field-names() as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-session-field($name as xs:string) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-session-field($name as xs:string, $default as item()*) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:get-session-field-names() as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:get-transaction-mode() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:get-url-rewriter-path() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:group() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:group($name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:group-get-audit-event-type-enabled($group-id as xs:unsignedLong, $event-type as xs:string) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:group-hosts() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:group-hosts($groupID as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:group-name() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:group-name($groupID as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:group-port-servers() as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:group-port-servers($groupID as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:group-servers() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:group-servers($groupID as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:group-task-server() as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:group-task-server($groupID as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:groups() as xs:unsignedLong* external;
declare %a:since("marklogic", "7.0") function xdmp:gss-server-negotiate($inputToken as xs:string) as element() external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:gunzip($gzipnode as binary(), $options as (node()?|map:map?)) as node()+ external;
declare %a:since("marklogic", "5.0") function xdmp:gzip($node as node()) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:has-privilege($privileges as xs:string*, $kind as xs:string) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:hash32($string as xs:string) as xs:unsignedInt external;
declare %a:since("marklogic", "5.0") function xdmp:hash64($string as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:hex-to-integer($hex as xs:string) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-md5($secretkey as item(), $message as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-md5($secretkey as item(), $message as item(), $encoding as xs:string) as xs:string external;
declare %a:restrict-until("$message", "marklogic", "8.0", "xs:string")
        %a:restrict-since("$message", "marklogic", "8.0", "item()")
        %a:since("marklogic", "5.0") function xdmp:hmac-sha1($secretkey as item(), $message as (xs:string|item())) as xs:string external;
declare %a:restrict-until("$message", "marklogic", "8.0", "xs:string")
        %a:restrict-since("$message", "marklogic", "8.0", "item()")
        %a:since("marklogic", "5.0") function xdmp:hmac-sha1($secretkey as item(), $message as (xs:string|item()), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-sha256($secretkey as item(), $message as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-sha256($secretkey as item(), $message as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-sha512($secretkey as item(), $message as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:hmac-sha512($secretkey as item(), $message as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:host() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:host($name as xs:string) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:host-forests($ID as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:host-get-ssl-fips-enabled($host-id as xs:unsignedLong*) as xs:boolean* external;
declare %a:since("marklogic", "7.0") function xdmp:host-group() as xs:unsignedLong external;
declare %a:since("marklogic", "7.0") function xdmp:host-group($ID as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:host-mode() as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:host-mode-description() as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:host-mode-description($ID as xs:unsignedLong) as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:host-name() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:host-name($ID as xs:unsignedLong) as xs:string external;
declare %a:restrict-until("return", "marklogic", "8.0", "element(host-status)")
        %a:restrict-until("$host-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:host-status($host-id as xs:unsignedLong*) as element(host-status)* external;
declare %a:since("marklogic", "5.0") function xdmp:hosts() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:http-delete($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-delete($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:since("marklogic", "5.0") function xdmp:http-get($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-get($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:since("marklogic", "5.0") function xdmp:http-head($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-head($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:since("marklogic", "5.0") function xdmp:http-options($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-options($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:since("marklogic", "5.0") function xdmp:http-post($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-post($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-post($uri as xs:string, $options as (node()?|map:map?), $data as node()?) as item()+ external;
declare %a:since("marklogic", "5.0") function xdmp:http-put($uri as xs:string) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-put($uri as xs:string, $options as (node()?|map:map?)) as item()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:http-put($uri as xs:string, $options as (node()?|map:map?), $data as node()?) as item()+ external;
declare %a:since("marklogic", "7.0") function xdmp:initcap($string as xs:string?) as xs:string? external;
declare %a:since("marklogic", "9.0") function xdmp:integer-to-binary($val as xs:integer) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:integer-to-hex($val as xs:integer) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:integer-to-octal($val as xs:integer) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:invoke($path as xs:string) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:since("marklogic", "5.0") function xdmp:invoke($path as xs:string, $vars as (item()*|map:map?)) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:invoke($path as xs:string, $vars as (item()*|map:map?), $options as (node()?|map:map?)) as item()* external;
declare %a:restrict-until("$func", "marklogic", "9.0", "function() as item()*")
        %a:since("marklogic", "7.0") function xdmp:invoke-function($func as function(*)) as item()* external;
declare %a:restrict-until("$func", "marklogic", "9.0", "function() as item()*")
        %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "7.0") function xdmp:invoke-function($func as function(*), $options as (node()?|map:map?)) as item()* external;
declare %a:restrict-until("$func", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:invoke#3") function xdmp:invoke-in($uri as xs:string, $ID as xs:unsignedLong*) as item()* external;
declare %a:restrict-until("$func", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:invoke#3") function xdmp:invoke-in($uri as xs:string, $ID as xs:unsignedLong*, $vars as item()*) as item()* external;
declare %a:restrict-until("$func", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:invoke#3") function xdmp:invoke-in($uri as xs:string, $ID as xs:unsignedLong*, $vars as item()*, $modules as xs:unsignedLong?) as item()* external;
declare %a:restrict-until("$func", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:invoke#3") function xdmp:invoke-in($uri as xs:string, $ID as xs:unsignedLong*, $vars as item()*, $modules as xs:unsignedLong?, $root as xs:string?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:is-whitespace-node() as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:is-whitespace-node($text as node()) as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:javascript-eval($javascript as xs:string) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:since("marklogic", "8.0") function xdmp:javascript-eval($javascript as xs:string, $vars as (item()*|map:map?)) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:since("marklogic", "8.0") function xdmp:javascript-eval($javascript as xs:string, $vars as (item()*|map:map?), $options as node()?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:json-validate($node as node(), $schema as xs:string, $mode as xs:string) as node() external;
declare %a:since("marklogic", "9.0") function xdmp:json-validate-node($node as node(), $schema as node(), $mode as xs:string) as node() external;
declare %a:since("marklogic", "5.0") function xdmp:key-from-QName($name as xs:QName) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-export($passphrase as xs:string, $filepath as xs:string) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-import($passphrase as xs:string, $filepath as xs:string) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-set-current-host() as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-set-current-host($hostname as xs:string) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-status() as element(keystore-status) external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-synchronize() as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-synchronize($hostid as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:keystore-validate-exported($passphrase as xs:string, $filepath as xs:string) as element(keystore-export) external;
declare %a:since("marklogic", "6.0") function xdmp:lazy($arg as item()*) as item()* external;
declare %a:since("marklogic", "7.0") function xdmp:ldap-lookup($DN as xs:string) as element()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "7.0") function xdmp:ldap-lookup($DN as xs:string, $options as (node()?|map:map?)) as element()* external;
declare %a:since("marklogic", "7.0") function xdmp:ldap-search($query as xs:string) as element()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "7.0") function xdmp:ldap-search($query as xs:string, $options as (node()?|map:map?)) as element()* external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#1") function xdmp:load($path as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*, $collections as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?, $default-namespace as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?, $default-namespace as xs:string?, $options as xs:string*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:document-load#2") function xdmp:load($path as xs:string, $uri as xs:string?, $permissions as element(sec:permission)*, $collections as xs:string*, $quality as xs:int?, $default-namespace as xs:string?, $options as xs:string*, $forest-ids as xs:unsignedLong*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lock-acquire($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lock-acquire($uri as xs:string, $scope as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lock-acquire($uri as xs:string, $scope as xs:string?, $depth as xs:string?) as empty-sequence() external;
declare %a:restrict-until("$owner", "marklogic", "8.0", "item()?")
        %a:since("marklogic", "5.0") function xdmp:lock-acquire($uri as xs:string, $scope as xs:string?, $depth as xs:string?, $owner as item()*) as empty-sequence() external;
declare %a:restrict-until("$owner", "marklogic", "8.0", "item()?")
        %a:since("marklogic", "5.0") function xdmp:lock-acquire($uri as xs:string, $scope as xs:string?, $depth as xs:string?, $owner as item()*, $timeout as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lock-for-update($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lock-release($uri as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:log($msg as item()*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:log($msg as item()*, $level as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:log-level() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:login($name as xs:string) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:login($name as xs:string, $password as xs:string?) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:login($name as xs:string, $password as xs:string?, $set-session as xs:boolean?) as xs:boolean external;
declare %a:restrict-until("$role-names", "marklogic", "8.0", "xs:string?")
        %a:since("marklogic", "7.0") function xdmp:login($name as xs:string, $password as xs:string?, $set-session as xs:boolean?, $role-names as xs:string*) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:logout() as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:lshift64($x as xs:unsignedLong, $y as xs:integer) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:md5($data as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:md5($data as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:merge() as empty-sequence() external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:merge($options as (node()?|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:merge-cancel($forest-ID as xs:unsignedLong, $merge-ID as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:merging() as xs:unsignedLong* external;
declare %a:since("marklogic", "8.0") %a:until("marklogic", "8.0") function xdmp:mimetypes() as element(mt:mimetype)* external;
declare %a:since("marklogic", "5.0") function xdmp:modules-database() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:modules-root() as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:month-name-from-date($arg as xs:date?) as xs:string? external;
declare %a:since("marklogic", "5.0") function xdmp:mul64($x as xs:unsignedLong, $y as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") function xdmp:multipart-decode($separator as xs:string, $data as binary()) as node()* external;
declare %a:restrict-since("$options", "marklogic", "8.0", "element()")
        %a:since("marklogic", "6.0") function xdmp:multipart-decode($separator as xs:string, $data as binary(), $options as element()) as node()* external;
declare %a:since("marklogic", "6.0") function xdmp:multipart-encode($separator as xs:string, $manifest as element(), $content as node()*) as binary() external;
declare %a:since("marklogic", "8.0") function xdmp:node-collections($node as node()) as xs:string* external;
declare %a:since("marklogic", "5.0") function xdmp:node-database($node as node()) as xs:unsignedLong? external;
declare %a:since("marklogic", "5.0") function xdmp:node-delete($old as node()) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:node-insert-after($sibling as node(), $new as node()) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:node-insert-before($sibling as node(), $new as node()) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:node-insert-child($parent as node(), $new as node()) as empty-sequence() external;
declare %a:restrict-since("$node", "marklogic", "8.0", "node()")
        %a:since("marklogic", "5.0") function xdmp:node-kind($node as node()?) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:node-metadata($node as node()) as map:map? external;
declare %a:since("marklogic", "9.0") function xdmp:node-metadata-value($uri as xs:string, $keyName as xs:string) as xs:string? external;
declare %a:since("marklogic", "8.0") function xdmp:node-permissions($node as node()) as item()* external;
declare %a:since("marklogic", "8.0") function xdmp:node-permissions($node as node(), $output-kind as xs:string) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:node-query-rolesets($uri as xs:string, $root as node()) as element(sec:query-rolesets)* external;
declare %a:since("marklogic", "9.0") function xdmp:node-query-rolesets($uri as xs:string, $root as node(), $insert-options as (element()?|map:map?)) as element(sec:query-rolesets)* external;
declare %a:since("marklogic", "9.0") function xdmp:node-query-rolesets($uri as xs:string, $root as node(), $insert-options as (element()?|map:map?), $options as xs:string*) as element(sec:query-rolesets)* external;
declare %a:since("marklogic", "5.0") function xdmp:node-replace($old as node(), $new as node()) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:node-uri($node as node()) as xs:string? external;
declare %a:since("marklogic", "5.0") function xdmp:not64($x as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:octal-to-integer($octal as xs:string) as xs:integer external;
declare %a:since("marklogic", "5.0") function xdmp:or64($x as xs:unsignedLong, $y as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:parse-dateTime($picture as xs:string, $value as xs:string) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-dateTime($picture as xs:string, $value as xs:string, $language as xs:string?) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$calendar", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-dateTime($picture as xs:string, $value as xs:string, $language as xs:string?, $calendar as xs:string?) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$calendar", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$country", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-dateTime($picture as xs:string, $value as xs:string, $language as xs:string?, $calendar as xs:string?, $country as xs:string?) as xs:dateTime external;
declare %a:since("marklogic", "5.0") function xdmp:parse-yymmdd($picture as xs:string, $value as xs:string) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-yymmdd($picture as xs:string, $value as xs:string, $language as xs:string?) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$calendar", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-yymmdd($picture as xs:string, $value as xs:string, $language as xs:string?, $calendar as xs:string?) as xs:dateTime external;
declare %a:restrict-until("$language", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$calendar", "marklogic", "6.0", "xs:string")
        %a:restrict-until("$country", "marklogic", "6.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:parse-yymmdd($picture as xs:string, $value as xs:string, $language as xs:string?, $calendar as xs:string?, $country as xs:string?) as xs:dateTime external;
declare %a:since("marklogic", "9.0") function xdmp:partition-forests($partition-number as xs:unsignedInt) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:passive-has-privilege($privileges as xs:string*, $kind as xs:string) as xs:boolean external;
declare %a:since("marklogic", "9.0") function xdmp:passive-security-assert($privileges as xs:string*, $kind as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:path($node as node()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:path($node as node(), $include-document as xs:boolean?) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:pdf-convert($doc as node(), $filename as xs:string) as node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:pdf-convert($doc as node(), $filename as xs:string, $options as (node()?|map:map?)) as node()* external;
declare %a:restrict-until("return", "marklogic", "8.0", "element()?")
        %a:since("marklogic", "5.0") function xdmp:permission($role as xs:string, $capability as xs:string) as (element()?|map:map?) external;
declare %a:since("marklogic", "8.0") function xdmp:permission($role as xs:string, $capability as xs:string, $output-kind as xs:string) as (element()|map:map) external;
declare %a:since("marklogic", "5.0") function xdmp:plan($expression as item()*) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:plan($expression as item()*, $maximum as xs:double?) as element() external;
declare %a:restrict-until("$plannable", "marklogic", "8.0", "item()")
        %a:since("marklogic", "7.0") function xdmp:plannable($expression as item()*) as xs:boolean external;
declare %a:since("marklogic", "5.0") function xdmp:platform() as xs:string external;
declare %a:restrict-until("return", "marklogic", "8.0", "xs:integer")
        %a:since("marklogic", "6.0") function xdmp:position($test as xs:string?, $target as xs:string?) as xs:integer? external;
declare %a:restrict-until("return", "marklogic", "8.0", "xs:integer")
        %a:restrict-until("$collation", "marklogic", "8.0", "xs:string")
        %a:since("marklogic", "6.0") function xdmp:position($test as xs:string?, $target as xs:string?, $collation as xs:string?) as xs:integer? external;
declare %a:since("marklogic", "5.0") function xdmp:powerpoint-convert($doc as node(), $filename as xs:string) as node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:powerpoint-convert($doc as node(), $filename as xs:string, $options as (node()?|map:map?)) as node()* external;
declare %a:since("marklogic", "5.0") function xdmp:pretty-print($xquery as xs:string) as xs:string external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:privilege($action as xs:string, $kind as xs:string) as xs:integer external;
declare %a:since("marklogic", "9.0") function xdmp:privilege-kind($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:privilege-name($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:privilege-roles($action as xs:string, $kind as xs:string) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:privileges() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:product-edition() as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:product-environment() as xs:string external;
declare %a:since("marklogic", "6.0") function xdmp:quarter-from-date($arg as xs:date?) as xs:integer? external;
declare %a:since("marklogic", "5.0") function xdmp:query-meters() as element() external;
declare %a:since("marklogic", "9.0") function xdmp:query-partitions($query as cts:query) as xs:unsigned* external;
declare %a:since("marklogic", "5.0") function xdmp:query-trace($enabled as xs:boolean) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:quote($arg as item()*) as xs:string external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:quote($arg as item()*, $options as (node()?|map:map?)) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:random() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:random($max as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:range-partition-forests($value as xs:anyAtomicType) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:redirect-response($name as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:remove-orphaned-binary($forestID as xs:unsignedLong, $binaryID as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:request() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:request-cancel($hostID as xs:unsignedLong, $serverID as xs:unsignedLong, $requestID as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:request-log-delete($key as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:request-log-get($key as xs:string) as item() external;
declare %a:since("marklogic", "9.0") function xdmp:request-log-put($key as xs:string, $value as item()) as empty-sequence() external;
declare %a:restrict-until("$request-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:request-status($host-id as xs:unsignedLong, $server-id as xs:unsignedLong, $request-id as xs:unsignedLong*) as element(request-status) external;
declare %a:since("marklogic", "5.0") function xdmp:request-timestamp() as xs:unsignedLong? external;
declare %a:since("marklogic", "6.0") function xdmp:resolve-uri($relative as xs:string?) as xs:anyURI? external;
declare %a:since("marklogic", "6.0") function xdmp:resolve-uri($relative as xs:string?, $base as xs:string) as xs:anyURI? external;
declare %a:since("marklogic", "5.0") function xdmp:restart($hostIDs as xs:unsignedLong*, $reason as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:rethrow() as empty-sequence() external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:role($role as xs:string) as xs:integer external;
declare %a:since("marklogic", "9.0") function xdmp:role-compartment($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:role-description($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:role-get-default-collections($rolename as xs:string) as xs:string* external;
declare %a:since("marklogic", "9.0") function xdmp:role-get-default-permissions($rolename as xs:string) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:role-get-default-permissions($rolename as xs:string, $output-kind as xs:string) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:role-name($role-id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:role-privileges($roleId as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:role-roles($name as xs:string) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:role-roles($name as xs:string, $inherit as xs:boolean) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:roles() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:rollback() as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:rsa-generate($options as (element()?|map:map?)) as xs:string+ external;
declare %a:since("marklogic", "5.0") function xdmp:rshift64($x as xs:unsignedLong, $y as xs:integer) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:save($path as xs:string, $node as node()) as empty-sequence() external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:save($path as xs:string, $node as node(), $options as (node()?|map:map?)) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:schema-database() as xs:unsignedLong external;
declare %a:restrict-since("$database-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:schema-database($database-id as xs:unsignedLong?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:security-assert($privileges as xs:string*, $kind as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:security-database() as xs:unsignedLong external;
declare %a:restrict-since("$database-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:security-database($database-id as xs:unsignedLong?) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:server() as xs:unsignedLong+ external;
declare %a:since("marklogic", "5.0") function xdmp:server($name as xs:string) as xs:unsignedLong+ external;
declare %a:since("marklogic", "6.0") function xdmp:server($name as xs:string, $group as xs:unsignedLong) as xs:unsignedLong+ external;
declare %a:since("marklogic", "7.0") function xdmp:server-collation($id as xs:unsignedLong) as xs:string? external;
declare %a:since("marklogic", "9.0") function xdmp:server-coordinate-system($id as xs:unsignedLong) as xs:string? external;
declare %a:since("marklogic", "7.0") function xdmp:server-database($id as xs:unsignedLong) as xs:unsignedLong? external;
declare %a:since("marklogic", "7.0") function xdmp:server-default-xquery-version($id as xs:unsignedLong) as xs:string? external;
declare %a:since("marklogic", "7.0") function xdmp:server-group($id as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "9.0") function xdmp:server-kind($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:server-modules-database($id as xs:unsignedLong) as xs:unsignedLong? external;
declare %a:since("marklogic", "5.0") function xdmp:server-name($id as xs:unsignedLong) as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:server-port($id as xs:unsignedLong) as xs:unsignedInt? external;
declare %a:since("marklogic", "7.0") function xdmp:server-root($id as xs:unsignedLong) as xs:string? external;
declare %a:since("marklogic", "7.0") function xdmp:server-ssl-certificate-template($id as xs:unsignedLong) as xs:unsignedLong? external;
declare %a:restrict-until("$server-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:server-status($host-id as xs:unsignedLong, $server-id as xs:unsignedLong*) as element(server-status) external;
declare %a:since("marklogic", "5.0") function xdmp:servers() as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:set($variable as item()*, $expr as item()*) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:set-request-limit($meter-name as xs:string, $limit as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:set-request-limit($meter-name as xs:string, $limit as xs:unsignedLong, $hostID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:set-request-limit($meter-name as xs:string, $limit as xs:unsignedLong, $hostID as xs:unsignedLong?, $serverID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:set-request-limit($meter-name as xs:string, $limit as xs:unsignedLong, $hostID as xs:unsignedLong?, $serverID as xs:unsignedLong?, $requestID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-request-time-limit($time-limit as xs:unsignedInt) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-request-time-limit($time-limit as xs:unsignedInt, $hostID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-request-time-limit($time-limit as xs:unsignedInt, $hostID as xs:unsignedLong?, $serverID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-request-time-limit($time-limit as xs:unsignedInt, $hostID as xs:unsignedLong?, $serverID as xs:unsignedLong?, $requestID as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-response-code($code as xs:integer, $message as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-response-content-type($name as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-response-encoding($encoding as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:set-response-output-method($method as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-server-field($name as xs:string, $value as item()*) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:set-server-field-privilege($name as xs:string, $privilege as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:set-session-field($name as xs:string, $value as item()*) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:set-transaction-mode($value as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:set-transaction-name($name as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:set-transaction-name($name as xs:string, $host-id as xs:unsignedLong) as empty-sequence() external;
declare %a:restrict-until("$host-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:restrict-since("$host-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:restrict-until("$txn-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:restrict-since("$txn-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:set-transaction-name($name as xs:string, $host-id as xs:unsignedLong?, $txn-id as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:set-transaction-time-limit($time-limit as xs:unsignedInt) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:set-transaction-time-limit($time-limit as xs:unsignedInt, $host-id as xs:unsignedLong) as empty-sequence() external;
declare %a:restrict-until("$host-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:restrict-since("$host-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:restrict-until("$txn-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:restrict-since("$txn-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:set-transaction-time-limit($time-limit as xs:unsignedInt, $host-id as xs:unsignedLong?, $txn-id as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:sha1($data as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:sha1($data as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:sha256($data as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:sha256($data as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:sha384($data as item()) as xs:string external;
declare %a:since("marklogic", "7.0") function xdmp:sha384($data as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:sha512($data as item()) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:sha512($data as item(), $encoding as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:shutdown($hostIDs as xs:unsignedLong*, $reason as xs:string) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:shutdown($hostIDs as xs:unsignedLong*, $reason as xs:string, $failover as xs:boolean) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:sleep($msec as xs:unsignedInt) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:software-version() as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:spawn($path as xs:string) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:since("marklogic", "5.0") function xdmp:spawn($path as xs:string, $vars as (item()*|map:map?)) as item()* external;
declare %a:restrict-until("$vars", "marklogic", "9.0", "item()*")
        %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:spawn($path as xs:string, $vars as (item()*|map:map?), $options as (node()?|map:map?)) as item()* external;
declare %a:since("marklogic", "7.0") function xdmp:spawn-function($function as function() as item()*) as item()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "7.0") function xdmp:spawn-function($function as function() as item()*, $options as (node()?|map:map?)) as item()* external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:spawn#3") function xdmp:spawn-in($path as xs:string, $ID as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:spawn#3") function xdmp:spawn-in($path as xs:string, $ID as xs:unsignedLong, $vars as item()*) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:spawn#3") function xdmp:spawn-in($path as xs:string, $ID as xs:unsignedLong, $vars as item()*, $modules as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") %a:deprecated("marklogic", "5.0", "xdmp:spawn#3") function xdmp:spawn-in($path as xs:string, $ID as xs:unsignedLong, $vars as item()*, $modules as xs:unsignedLong?, $root as xs:string?) as empty-sequence() external;
declare %a:since("marklogic", "6.0") function xdmp:sql($sql as xs:string) as item()* external;
declare %a:since("marklogic", "6.0") function xdmp:sql($sql as xs:string, $options as xs:string*) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:sql($sql as xs:string, $options as xs:string*, $bindings as map:map?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:sql($sql as xs:string, $options as xs:string*, $bindings as map:map?, $query as cts:query?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:sql-plan($sql as xs:string) as element() external;
declare %a:since("marklogic", "9.0") function xdmp:sql-plan($sql as xs:string, $options as xs:string*) as element() external;
declare %a:since("marklogic", "5.0") function xdmp:start-journal-archiving($forestIDs as xs:unsignedInt*, $journal-archive-path as xs:string) as empty-sequence() external;
declare %a:restrict-until("$lag-limit", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:start-journal-archiving($forestIDs as xs:unsignedInt*, $journal-archive-path as xs:string, $lag-limit as xs:unsignedLong?) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:step64($initial as xs:unsignedLong, $step as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "5.0") function xdmp:stop-journal-archiving($forestIDs as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:strftime($format as xs:string, $value as xs:dateTime) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:subbinary($source as binary(), $starting-location as xs:double) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:subbinary($source as binary(), $starting-location as xs:double, $length as xs:double) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:tidy($doc as xs:string) as node()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:tidy($doc as xs:string, $options as (node()?|map:map?)) as node()+ external;
declare %a:since("marklogic", "5.0") function xdmp:timestamp-to-wallclock($timestamp as xs:unsignedLong) as xs:dateTime external;
declare %a:restrict-until("return", "marklogic", "8.0", "xs:string")
        %a:restrict-since("return", "marklogic", "8.0", "document-node()")
        %a:since("marklogic", "5.0") %a:see-also("marklogic", "8.0", "xdmp:to-json-string#1") function xdmp:to-json($item as item()*) as (xs:string|document-node()) external;
declare %a:since("marklogic", "8.0") function xdmp:to-json-string($item as item()*) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:trace($name as xs:string, $value as item()*) as empty-sequence() external;
declare %a:since("marklogic", "8.0") function xdmp:trace-enabled($name as xs:string) as xs:boolean external;
declare %a:since("marklogic", "8.0") function xdmp:transaction() as xs:unsignedLong* external;
declare %a:since("marklogic", "8.0") function xdmp:transaction($txn-name as xs:string) as xs:unsignedLong* external;
declare %a:restrict-until("$txn-name", "marklogic", "6.0", "xs:string")
        %a:restrict-since("$txn-name", "marklogic", "8.0", "xs:string")
        %a:restrict-until("$host-id", "marklogic", "6.0", "xs:unsignedLong")
        %a:restrict-since("$host-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:transaction($txn-name as xs:string?, $host-id as xs:unsignedLong?) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:transaction-commit($host-id as xs:unsignedLong, $txn-id as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "9.0") function xdmp:transaction-locks() as element(transaction-locks) external;
declare %a:since("marklogic", "9.0") function xdmp:transaction-locks($host-id as xs:unsignedLong) as element(transaction-locks) external;
declare %a:since("marklogic", "9.0") function xdmp:transaction-locks($host-id as xs:unsignedLong, $txn-id as xs:unsignedLong) as element(transaction-locks) external;
declare %a:since("marklogic", "5.0") function xdmp:transaction-rollback($host-id as xs:unsignedLong, $txn-id as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:triggers-database() as xs:unsignedLong external;
declare %a:restrict-since("$database-id", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:triggers-database($database-id as xs:unsignedLong?) as xs:unsignedLong external;
declare %a:since("marklogic", "7.0") function xdmp:type($value as xs:anyAtomicType) as xs:QName external;
declare %a:since("marklogic", "5.0") function xdmp:unpath($expr as xs:string) as item()* external;
declare %a:restrict-until("$map", "marklogic", "9.0", "map:map")
        %a:since("marklogic", "8.0") function xdmp:unpath($expr as xs:string, $map as map:map?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:unpath($expr as xs:string, $map as map:map?, $context as node()?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:unquote($arg as xs:string) as document-node()+ external;
declare %a:since("marklogic", "5.0") function xdmp:unquote($arg as xs:string, $default-namespace as xs:string?) as document-node()+ external;
declare %a:since("marklogic", "5.0") function xdmp:unquote($arg as xs:string, $default-namespace as xs:string?, $options as xs:string*) as document-node()+ external;
declare %a:since("marklogic", "5.0") function xdmp:uri-content-type($uri as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:uri-format($uri as xs:string) as xs:string external;
declare %a:restrict-until("$uri", "marklogic", "8.0", "xs:string")
        %a:since("marklogic", "5.0") function xdmp:uri-is-file($uri as xs:string?) as xs:boolean? external;
declare %a:since("marklogic", "5.0") function xdmp:url-decode($encoded as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:url-encode($plaintext as xs:string) as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:url-encode($plaintext as xs:string, $noSpacePlus as xs:boolean?) as xs:string external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "5.0") function xdmp:user($user as xs:string) as xs:integer external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "7.0") function xdmp:user($user as xs:string, $extSecId as xs:unsignedLong) as xs:integer external;
declare %a:restrict-since("return", "marklogic", "8.0", "xs:unsignedLong")
        %a:since("marklogic", "7.0") function xdmp:user($user as xs:string, $extSecId as xs:unsignedLong, $secDbFirst as xs:boolean) as xs:integer external;
declare %a:since("marklogic", "7.0") function xdmp:user-external-security($user-id as xs:unsignedLong) as element(external-user)? external;
declare %a:since("marklogic", "9.0") function xdmp:user-get-default-collections($username as xs:string) as xs:string* external;
declare %a:since("marklogic", "9.0") function xdmp:user-get-default-permissions($username as xs:string) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:user-get-default-permissions($username as xs:string, $output-kind as xs:string) as item()* external;
declare %a:since("marklogic", "8.0") %a:until("marklogic", "9.0") function xdmp:user-last-login() as element(last-login)? external;
declare %a:since("marklogic", "5.0") function xdmp:user-last-login($user as xs:unsignedLong) as element(last-login)? external;
declare %a:since("marklogic", "9.0") function xdmp:user-privileges($user as xs:string) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:user-privileges($user as xs:string, $extSecId as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "9.0") function xdmp:user-privileges($user as xs:string, $extSecId as xs:unsignedLong, $secDbFirst as xs:boolean) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:user-roles($name as xs:string) as xs:unsignedLong* external;
declare %a:since("marklogic", "7.0") function xdmp:user-roles($name as xs:string, $extSecId as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "7.0") function xdmp:user-roles($name as xs:string, $extSecId as xs:unsignedLong, $secDbFirst as xs:boolean) as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:userid-roles($userId as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:userid-roles($userId as xs:unsignedLong, $extSecId as xs:unsignedLong) as xs:unsignedLong* external;
declare %a:since("marklogic", "6.0") function xdmp:userid-roles($userId as xs:unsignedLong, $extSecId as xs:unsignedLong, $secDbFirst as xs:boolean) as xs:unsignedLong* external;
declare %a:since("marklogic", "5.0") function xdmp:validate($node as node()) as element(xdmp:validation-errors) external;
declare %a:since("marklogic", "5.0") function xdmp:validate($node as node(), $mode as xs:string) as element(xdmp:validation-errors) external;
declare %a:since("marklogic", "5.0") function xdmp:validate($node as node(), $mode as xs:string, $typeName as xs:QName) as element(xdmp:validation-errors) external;
declare %a:since("marklogic", "5.0") function xdmp:value($expr as xs:string) as item()* external;
declare %a:restrict-until("$map", "marklogic", "9.0", "map:map")
        %a:since("marklogic", "8.0") function xdmp:value($expr as xs:string, $map as map:map?) as item()* external;
declare %a:since("marklogic", "9.0") function xdmp:value($expr as xs:string, $map as map:map?, $context as item()?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:version() as xs:string external;
declare %a:since("marklogic", "5.0") function xdmp:wallclock-to-timestamp($timestamp as xs:dateTime) as xs:unsignedLong external;
declare %a:since("marklogic", "6.0") function xdmp:week-from-date($arg as xs:date?) as xs:integer? external;
declare %a:since("marklogic", "6.0") function xdmp:weekday-from-date($arg as xs:date?) as xs:integer? external;
declare %a:restrict-until("return", "marklogic", "8.0", "xs:string*")
        %a:since("marklogic", "5.0") function xdmp:with-namespaces($nsbindings as (xs:string*|map:map?), $expr as item()*) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:word-convert($doc as node(), $filename as xs:string) as node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:word-convert($doc as node(), $filename as xs:string, $options as (node()?|map:map?)) as node()* external;
declare %a:since("marklogic", "5.0") function xdmp:x509-certificate-extract($cert as xs:string) as element()? external;
declare %a:since("marklogic", "9.0") function xdmp:x509-certificate-generate($cert as element(x509:cert)) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:x509-certificate-generate($cert as element(x509:cert), $private-key as xs:string?) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:x509-certificate-generate($cert as element(x509:cert), $private-key as xs:string?, $options as (element()?|map:map?)) as xs:string external;
declare %a:since("marklogic", "9.0") function xdmp:x509-certificate-issuer-name($cert as xs:string) as element()? external;
declare %a:since("marklogic", "9.0") function xdmp:x509-certificate-subject-name($cert as xs:string) as element()? external;
declare %a:since("marklogic", "5.0") function xdmp:xa-complete($forestID as xs:unsignedLong, $txn-id as xs:unsignedLong, $commit as xs:boolean, $remember as xs:boolean) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:xa-forget($forestID as xs:unsignedLong, $txn-id as xs:unsignedLong) as empty-sequence() external;
declare %a:since("marklogic", "5.0") function xdmp:xor64($x as xs:unsignedLong, $y as xs:unsignedLong) as xs:unsignedLong external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:xquery-eval($xquery as xs:string) as item()* external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:xquery-eval($xquery as xs:string, $vars as Object?) as item()* external;
declare %a:since("marklogic", "8.0") %a:language("javascript") function xdmp:xquery-eval($xquery as xs:string, $vars as Object?, $options as Object?) as item()* external;
declare %a:since("marklogic", "5.0") function xdmp:xquery-version() as xs:string external;
declare %a:since("marklogic", "8.0") function xdmp:xslt-eval($stylesheet as node()) as document-node()* external;
declare %a:restrict-until("$stylesheet", "marklogic", "8.0", "element()")
        %a:since("marklogic", "5.0") function xdmp:xslt-eval($stylesheet as node(), $input as node()?) as document-node()* external;
declare %a:restrict-until("$stylesheet", "marklogic", "8.0", "element()")
        %a:since("marklogic", "5.0") function xdmp:xslt-eval($stylesheet as node(), $input as node()?, $params as map:map?) as document-node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:restrict-until("$stylesheet", "marklogic", "8.0", "element()")
        %a:since("marklogic", "5.0") function xdmp:xslt-eval($stylesheet as node(), $input as node()?, $params as map:map?, $options as (node()?|map:map?)) as document-node()* external;
declare %a:since("marklogic", "8.0") function xdmp:xslt-invoke($path as xs:string) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:xslt-invoke($path as xs:string, $input as node()?) as document-node()* external;
declare %a:since("marklogic", "5.0") function xdmp:xslt-invoke($path as xs:string, $input as node()?, $params as map:map?) as document-node()* external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:xslt-invoke($path as xs:string, $input as node()?, $params as map:map?, $options as (node()?|map:map?)) as document-node()* external;
declare %a:since("marklogic", "6.0") function xdmp:yearday-from-date($arg as xs:date?) as xs:integer? external;
declare %a:since("marklogic", "5.0") function xdmp:zip-create($manifest as node(), $nodes as node()+) as binary() external;
declare %a:since("marklogic", "5.0") function xdmp:zip-get($zipfile as binary(), $name as xs:string) as node()+ external;
declare %a:restrict-until("$options", "marklogic", "8.0", "node()?")
        %a:restrict-since("$options", "marklogic", "8.0", "(element()?|map:map?)")
        %a:since("marklogic", "5.0") function xdmp:zip-get($zipfile as binary(), $name as xs:string, $options as (node()?|map:map?)) as node()+ external;
declare %a:restrict-since("return", "marklogic", "8.0", "element()")
        %a:since("marklogic", "5.0") function xdmp:zip-manifest($zipfile as binary()) as node() external;