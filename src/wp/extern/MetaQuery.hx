package wp.extern;

@:native("WP_Meta_Query")
extern class MetaQuery {
  /**
    
     Array of metadata queries.
    
     See WP_Meta_Query::__construct() for information on meta query arguments.
    
     @since 3.2.0
     @var array
    
  **/
  @:native("queries") public var queries:php.NativeStructArray<Dynamic>;
  /**
    
     The relation between the queries. Can be one of 'AND' or 'OR'.
    
     @since 3.2.0
     @var string
    
  **/
  @:native("relation") public var relation:String;
  /**
    
     Database table to query for the metadata.
    
     @since 4.1.0
     @var string
    
  **/
  @:native("meta_table") public var metaTable:String;
  /**
    
     Column in meta_table that represents the ID of the object the metadata belongs to.
    
     @since 4.1.0
     @var string
    
  **/
  @:native("meta_id_column") public var metaIdColumn:String;
  /**
    
     Database table that where the metadata's objects are stored (eg $wpdb->users).
    
     @since 4.1.0
     @var string
    
  **/
  @:native("primary_table") public var primaryTable:String;
  /**
    
     Column in primary_table that represents the ID of the object.
    
     @since 4.1.0
     @var string
    
  **/
  @:native("primary_id_column") public var primaryIdColumn:String;
  /**
    
     Constructor.
    
     @since 3.2.0
     @since 4.2.0 Introduced support for naming query clauses by associative array keys.
     @since 5.1.0 Introduced $compare_key clause parameter, which enables LIKE key matches.
    
     @param array $meta_query {
         Array of meta query clauses. When first-order clauses or sub-clauses use strings as
         their array keys, they may be referenced in the 'orderby' parameter of the parent query.
    
         @type string $relation Optional. The MySQL keyword used to join
                                the clauses of the query. Accepts 'AND', or 'OR'. Default 'AND'.
         @type array {
             Optional. An array of first-order clause parameters, or another fully-formed meta query.
    
             @type string $key         Meta key to filter by.
             @type string $compare_key MySQL operator used for comparing the $key. Accepts '=' and 'LIKE'.
                                       Default '='.
             @type string $value       Meta value to filter by.
             @type string $compare     MySQL operator used for comparing the $value. Accepts '=',
                                       '!=', '>', '>=', '<', '<=', 'LIKE', 'NOT LIKE',
                                       'IN', 'NOT IN', 'BETWEEN', 'NOT BETWEEN', 'REGEXP',
                                       'NOT REGEXP', 'RLIKE', 'EXISTS' or 'NOT EXISTS'.
                                       Default is 'IN' when `$value` is an array, '=' otherwise.
             @type string $type        MySQL data type that the meta_value column will be CAST to for
                                       comparisons. Accepts 'NUMERIC', 'BINARY', 'CHAR', 'DATE',
                                       'DATETIME', 'DECIMAL', 'SIGNED', 'TIME', or 'UNSIGNED'.
                                       Default is 'CHAR'.
         }
     }
    
  **/
  public function new(meta_query:php.NativeStructArray<Dynamic> = false):Void;
  /**
    
     Ensure the 'meta_query' argument passed to the class constructor is well-formed.
    
     Eliminates empty items and ensures that a 'relation' is set.
    
     @since 4.1.0
    
     @param array $queries Array of query clauses.
     @return array Sanitized array of query clauses.
    
  **/
  @:native("sanitize_query") public function sanitizeQuery(queries:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Constructs a meta query based on 'meta_*' query vars
    
     @since 3.2.0
    
     @param array $qv The query variables
    
  **/
  @:native("parse_query_vars") public function parseQueryVars(qv:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Return the appropriate alias for the given meta type if applicable.
    
     @since 3.7.0
    
     @param string $type MySQL type to cast meta_value.
     @return string MySQL type.
    
  **/
  @:native("get_cast_for_type") public function getCastForType(type:String = ''):String;
  /**
    
     Generates SQL clauses to be appended to a main query.
    
     @since 3.2.0
    
     @param string $type              Type of meta, eg 'user', 'post'.
     @param string $primary_table     Database table where the object being filtered is stored (eg wp_users).
     @param string $primary_id_column ID column for the filtered object in $primary_table.
     @param object $context           Optional. The main query object.
     @return false|array {
         Array containing JOIN and WHERE SQL clauses to append to the main query.
    
         @type string $join  SQL fragment to append to the main JOIN clause.
         @type string $where SQL fragment to append to the main WHERE clause.
     }
    
  **/
  @:native("get_sql") public function getSql(type:String, primary_table:String, primary_id_column:String, context:Dynamic = null):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Generate SQL JOIN and WHERE clauses for a first-order query clause.
    
     "First-order" means that it's an array with a 'key' or 'value'.
    
     @since 4.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $clause       Query clause (passed by reference).
     @param array  $parent_query Parent query array.
     @param string $clause_key   Optional. The array key used to name the clause in the original `$meta_query`
                                 parameters. If not provided, a key will be generated automatically.
     @return array {
         Array containing JOIN and WHERE SQL clauses to append to a first-order query.
    
         @type string $join  SQL fragment to append to the main JOIN clause.
         @type string $where SQL fragment to append to the main WHERE clause.
     }
    
  **/
  @:native("get_sql_for_clause") public function getSqlForClause(clause:php.NativeStructArray<Dynamic>, parent_query:php.NativeStructArray<Dynamic>, clause_key:String):php.NativeArray;
  /**
    
     Get a flattened list of sanitized meta clauses.
    
     This array should be used for clause lookup, as when the table alias and CAST type must be determined for
     a value of 'orderby' corresponding to a meta clause.
    
     @since 4.2.0
    
     @return array Meta clauses.
    
  **/
  @:native("get_clauses") public function getClauses():php.NativeArray;
  /**
    
     Checks whether the current query has any OR relations.
    
     In some cases, the presence of an OR relation somewhere in the query will require
     the use of a `DISTINCT` or `GROUP BY` keyword in the `SELECT` clause. The current
     method can be used in these cases to determine whether such a clause is necessary.
    
     @since 4.3.0
    
     @return bool True if the query contains any `OR` relations, otherwise false.
    
  **/
  @:native("has_or_relation") public function hasOrRelation():Bool;
}
