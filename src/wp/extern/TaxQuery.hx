package wp.extern;

@:native("WP_Tax_Query")
extern class TaxQuery {
  /**
    
     Array of taxonomy queries.
    
     See WP_Tax_Query::__construct() for information on tax query arguments.
    
     @since 3.1.0
     @var array
    
  **/
  @:native("queries") public var queries:php.NativeStructArray<Dynamic>;
  /**
    
     The relation between the queries. Can be one of 'AND' or 'OR'.
    
     @since 3.1.0
     @var string
    
  **/
  @:native("relation") public var relation:String;
  /**
    
     Terms and taxonomies fetched by this query.
    
     We store this data in a flat array because they are referenced in a
     number of places by WP_Query.
    
     @since 4.1.0
     @var array
    
  **/
  @:native("queried_terms") public var queriedTerms:php.NativeStructArray<Dynamic>;
  /**
    
     Database table that where the metadata's objects are stored (eg $wpdb->users).
    
     @since 4.1.0
     @var string
    
  **/
  @:native("primary_table") public var primaryTable:String;
  /**
    
     Column in 'primary_table' that represents the ID of the object.
    
     @since 4.1.0
     @var string
    
  **/
  @:native("primary_id_column") public var primaryIdColumn:String;
  /**
    
     Constructor.
    
     @since 3.1.0
     @since 4.1.0 Added support for `$operator` 'NOT EXISTS' and 'EXISTS' values.
    
     @param array $tax_query {
         Array of taxonomy query clauses.
    
         @type string $relation Optional. The MySQL keyword used to join
                                the clauses of the query. Accepts 'AND', or 'OR'. Default 'AND'.
         @type array {
             Optional. An array of first-order clause parameters, or another fully-formed tax query.
    
             @type string           $taxonomy         Taxonomy being queried. Optional when field=term_taxonomy_id.
             @type string|int|array $terms            Term or terms to filter by.
             @type string           $field            Field to match $terms against. Accepts 'term_id', 'slug',
                                                     'name', or 'term_taxonomy_id'. Default: 'term_id'.
             @type string           $operator         MySQL operator to be used with $terms in the WHERE clause.
                                                      Accepts 'AND', 'IN', 'NOT IN', 'EXISTS', 'NOT EXISTS'.
                                                      Default: 'IN'.
             @type bool             $include_children Optional. Whether to include child terms.
                                                      Requires a $taxonomy. Default: true.
         }
     }
    
  **/
  public function new(tax_query:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Ensure the 'tax_query' argument passed to the class constructor is well-formed.
    
     Ensures that each query-level clause has a 'relation' key, and that
     each first-order clause contains all the necessary keys from `$defaults`.
    
     @since 4.1.0
    
     @param array $queries Array of queries clauses.
     @return array Sanitized array of query clauses.
    
  **/
  @:native("sanitize_query") public function sanitizeQuery(queries:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Sanitize a 'relation' operator.
    
     @since 4.1.0
    
     @param string $relation Raw relation key from the query argument.
     @return string Sanitized relation ('AND' or 'OR').
    
  **/
  @:native("sanitize_relation") public function sanitizeRelation(relation:String):String;
  /**
    
     Generates SQL clauses to be appended to a main query.
    
     @since 3.1.0
    
     @param string $primary_table     Database table where the object being filtered is stored (eg wp_users).
     @param string $primary_id_column ID column for the filtered object in $primary_table.
     @return array {
         Array containing JOIN and WHERE SQL clauses to append to the main query.
    
         @type string $join  SQL fragment to append to the main JOIN clause.
         @type string $where SQL fragment to append to the main WHERE clause.
     }
    
  **/
  @:native("get_sql") public function getSql(primary_table:String, primary_id_column:String):php.NativeArray;
  /**
    
     Generate SQL JOIN and WHERE clauses for a "first-order" query clause.
    
     @since 4.1.0
    
     @global wpdb $wpdb The WordPress database abstraction object.
    
     @param array $clause       Query clause (passed by reference).
     @param array $parent_query Parent query array.
     @return array {
         Array containing JOIN and WHERE SQL clauses to append to a first-order query.
    
         @type string $join  SQL fragment to append to the main JOIN clause.
         @type string $where SQL fragment to append to the main WHERE clause.
     }
    
  **/
  @:native("get_sql_for_clause") public function getSqlForClause(clause:php.NativeStructArray<Dynamic>, parent_query:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Transforms a single query, from one field to another.
    
     Operates on the `$query` object by reference. In the case of error,
     `$query` is converted to a WP_Error object.
    
     @since 3.2.0
    
     @global wpdb $wpdb The WordPress database abstraction object.
    
     @param array  $query           The single query. Passed by reference.
     @param string $resulting_field The resulting field. Accepts 'slug', 'name', 'term_taxonomy_id',
                                    or 'term_id'. Default 'term_id'.
    
  **/
  @:native("transform_query") public function transformQuery(query:php.NativeStructArray<Dynamic>, resulting_field:String):Void;
}
